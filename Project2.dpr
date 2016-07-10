program Project2;

uses
  Windows,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {userchekform},
  Unit5 in 'Unit5.pas' {Form5};

{$R *.res}
var
  Mutex : THandle;
begin
Mutex := CreateMutex(nil, False, 'projectX_mutex17771627419274');
  if Mutex = 0 then
    MessageBox(0,'���������� ������� �������', '������',
      MB_OK)
  else if GetLastError = ERROR_ALREADY_EXISTS then
    MessageBox(0,'��������� ��� ��������', '������',
      MB_OK)
  else
  begin
  Application.Initialize;
  Application.Title := 'Project X';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tuserchekform, userchekform);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
  end;
end.
