program testeNewcon;

uses
  Forms,
  frmMain in 'frmMain.pas' {Form1},
  frmCity in 'frmCity.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
