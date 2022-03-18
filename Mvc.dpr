program Mvc;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fMasterDetail},
  uInterface in 'uInterface.pas',
  uFiredacConnection in 'uFiredacConnection.pas',
  uModelFiredacQuery in 'uModelFiredacQuery.pas',
  uModelConexaoFactory in 'uModelConexaoFactory.pas',
  uModelEntidadesFactory in 'uModelEntidadesFactory.pas',
  uController in 'Controller\uController.pas',
  uFilter in 'uFilter.pas',
  uModelEntidadeTabela in 'Model\Entidades\uModelEntidadeTabela.pas',
  uModelEntidadeItem in 'Model\Entidades\uModelEntidadeItem.pas',
  uModelEntidadeVenda in 'Model\Entidades\uModelEntidadeVenda.pas',
  uModelEntidadeVendaItem in 'Model\Entidades\uModelEntidadeVendaItem.pas',
  uJoin in 'uJoin.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMasterDetail, fMasterDetail);
  Application.Run;
end.
