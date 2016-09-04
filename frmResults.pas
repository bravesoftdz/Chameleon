unit frmResults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus;

type
  TResults = class(TForm)
    popListData: TPopupMenu;
    Savelistdata1: TMenuItem;
    TreeView1: TTreeView;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure Savelistdata1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Results: TResults;

implementation

{$R *.DFM}


procedure TResults.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if (Assigned(Node) and (Node.Text = '[List Data]')) then
    TreeView1.PopupMenu := popListData
  else
    TreeView1.PopupMenu := nil;
end;

procedure TResults.Savelistdata1Click(Sender: TObject);
var
  f: TextFile;
  n: TTreeNode;
  i: Integer;

function RemoveTag(const s: string): string;
var pos1: Integer;
begin
  pos1 := Pos('=', s);
  Result := Copy(s, pos1 + 2, Length(s) - pos1 - 1);
end;

begin
  AssignFile(f, 'c:\listdata.csv');
  Rewrite(f);
  n := TreeView1.Selected;
  for i:= 0 to n.Count - 1 do begin
    WriteLn(f, i, ';', RemoveTag(n.Item[i].Item[0].Text), ';', RemoveTag(n.Item[i].Item[1].Text));
  end;
  CloseFile(f);
end;

end.
