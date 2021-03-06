unit uModelEntidadeVendaItem;

interface

uses
  uInterface, Data.DB, uModelEntidadeTabela;

Type
  TModelEntidadeVendaItem = class(TModelEntidadeTabela)
  public
    constructor Create; override;
    destructor Destroy; override;
    class function New : IModelEntidade;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, StrUtils, System.SysUtils;

{ TModelEntidadeProduto }

constructor TModelEntidadeVendaItem.Create;
begin
  FQuery := TModelConexaoFactory.New.Query;
  TableName := 'VENDAITENS';
  inherited;
end;

destructor TModelEntidadeVendaItem.Destroy;
begin
  inherited;
end;

class function TModelEntidadeVendaItem.New: IModelEntidade;
begin
  Result := Self.Create;
end;

end.

