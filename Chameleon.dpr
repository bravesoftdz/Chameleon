program Chameleon;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  frmResults in 'frmResults.pas' {Results},
  Writers in 'Writers.pas',
  DfmEngine in 'DfmEngine.pas',
  StrConsts in 'StrConsts.pas',
  about1 in 'about1.pas' {AboutBox};


{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TResults, Results);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
