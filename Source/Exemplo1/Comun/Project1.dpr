program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in '..\Cliente\Unit1.pas' {Form1},
  Entidades in 'Entidades.pas',
  MobileDayService in 'MobileDayService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
