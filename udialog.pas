unit udialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

{ TfrmDialog }

type
  TfrmDialog = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
    b :Boolean;
  public
    { public declarations }
  end;

var
  frmDialog: TfrmDialog;

implementation

{$R *.lfm}

uses formmain2,upreview;

{ TfrmDialog }

procedure TfrmDialog.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := False;
end;

procedure TfrmDialog.FormShow(Sender: TObject);
begin
  Self.Parent := formmain2.frmMain;
  SetBounds(0,0,formmain2.frmMain.Width, formmain2.frmMain.Height);
  Timer1.Enabled := True;
end;

procedure TfrmDialog.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  upreview.Form2.ShowModal;
  close;
end;

end.

