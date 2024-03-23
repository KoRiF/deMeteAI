program ProjectMeteAI;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  UnitPyModule in 'UnitPyModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
