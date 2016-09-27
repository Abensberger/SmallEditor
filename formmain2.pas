unit formmain2;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, Buttons, ActnList,
  fontawesomecodes;

{ TfrmMain }

type
  TfrmMain = class(TForm)
    act_Execute: TAction;
    ActionList1: TActionList;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    ImageList_White: TImageList;
    ImageList_Black: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    pnlEinfuegen: TPanel;
    Panel11: TPanel;
    pnlAusschneiden: TPanel;
    pnlKopieren: TPanel;
    pnlRueckgaengig: TPanel;
    pnlWiederholen: TPanel;
    Panel14: TPanel;
    pnlDatei: TPanel;
    pnlWeb: TPanel;
    pnlZwischenablage: TPanel;
    pnlProgramm: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    procedure act_ExecuteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

uses uDialog, upreview;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Label5.Caption := WideChar(fa_file_o);
  Label7.Caption := WideChar(fa_folder_open_o);
  Label9.Caption := WideChar(fa_upload);
  Label11.Caption := WideChar(fa_save);
  Label15.Caption := WideChar(fa_download);
  Label13.Caption := WideChar(fa_cut);
  Label17.Caption := WideChar(fa_copy);
  Label19.Caption := WideChar(fa_paste);
  Label21.Caption := WideChar(fa_play);
  Label23.Caption := WideChar(fa_undo);
  Label25.Caption := WideChar(fa_repeat);

//  Label27.Caption := WideChar(fa_file_o)+UTF8Encode(#13#10#13#10'Neu');;
end;

procedure TfrmMain.act_ExecuteExecute(Sender: TObject);
begin
  upreview.Form2.Showmodal;
end;

procedure TfrmMain.Label21Click(Sender: TObject);
begin
  act_ExecuteExecute(Sender);
end;

procedure TfrmMain.Label5MouseEnter(Sender: TObject);
var i : integer;
begin
  if TLabel(Sender).Parent is TPanel then
     TPanel(TLabel(Sender).Parent).color := clGray;
//     TPanel(TLabel(Sender).Parent).BevelOuter := bvLowered;
{  for i := 0 to TPanel(TLabel(Sender).Parent).ControlCount - 1 do
  begin
    if TPanel(TLabel(Sender).Parent).Controls[i] is TLabel then
       TLabel(TPanel(TLabel(Sender).Parent).Controls[i]).Font.Style := [fsBold];
//    TLabel(TPanel(TLabel(Sender).Parent).Controls[i]).Font.Color := $00FF8000;
  end;
}end;

procedure TfrmMain.Label5MouseLeave(Sender: TObject);
var i : integer;
begin
  if TLabel(Sender).Parent is TPanel then
     TPanel(TLabel(Sender).Parent).color := clBlack;
//  TPanel(TLabel(Sender).Parent).BevelOuter  := bvNone;
{  for i := 0 to TPanel(TLabel(Sender).Parent).ControlCount - 1 do
  begin
    if TPanel(TLabel(Sender).Parent).Controls[i] is TLabel then
       TLabel(TPanel(TLabel(Sender).Parent).Controls[i]).Font.Style := [];
//    TLabel(TPanel(TLabel(Sender).Parent).Controls[i]).Font.Color := clWhite;
  end;
}
end;

procedure TfrmMain.ToolButton6Click(Sender: TObject);
begin
  ShowMessage((Sender as TToolButton).Caption);
end;

end.

