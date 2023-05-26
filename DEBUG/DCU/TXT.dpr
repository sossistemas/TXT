program TXT;

uses
  Vcl.Forms,
  uTXT in 'uTXT.pas' {frmTXT},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmTXT, frmTXT);
  Application.Run;
end.
