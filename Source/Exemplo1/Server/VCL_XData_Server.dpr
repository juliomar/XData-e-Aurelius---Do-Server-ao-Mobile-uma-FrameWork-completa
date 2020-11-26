program VCL_XData_Server;

uses
  Vcl.Forms,
  Server in 'Server.pas',
  ConnectionModule in 'ConnectionModule.pas' {SQLiteConnection: TDataModule},
  MainForm in 'MainForm.pas' {fmServer},
  Entidades in '..\Comun\Entidades.pas',
  MobileDayService in '..\Comun\MobileDayService.pas',
  MobileDayServiceImplementation in 'MobileDayServiceImplementation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSQLiteConnection, SQLiteConnection);
  Application.CreateForm(TfmServer, fmServer);
  Application.Run;
end.
