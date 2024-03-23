program ProjectMeteAI;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  UnitPyModule in 'UnitPyModule.pas' {PyModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPyModule, PyModule);
  Application.Run;
end.
