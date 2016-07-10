unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
ForceDirectories('\\fas2.mtb.minsk.by\g\All\UEIS\Efimenko\sdxbugs\');
Memo1.Lines.SaveToFile('\\fas2.mtb.minsk.by\g\All\UEIS\Efimenko\sdxbugs\'+IntToStr(random(102400000))+'___bug.txt');
showmessage('Спасибо за Вашу помощь в разработке программы!');
close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
close;
end;

end.
