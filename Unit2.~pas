unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ATBinHex;

type
  Tuserchekform = class(TForm)
    idlist: TListBox;
    Button1: TButton;
    usernameineng: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure usernameinengDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  userchekform: Tuserchekform;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure Tuserchekform.Button1Click(Sender: TObject);
begin

if usernameineng.ItemIndex=-1 then close
else
begin
ForceDirectories(memberdir+'\lotus_id');
copyfile(Pchar(idlist.Items[usernameineng.ItemIndex]), Pchar(memberdir+'\lotus_id\'+extractFileName(idlist.Items[usernameineng.ItemIndex])), true);
clipboard.astext:=usernameineng.Items[usernameineng.ItemIndex];
Form1.Label1.Caption:=usernameineng.Items[usernameineng.ItemIndex];;
form1.Label3.Caption:=extractFileName(idlist.Items[usernameineng.ItemIndex]);
close;
end;
end;

procedure Tuserchekform.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tuserchekform.usernameinengDblClick(Sender: TObject);
begin
button1.Click;
end;

end.
