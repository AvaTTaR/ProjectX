unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, ExtCtrls, jpeg, Menus;

type
  Tdnd = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    DnD2: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DnD1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  protected
    procedure WMDropFiles (var Msg: TMessage); message wm_DropFiles;
  public
    { Public declarations }
  end;

var
  dnd: Tdnd;
  dndFileName: array[0..256] of char;

implementation

uses Unit1;

{$R *.dfm}
procedure Tdnd.WMDropFiles(var Msg: TMessage);
var
CF:TSHFileOpStruct;
begin
  DragQueryFile(THandle(Msg.WParam), 0, dndFileName, SizeOf(dndFilename));
  label1.Caption:=dndfilename;
  //�������� �����
  CF.Wnd:=0;
  CF.pFrom:=dndfilename;//������ �������� ����� ��� ��� ����� ���� �����
  CF.pTo:='D:\SD_optima\out';//���� �������� ���� ������ �������� ��� �� ����� ���������� ��� �������
  CF.wFunc:=FO_COPY;//����� ���� �����������
  CF.fFlags:=FOF_ALLOWUNDO;//����� ����� ���� ����
   if ShFileOperation(CF) = 0 then
  image1.Visible:=true;
  timer1.Enabled:=true;
  DragFinish(THandle(Msg.WParam));
end;



procedure Tdnd.FormCreate(Sender: TObject);
begin
DragAcceptFiles(Handle, true);
end;

procedure Tdnd.Timer1Timer(Sender: TObject);
begin
  image1.Visible:=false;
  timer1.Enabled:=false;
end;



procedure Tdnd.DnD1Click(Sender: TObject);
begin
dnd.BorderStyle:=bsSizeable;
button1.Visible:=true;
end;

procedure Tdnd.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button=mbRight then PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
 ReleaseCapture;
 dnd.perform(WM_SysCommand,$F012,0);
end;



end.
