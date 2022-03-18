unit uFiredacConnection;

interface

uses
  uInterface, FireDAC.Comp.Client, Data.DB, Firedac.Stan.Def, FireDAC.Phys.MSSQL,
  Firedac.Stan.Param, Firedac.Dapt, Firedac.Comp.Ui, FireDAC.VCLUI.Wait,
  Firedac.Stan.Async;

Type
  TModelFiredacConexao = class(TInterfacedObject, iModelConexao)
  private
    FConexao : TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelConexao;
    function Connection : TObject;
  end;

implementation

uses
  System.SysUtils;

{ TModelFiredacConexao }

function TModelFiredacConexao.Connection: TObject;
begin
  Result := FConexao;
end;

constructor TModelFiredacConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'MSSQL';
  FConexao.Params.AddPair('Server', 'DIEGONOTE');
  FConexao.Params.Database := 'MINHASVENDAS';
  FConexao.Params.UserName := 'DRUMMER8';
  FConexao.Params.Password := 'today';
  FConexao.Connected := true;
end;

destructor TModelFiredacConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelFiredacConexao.New: iModelConexao;
begin
  Result := Self.Create;
end;

end.
