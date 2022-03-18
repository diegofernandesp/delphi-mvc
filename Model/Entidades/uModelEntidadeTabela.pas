unit uModelEntidadeTabela;

interface

uses
  uInterface, Data.DB, uFilters;

Type
  TModelEntidadeTabela = class(TInterfacedObject, IModelEntidade)
  private
    FFormatedFilters: string;
  protected
    var TableName: String;
    FQuery: iModelQuery;
    FSQL: String;
    FFieldList: String;
    FOrderByList: String;
    function GetFormatedSql: String;
  public
    function DataSet(aValue : TDataSource) : IModelEntidade;
    procedure Open; overload;
    function Filter(ADatasetFilter: IDatasetFilter): IModelEntidade;
    function Select(AFields: array of string): IModelEntidade;
    function OrderBy(AFields: array of string): IModelEntidade;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, System.SysUtils,
  System.StrUtils;

{ TModelEntidadeProduto }

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
  Result := 'select ' + FFieldList + ' from ' + TableName + sLineBreak
    + FFormatedFilters + sLineBreak
    + IfThen(not FOrderByList.IsEmpty, 'order by ' + FOrderByList, '');
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
