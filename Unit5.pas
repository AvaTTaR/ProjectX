unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShlObj, FileCtrl;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form5: TForm5;
  chosenDirectory : string;



implementation

uses Unit1;

{$R *.dfm}



procedure TForm5.Button4Click(Sender: TObject);
begin
  // ������ ������������ ������� ��������� �������, ��������� ������� C:
  if SelectDirectory('������� ���� � ����� �����', '\\fas2.mtb.minsk.by\g\All\UEIS', chosenDirectory)
  then ShowMessage('���� ������� ���������� = '+chosenDirectory)
  else ShowMessage('����� �� �������');
  memberdir:=chosenDirectory;
  close;

end;

procedure TForm5.Button3Click(Sender: TObject);
begin
close;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
membername:=edit1.text;
memberdir:=chosenDirectory;
close;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
FORM5.FORMSTYLE:=FSSTAYONTOP;
end;



procedure TForm5.Edit1Click(Sender: TObject);
begin
edit1.SelectAll;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if memberdir='\\fas2.mtb.minsk.by\g\All\UEIS' then
begin
showmessage('�� ������ ��� ���������� ���������, ���������� ������� ������� ����������');
form5.show;
end;
end;

end.
