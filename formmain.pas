unit formmain;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, BCPanel, Types, lcltype;


{ TfrmMain }

type
  TfrmMain = class(TForm)
    BCPanel1: TBCPanel;
    chkRahmen: TCheckBox;
    ComboBox1: TComboBox;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure chkRahmenChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure Panel2MouseLeave(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

const
FarbArray : array [0..15] of TColor = (clBlack,clMaroon, clGreen, clOlive,
                                      clNavy, clPurple, clTeal, clGray,
                                      clSilver, clRed, clLime, clYellow,
                                      clBlue, clFuchsia, clAqua, clWhite);


{ TfrmMain }

procedure TfrmMain.Panel2MouseEnter(Sender: TObject);
var i : integer;
  aControl : TWinControl;
begin
  if Sender is TPanel then
  begin
    aControl := TPanel(Sender);
  end
  else if TWincontrol(Sender).Parent is TPanel then
  begin
    aControl := TPanel(TWincontrol(Sender).Parent);
  end;

  TPanel(aControl).ParentColor := False;
  aControl.Color := clGradientActiveCaption;

  for i := 0 to aControl.ControlCount -1 do
  begin
    if aControl.Controls[i] is TImage then
       ImageList_Black.GetBitmap(TImage(aControl.Controls[i]).Tag,
                                 TImage(aControl.Controls[i]).Picture.Bitmap)
    else if aControl.Controls[i] is TLabel then
    begin
      TLabel(aControl.Controls[i]).Font.Color := clBlack;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Panel1.Color := clBlack;
//  Panel1.Brush.Style := bsClear;
  Label6.Caption := 'Speichern'+#10+'unter...';
end;

procedure TfrmMain.chkRahmenChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to Panel1.ControlCount -1 do
  begin
    if Panel1.Controls[i] is TPanel then
       if chkRahmen.Checked then
       begin
         TPanel(Panel1.Controls[i]).BorderStyle := bsSingle;
       end
       else
          TPanel(Panel1.Controls[i]).BorderStyle := bsNone
  end;
end;

procedure TfrmMain.ComboBox1Change(Sender: TObject);
begin
  Panel1.Color := FarbArray[TComboBox(Sender).ItemIndex];
end;

procedure TfrmMain.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
const
  cBrushColors: array [Boolean] of TColor = (clWindow, clHighlight);
  cPenColors: array [Boolean] of TColor = (clWindowText, clHighlightText);
begin
  Assert(Control is TCombobox);

  with (Control as TComboBox).Canvas do
  begin
    // Hintergrund und Text Farbe bestimmen, anschließend den Hintergrund löschen
    Brush.Color := cBrushColors[(OdSelected in State) or (OdFocused in State)];
    Font.Color := cPenColors[(OdSelected in State) or (OdFocused in State)];
    FillRect(ARect);

    ARect.Right := 30;
    Textout(ARect.Right + 5, ARect.Top + 1, (Control as TComboBox).Items[Index]);

    // Jetzt gleichen wir das Rect für die Farbbox an
    // und anschließend zeichen wir diese ...
    InflateRect(ARect, 0, -2);
    OffsetRect(ARect, 2, 0);
    Brush.Style := bsClear;
    Brush.Color := FarbArray[Index];
    Rectangle(ARect);
  end;
end;

procedure TfrmMain.Panel2MouseLeave(Sender: TObject);
var i : integer;
    aControl : TWinControl;
begin
  if Sender is TPanel then
  begin
    aControl := TPanel(Sender);
  end
  else if TWincontrol(Sender).Parent is TPanel then
  begin
    aControl := TPanel(TWincontrol(Sender).Parent);
  end;

  TPanel(aControl).ParentColor := True;
//  aControl.Color := TPanel(aControl.Parent).Color;

  for i := 0 to aControl.ControlCount -1 do
  begin
    if aControl.Controls[i] is TImage then
       ImageList_White.GetBitmap(TImage(aControl.Controls[i]).Tag,
                                 TImage(aControl.Controls[i]).Picture.Bitmap)
    else if aControl.Controls[i] is TLabel then
    begin
      TLabel(aControl.Controls[i]).Font.Color := clWhite;
    end;
  end;

end;

end.

