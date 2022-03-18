unit uJoin;

interface

uses
  Generics.Collections;

type
  TJoinKind = (jkInner, jkLeft, jkRight, jkFull);

  TDatasetJoinType = record
    JoinKind: TJoinKind;
    SourceTable: String;
    SourceField: String;
    TargetTable: String;
    TargetField: String;
    constructor Create(AJoinKind: TJoinKind; ASourceTable, ATargetTable, ASourceField, ATargetField: string);
  end;
  TDatasetJoinsDef = TList<TDatasetJoinType>;

  IDatasetJoin = Interface
    function AsString: String;
    procedure Add(ADatasetJoinType: TDatasetJoinType);
    //procedure Add(AJoinKind: TJoinKind; ASourceTable, ATargetTable, ASourceField, ATargetField: string);
  End;

  TDatasetJoin = class(TInterfacedObject, IDatasetJoin)
  private
    FJoins: TDatasetJoinsDef;
  public
    constructor Create;
    destructor Destroy; override;
    function AsString: string;
    //procedure Add(AJoinKind: TJoinKind; ASourceTable, ATargetTable, ASourceField, ATargetField: string);
    procedure Add(ADatasetJoinType: TDatasetJoinType);
    class function New: IDatasetJoin;
  end;
implementation

uses
  System.Classes, System.SysUtils;

{ TDatasetJoin }

{procedure TDatasetJoin.Add(AJoinKind: TJoinKind; ASourceTable, ATargetTable,
  ASourceField, ATargetField: string);
var
  DatasetJoinType: TDatasetJoinType;
begin
  DatasetJoinType.JoinKind    := AJoinKind;
  DatasetJoinType.SourceTable := ASourceTable;
  DatasetJoinType.SourceField := ASourceField;
  DatasetJoinType.TargetTable := ATargetTable;
  DatasetJoinType.TargetField := ATargetField;

  FJoins.Add(DatasetJoinType);
end;
 }
procedure TDatasetJoin.Add(ADatasetJoinType: TDatasetJoinType);
begin
  FJoins.Add(ADatasetJoinType);
end;

function TDatasetJoin.AsString: string;

  function JoinKindToStr(AJoinKind: TJoinKind): String;
  begin
    case AJoinKind of
      jkInner: Result := 'inner join ';
      jkLeft:  Result := 'left join ';
      jkRight: Result := 'right join ';
      jkFull:  Result := 'full join ';
    end;
  end;

var
  I: Integer;
begin
  Result := '';
  for I := 0 to FJoins.Count-1 do
    Result := Result +
      Format('%s %s %s on %s.%s = %s.%s', [
        JoinKindToStr(FJoins[I].JoinKind), FJoins[I].TargetTable,
        'T'+(I+1).ToString, 'T'+(I+1).ToString, FJoins[I].TargetField, 'T0',
        FJoins[I].SourceField]) + sLineBreak;
end;

constructor TDatasetJoin.Create;
begin
  FJoins := TDatasetJoinsDef.Create;
end;

destructor TDatasetJoin.Destroy;
begin
  FJoins.Free;
  inherited;
end;

class function TDatasetJoin.New: IDatasetJoin;
begin
  Result := Self.Create();
end;

{ TDatasetJoinType }

constructor TDatasetJoinType.Create(AJoinKind: TJoinKind; ASourceTable,
  ATargetTable, ASourceField, ATargetField: string);
begin
  JoinKind := AJoinKind;
  SourceTable := ASourceTable;
  SourceField := ASourceField;
  TargetTable := ATargetTable;
  TargetField := ATargetField;
end;

end.
