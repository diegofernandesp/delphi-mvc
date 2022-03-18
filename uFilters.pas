unit uFilters;

interface

uses
  System.Generics.Collections;

type
  TDatasetFilterKind = (dfEqual, dfNEqual, dfIn, dfNIn,
    dfGreaterThan, dfLessThan, dfGreaterThanOrEqualTo, dfLessThanOrEqualTo);

  TDatasetFilterDef = record
    Column: String;
    Kind: TDatasetFilterKind;
    Value: Variant;
  end;
  TDatasetFiltersDef = TList<TDatasetFilterDef>;

  IDatasetFilter = interface
    function AsSql: String;
    procedure Add(AColumn: String; AType: TDatasetFilterKind; AValue: Variant);
    procedure Clear;
  end;

  TDatasetFilter = class(TInterfacedObject, IDatasetFilter)
  FFilters: TDatasetFiltersDef;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(AColumn: string; AKind: TDatasetFilterKind; AValue: Variant);
    function AsSql: string;
    procedure Clear;
  end;

  function FilterKindToStr(ADatasetFilterType: TDatasetFilterKind): string;

implementation

uses
  System.Variants, System.SysUtils;

function FilterKindToStr(ADatasetFilterType: TDatasetFilterKind): string;
begin
  case ADatasetFilterType of
    dfEqual:                Result := ' = ';
    dfNEqual:               Result := ' <> ';
    dfIn:                   Result := ' in ';
    dfNIn:                  Result := ' not in ';
    dfGreaterThan:          Result := ' > ';
    dfLessThan:             Result := ' < ';
    dfGreaterThanOrEqualTo: Result := ' >= ';
    dfLessThanOrEqualTo:    Result := ' <= ';
  end;
end;

{ TDatasetFilter }

procedure TDatasetFilter.Add(AColumn: string; AKind: TDatasetFilterKind;
  AValue: Variant);
var
  Filter: TDatasetFilterDef;
begin
  Filter.Column := AColumn;
  Filter.Kind := AKind;
  Filter.Value := AValue;
  FFilters.Add(Filter);
end;

function TDatasetFilter.AsSql: string;
var
  StrFilter: string;

  function GetFormatedParamValue(AParamValue: Variant): string;
  begin
    if VarIsNumeric(AParamValue) then
      Result := VarToStr(AParamValue)
    else if VarIsStr(AParamValue) then
      Result := QuotedStr(VarToStr(AParamValue))
    else if VarIsNull(AParamValue) then
      Result := QuotedStr('');
  end;

  procedure DefineFilters;
  var
    Filter: TDatasetFilterDef;
  begin
    StrFilter := sLineBreak + 'where 1=1';
    for Filter in FFilters do
      StrFilter := StrFilter + sLineBreak + 'and '
      + Filter.Column + FilterKindToStr(Filter.Kind) + GetFormatedParamValue(Filter.Value);
  end;

begin
  DefineFilters;
  Result := StrFilter;
end;

procedure TDatasetFilter.Clear;
begin
  FFilters.Clear;
end;

constructor TDatasetFilter.Create;
begin
  FFilters := TDatasetFiltersDef.Create;
end;

destructor TDatasetFilter.Destroy;
begin
  FFilters.Free;
  inherited;
end;

end.
