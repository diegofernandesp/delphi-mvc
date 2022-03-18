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
  public
    function DataSet(aValue : TDataSource) : IModelEntidade;
    procedure Open(ADatasetFilter: IDatasetFilter); overload;
    procedure Open; overload;
    constructor Create; virtual;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, StrUtils, System.SysUtils;

{ TModelEntidadeProduto }

constructor TModelEntidadeTabela.Create;
begin
  FSQL := Format('select * from %s', [TableName]);
end;

function TModelEntidadeTabela.DataSet(aValue: TDataSource): IModelEntidade;
begin
  Result := Self;
  aValue.DataSet := TDataSet(FQuery.Query);
end;

procedure TModelEntidadeTabela.Open(ADatasetFilter: IDatasetFilter);
begin
  FFormatedFilters := ADatasetFilter.AsSql;
  Open;
end;

procedure TModelEntidadeTabela.Open;
begin
  FQuery.Open(FSql + FFormatedFilters);
end;

end.
