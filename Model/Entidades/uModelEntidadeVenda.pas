unit uModelEntidadeVenda;

interface

uses
  uInterface, Data.DB, uFilters, uModelEntidadeTabela;

Type
  TModelEntidadeVenda = class(TModelEntidadeTabela)
  public
    constructor Create; override;
    destructor Destroy; override;
    class function New : IModelEntidade;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, StrUtils, System.SysUtils;

{ TModelEntidadeProduto }

constructor TModelEntidadeVenda.Create;
begin
  FQuery := TModelConexaoFactory.New.Query;
  TableName := 'VENDAS';
  inherited;
end;

destructor TModelEntidadeVenda.Destroy;
begin
  inherited;
end;

class function TModelEntidadeVenda.New: IModelEntidade;
begin
  Result := Self.Create;
end;

end.

