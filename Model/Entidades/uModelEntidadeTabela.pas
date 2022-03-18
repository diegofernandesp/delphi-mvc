unit uModelEntidadeTabela;

interface

uses
  uInterface, Data.DB, uFilter, uJoin;

type
  TModelEntidadeTabela = class(TInterfacedObject, IModelEntidade)
  private
    FFormatedFilters: string;
    FFieldList: String;
    FOrderByList: String;
    DatasetJoin: IDatasetJoin;
    function GetFormatedSql: String;
  protected
    var TableName: String;
    FQuery: iModelQuery;
  public
    constructor Create; virtual;
    function DataSet(aValue : TDataSource) : IModelEntidade;
    procedure Open; overload;
    function Filter(ADatasetFilter: IDatasetFilter): IModelEntidade;
    function Select(AFields: array of string): IModelEntidade;
    function OrderBy(AFields: array of string): IModelEntidade;
    function Join(AJoinKind: TJoinKind; ATargetTable: string; ASourceField: string;
      ATargetField: string): IModelEntidade;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, System.SysUtils,
  System.StrUtils, Vcl.Dialogs;

{ TModelEntidadeProduto }

constructor TModelEntidadeTabela.Create;
begin
  DatasetJoin := TDatasetJoin.Create;
end;

function TModelEntidadeTabela.DataSet(aValue: TDataSource): IModelEntidade;
begin
  Result := Self;
  aValue.DataSet := TDataSet(FQuery.Query);
end;

function TModelEntidadeTabela.Filter(
  ADatasetFilter: IDatasetFilter): IModelEntidade;
begin
  Result := Self;
  FFormatedFilters := ADatasetFilter.AsSql;
end;

function TModelEntidadeTabela.GetFormatedSql: String;
begin
  Result := 'select ' + FFieldList + ' from ' + TableName + ' T0' + sLineBreak
    + DatasetJoin.AsString
    + FFormatedFilters + sLineBreak
    + IfThen(not FOrderByList.IsEmpty, 'order by ' + FOrderByList, '');
end;

function TModelEntidadeTabela.Join(AJoinKind: TJoinKind; ATargetTable, ASourceField,
  ATargetField: string): IModelEntidade;
begin
  Result := Self;

  DatasetJoin.Add(
    TDatasetJoinType.Create(AJoinKind, TableName, ATargetTable, ASourceField, ATargetField)
  );
end;

procedure TModelEntidadeTabela.Open;
begin
  FQuery.Open(GetFormatedSql);
end;

function TModelEntidadeTabela.OrderBy(AFields: array of string): IModelEntidade;
var
  Field: String;
begin
  Result := Self;

  FOrderByList := '';
  for Field in AFields do
    FOrderByList := FOrderByList + Field + ', ';

  Delete(FOrderByList, Length(FOrderByList)-1, 2);
end;

function TModelEntidadeTabela.Select(AFields: array of string): IModelEntidade;
var
  Field: String;
begin
  Result := Self;

  FFieldList := '';
  for Field in AFields do
    FFieldList := FFieldList + Field + ', ';

  Delete(FFieldList, Length(FFieldList)-1, 2);
end;

end.
