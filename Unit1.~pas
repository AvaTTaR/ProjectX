unit Unit1;

interface




uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Masks, ComCtrls, Clipbrd, StrUtils, ExtCtrls,
  ATBinHex, Buttons, IniFiles, ShellAPI, CoolTrayIcon, TextTrayIcon,
  sSkinManager, sBitBtn, sEdit, sCheckBox;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Lotus1: TMenuItem;
    N4: TMenuItem;
    pingbut: TButton;
    memotemp: TMemo;
    ATtemp: TATBinHex;
    Label1: TLabel;
    Label2: TLabel;
    Bugreport1: TMenuItem;
    N5: TMenuItem;
    dndLabel: TLabel;
    Label3: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Patchnote1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Timer2: TTimer;
    Timer3: TTimer;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Label4: TLabel;
    sSkinManager1: TsSkinManager;
    Label5: TLabel;
    BitBtn4: TsBitBtn;
    BitBtn1: TsBitBtn;
    BitBtn2: TsBitBtn;
    BitBtn3: TsBitBtn;
    usernamein: TsEdit;
    pingin: TsEdit;
    CheckBoxprid: TsCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Lotus1Click(Sender: TObject);
    procedure pingbutClick(Sender: TObject);
    procedure pinginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Bugreport1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Patchnote1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure CoolTrayIcon1BalloonHintClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure usernameinClick(Sender: TObject);
    procedure usernameinKeyPress(Sender: TObject; var Key: Char);
    procedure pinginKeyPress(Sender: TObject; var Key: Char);

  protected
    procedure WMDropFiles (var Msg: TMessage); message wm_DropFiles;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  username: string;
  pingip: string;
  sss:integer;
  ClipBoard: TClipboard;
  StrSrc, Str1, Str2, StrTmp : String;
  Pos1, Pos2, Len1, Len2 : Integer;
  sch1, sch2: integer;
  Ini: Tinifile;
  membername, memberdir: string;
  dnd: Timage;
  dndFileName: array[0..256] of char;
const
    poversion=195;


                          
implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}


function translit(const Str: string): string;
const
  RArrayL = 'абвгдеёжзийклмнопрстуфхцчшщьыъэюя';
  RArrayU = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ';
  colChar = 33;
  arr: array[1..2, 1..ColChar] of string =
  (('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y',
    'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f',
    'kh', 'ts', 'ch', 'sh', 'sch', '', 'y', '', 'e', 'yu', 'ya'),
    ('A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'Y',
    'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F',
    'Kh', 'Ts', 'Ch', 'Sh', 'Sch', '', 'Y', '', 'E', 'Yu', 'Ya'));
var
  i: Integer;
  LenS: Integer;
  p: integer;
  d: byte;
begin
  result := '';
  LenS := length(str);
  for i := 1 to lenS do
  begin
    d := 1;
    p := pos(str[i], RArrayL);
    if p = 0 then
    begin
      p := pos(str[i], RArrayU);
      d := 2
    end;
    if p <> 0 then
      result := result + arr[d, p]
    else
      result := result + str[i]; //если не русская буква, то берем исходную
  end;
end;





procedure FindID(StartFolder, Mask: string; List: TStrings;
  ScanSubFolders: Boolean = True);
var
  SearchRec: TSearchRec;
  FindResult: Integer;
begin
  List.BeginUpdate;
  try
    StartFolder := IncludeTrailingBackslash(StartFolder);
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do
        begin
          if (Attr and faDirectory) <> 0 then
          begin
            if ScanSubFolders and (Name <> '.') and (Name <> '..') then
              FindID(StartFolder + Name, Mask, List, ScanSubFolders);
          end
          else
          begin
            if MatchesMask(Name, Mask) then
              List.Add(StartFolder + Name);
          end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      FindClose(SearchRec);
    end;
  finally
    List.EndUpdate;
  end;
end;





//скрыть все элементы
procedure inviz;
begin
form1.usernamein.Visible:=false;
form1.button1.Visible:=false;
form1.CheckBoxprid.Visible:=false;
form1.pingbut.Visible:=false;
form1.pingin.Visible:=false;
form1.BitBtn1.Visible:=false;
form1.BitBtn2.Visible:=false;
form1.label1.Visible:=false;
form1.label2.Visible:=false;
form1.Label3.Visible:=false;
form1.BitBtn3.Visible:=false;
end;









function myremovedir(sdir : string) : boolean; 
var 
iindex : integer; 
searchrec : tsearchrec; 
sfilename : string; 
begin
result := false; 
sdir := sdir + '*.*'; 
iindex := findfirst(sdir, faanyfile, searchrec); 

while iindex = 0 do begin
sfilename := extractfiledir(sdir)+''+searchrec.name;
if searchrec.attr = fadirectory then begin 
if (searchrec.name <> '' ) and 
(searchrec.name <> '.') and 
(searchrec.name <> '..') then 
myremovedir(sfilename);
end else begin 
if searchrec.attr <> faarchive then
filesetattr(sfilename, faarchive);
if not deletefile(sfilename) then
//showmessage('Не удалось удалить' + sfilename);
end;
iindex := findnext(searchrec);
end; 

findclose(searchrec); 

result := true;
end;























procedure TForm1.Button1Click(Sender: TObject);
begin


ForceDirectories(memberdir+'\lotus_id');
userchekform.usernameineng.Items.Clear;
username:=(usernamein.Text);
if length(username)<3 then showmessage ('Необходимо ввести фамилию пользователя(не менее 3 символов)')
else
begin
userchekform.Show;
userchekform.Left:= Form1.Left-270;
userchekform.Top:= Form1.Top;
username:=StringReplace(username, 'кс', 'x',[rfReplaceAll, rfIgnoreCase]);
username:=translit(username);
userchekform.idlist.Clear;
FindID('\\arc\lotus_id\client','*'+username+'*', userchekform.idlist.Items , true);



//очистка директории
    begin
    if CheckBoxprid.Checked=True then
    myremovedir(memberdir+'\lotus_id\\')
    end;

// создаём соответствующий список имён.

          for sss:=0 to userchekform.idlist.Count-1 do
          begin
          attemp.Open(userchekform.idlist.Items.Strings[sss]);           // Загружаем файл id
          if pos('\old\',userchekform.idlist.Items.Strings[sss])>0 then userchekform.usernameineng.Items.add('ID старого типа') //Исключаем ID старого типа
          //Вынесение в мемо
          else
                begin
          attemp.SelectAll;
          attemp.CopyToClipboard(false);
          memotemp.Clear;
          memotemp.PasteFromClipboard;
          Memotemp.text:=AnsiReverseString(memotemp.text);
          clipboard.Clear;
          //

         //Поиск имени пользователя
            StrSrc := Memotemp.Text;    //Текст файла перенесённый в мемо.


            //Шаблоны, между которыми надо выделять текст.
              Str1 := '/BG=UO/';
            Len1 := Length(Str1);
              Str2 := '=NC';                             // подобрать максимально подходящую маску или сделать маску в маске
            Len2 := Length(Str2);

            Pos1 := PosEx(Str1, StrSrc, 1);
              sch1:=0;
              sch2:=1;


            while Pos1 > 0 do begin
              Pos2 := PosEx(Str2, StrSrc, Pos1 + Len1);
              if Pos2 = 0 then Break;
              //Текст между шаблонами.
              StrTmp := Copy(StrSrc, Pos1 + Len1, Pos2 - Pos1 - Len1);
              //Если требуется убрать ведущие и ведомые пробелы. Использовать в процедуре для русского варианта имени.
              StrTmp := Trim(StrTmp);

              //Обрабатываем записанный в StrTmp текст
              //...
              if sch1 < sch2 then
              begin
              StrTmp:=AnsiReverseString(StrTmp);
              userchekform.usernameineng.Items.add(StrTmp);
               sch1:=sch1+1
              end;

            //Продолжаем поиск. для вывода результатов по русскому варианту и полному имени пользователя.
              Pos1 := Pos2 + Len2;
              Pos1 := PosEx(Str1, StrSrc, Pos1);
              end;
              end;
              end;
              end;

end;



procedure TForm1.N4Click(Sender: TObject);
begin
inviz;
pingbut.Visible:=true;
pingin.Visible:=true;
end;

procedure TForm1.Lotus1Click(Sender: TObject);
begin
inviz;
usernamein.Visible:=true;
button1.Visible:=true;
CheckBoxprid.Visible:=true;
form1.BitBtn1.Visible:=true;
form1.BitBtn2.Visible:=true;
form1.label1.Visible:=true;
form1.label2.Visible:=true;
form1.Label3.Visible:=true;
form1.BitBtn3.Visible:=true;
form1.BitBtn4.Visible:=true;

end;

procedure TForm1.pingbutClick(Sender: TObject);
begin
pingin.Text:=StringReplace(pingin.Text, ',', '.',[rfReplaceAll, rfIgnoreCase]);
pingin.Text:=StringReplace(pingin.Text, 'ч', 'x',[rfReplaceAll, rfIgnoreCase]);
pingip:=pingin.Text;
WinExec(pchar('ping.exe '+pingip+' -n 100'), sw_show);
WinExec(pchar('tracert.exe '+pingip), sw_show);
//Showmessage('Для остановки пинга нажмите Ctrl+C');
end;

procedure TForm1.pinginClick(Sender: TObject);
begin
pingin.Text;
pingin.SelectAll;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
sskinmanager1.skinname:='b' ;
//Проверка версии
memotemp.Lines.LoadFromFile('\\fas2.mtb.minsk.by\G\group\Uit\OSD\Ефименко\Project X\up_v.txt');
if strtoint(memotemp.Lines[0])>poversion then
  Begin
  n12.Visible:=True;
  Showmessage(memotemp.lines[1]);
  end;

memotemp.Lines.Clear;


// Инициализация процесса драганддроп
DragAcceptFiles(Handle, true);  //Ас DnD
ClipBoard:=TClipboard.Create;         //вводим переменную для буфера


//грузим из реестра
//  Reg:=TRegistry.Create;
//  Reg.RootKey := HKEY_CURRENT_USER;
//  Reg.OpenKey('\SOFTWARE\SDPROJECTX', true);


//работа с ini
  Ini:=TiniFile.Create('SD_X.ini');
  Form1.Width:=Ini.ReadInteger('Size','Width',518);
  Form1.Height:=Ini.ReadInteger('Size','Height',179);
  Form1.Left:=Ini.ReadInteger('Position','X',744);
  Form1.Top:=Ini.ReadInteger('Position','Y',128);
  membername:=Ini.ReadString('Member', 'Name' ,'Джон Доу');
  memberdir:=Ini.ReadString('Member', 'Dir' ,'\\fas2.mtb.minsk.by\g\All\UEIS');
  label4.Caption:=memberdir;
  CheckBoxprid.Checked:=Ini.ReadBool('Boolean','Del pr',False);
  Ini.Free;
  end;



procedure TForm1.FormDestroy(Sender: TObject);
begin
  Ini:=TiniFile.Create('SD_X.ini');
  Ini.WriteInteger('Size','Width',form1.width);
  Ini.WriteInteger('Size','Height',form1.height);
  Ini.WriteInteger('Position','X',form1.left);
  Ini.WriteInteger('Position','Y',form1.top);
  Ini.WriteString('Member', 'Name' ,membername);
  Ini.WriteString('Member', 'Dir' ,memberdir);
  Ini.WriteBool('Boolean','Del pr',checkboxprid.Checked);
  Ini.Free;
end;

procedure TForm1.Bugreport1Click(Sender: TObject);
begin
ShellExecute(Handle,'Open','http://mtbank.tk/index.php?/topic/5-bagi-i-predlozheniia-k-versii-019x/',nil,nil,SW_SHOWNORMAL);

end;

procedure TForm1.N2Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if memberdir='\\fas2.mtb.minsk.by\g\All\UEIS' then
begin
showmessage('Вы первый раз запускаете программу, необходимо выбрать рабочую директорию');
form5.show;
end;
end;

procedure Tform1.WMDropFiles(var Msg: TMessage);
var
CF:TSHFileOpStruct;
begin
  ForceDirectories(memberdir);
  DragQueryFile(THandle(Msg.WParam), 0, dndFileName, SizeOf(dndFilename));
  dndlabel.Caption:=dndfilename;
  //копируем папку
  CF.Wnd:=0;
  CF.pFrom:=dndfilename;//откуда копируем файлы
  CF.pTo:=pansichar(memberdir);//куда копируем если такого каталога нет то будет предложено его создать
  CF.wFunc:=FO_COPY;//задаём флаг копирования
  CF.fFlags:=FOF_ALLOWUNDO;//пусть будет этот флаг
   if ShFileOperation(CF) = 0 then
  DragFinish(THandle(Msg.WParam));
end;


procedure TForm1.N7Click(Sender: TObject);
begin
inviz;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
ShellExecute(Handle,'Open','http://mtbank.tk/index.php?/topic/2-projext-x-ego-funktcii-i-vozmozhnye-problemy/',nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.Patchnote1Click(Sender: TObject);
begin
ShellExecute(Handle,'Open','http://mtbank.tk/index.php?/topic/7-v-0194/',nil,nil,SW_SHOWNORMAL);
//showmessage('v.0.1.8'+
//#13#10');
end;





procedure TForm1.N9Click(Sender: TObject);
begin
if form1.n9.Checked then
Begin
SetWindowPos(Handle,HWND_NOTOPMOST,Left,Top,Width,Height,SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
form1.n9.Checked:=False;
end
else
begin
SetWindowPos(Handle,HWND_TOPMOST,Left,Top,Width,Height,SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
form1.N9.Checked:=True;
end
end;

procedure TForm1.N10Click(Sender: TObject);
var
reepost: TSearchRec;
reepostout: string;
today : TDateTime;
todaystr:string;
begin
today := Now;
todaystr:=DateToStr(today);
Delete(todaystr, 6, 6);
Delete(todaystr, 3, 1);
FindFirst('\\fas2.mtb.minsk.by\T\FORPOST\ARC\POST\IN\'+'R'+todaystr+'*.*', faAnyFile, reepost);
if reepost.Name='' then showmessage('Реестр с текущей датой не найден') else
  begin
  reepostout:=reepost.Name;
  reepostout:=StringReplace(reepostout, 'MTB', 'TXT', [rfReplaceAll, rfIgnoreCase]);
  CopyFile(Pchar('\\fas2.mtb.minsk.by\T\FORPOST\ARC\POST\IN\'+reepost.Name), Pchar(memberdir+'/'+reepostout), true);
  showmessage('Реестр Белпочты выгружен');
  end


end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
reepost: TSearchRec;
reepostout: string;
today : TDateTime;
todaystr:string;
begin
today := Now;
todaystr:=DateToStr(today);
Delete(todaystr, 6, 6);
Delete(todaystr, 3, 1);
FindFirst('\\fas2.mtb.minsk.by\T\FORPOST\ARC\POST\IN\'+'R'+todaystr+'*.*', faAnyFile, reepost);
if reepost.Name='' then today:=Now else
  begin
    CoolTrayIcon1.ShowBalloonHint('Пришёл реестр Белпочты', 'Нажмите на это диалоговое окно для его выгрузки', bitInfo, 11);
    timer3.Enabled:=True;
    timer2.Enabled:=False;
    end;
end;

procedure TForm1.CoolTrayIcon1DblClick(Sender: TObject);
begin
CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.CoolTrayIcon1BalloonHintClick(Sender: TObject);
var
  buttonSelected : Integer;
begin
  // Отображение диалога с подтверждением
  buttonSelected := MessageDlg('Выгрузить реестр?', mtConfirmation, mbOKCancel, 0);

  // Показ типа выбранной кнопки
  if buttonSelected = mrOK     then   form1.N10.Click;
end;


procedure TForm1.Timer3Timer(Sender: TObject);
begin
memotemp.Lines.LoadFromFile('\\fas2.mtb.minsk.by\G\group\Uit\OSD\Ефименко\Project X\up_v.txt');
if strtoint(memotemp.Lines[0])>poversion then n12.Visible:=True;


memotemp.Lines.Clear;
    timer2.Enabled:=True;
    timer3.Enabled:=False;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
close;
end;

procedure TForm1.N12Click(Sender: TObject);
var f:TextFile;
BatFile: string;
begin

copyFile('\\fas2.mtb.minsk.by\G\group\Uit\OSD\Ефименко\Project X\Project X.exe', PChar(ExtractFileDir(ParamStr(0))+'\'+'upd.exe'), False);


sleep(5000);

BatFile := changefileext(Application.ExeName, '.bat');
assignFile(f, BatFile);
rewrite(f);
writeln(f, ':1');
writeln(f, 'erase "'+ExtractShortPathName(Application.ExeName)+ '"');
writeln(f, 'if exist '+ExtractShortPathName(Application.ExeName)+' Goto 1');
writeln(f, 'rename "'+ExtractShortPathName(ExtractFilePath(ParamStr(0)))+'\'+'upd.exe" "'+ExtractFileName(Application.ExeName)+ '"');
writeln(f, 'start '+ExtractShortPathName(Application.ExeName)); //+RestartParam
writeln(f, 'erase '+ExtractShortPathName(ExtractFilePath(Application.ExeName))+'Upd.exe');
writeln(f, 'erase '+ExtractShortPathName(BatFile));
closefile(f);
ShellExecute(0, 'Open', PChar(BatFile), nil, nil, sw_hide);
close;
end;



procedure TForm1.N14Click(Sender: TObject);
begin
if form1.n14.Checked then
Begin
Form1.BorderStyle := bsSizeable;
form1.n14.Checked:=False;
end
else
begin
Form1.BorderStyle := bsSingle;
form1.N14.Checked:=True;
end
end;

procedure TForm1.N15Click(Sender: TObject);
begin
if form1.n15.Checked then
Begin
cooltrayicon1.MinimizeToTray:=False;
form1.n15.Checked:=False;
end
else
begin
cooltrayicon1.MinimizeToTray:=True;
form1.N15.Checked:=True;
end
end;


procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
userchekform.Left:= Form1.Left-270;
userchekform.Top:= Form1.Top;
end;



procedure TForm1.Label5Click(Sender: TObject);
begin
if CheckBoxprid.Checked = true then
CheckBoxprid.Checked:= False
else
begin
if CheckBoxprid.Checked = false then
CheckBoxprid.Checked:= True;
end
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', PChar(memberdir), PChar(NIL), PChar(NIL), SW_SHOWNORMAL);
end;



procedure TForm1.sBitBtn1Click(Sender: TObject);
begin
if userchekform.usernameineng.ItemIndex=-1 then showmessage('Не выбран пользователь.')
else
clipboard.astext:=memberdir+'\lotus_id\'+extractFileName(userchekform.idlist.Items[userchekform.usernameineng.ItemIndex]);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
clipboard.astext:=label1.Caption;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
clipboard.astext:=label2.Caption;
end;



procedure TForm1.usernameinClick(Sender: TObject);
begin
usernamein.Text;
usernamein.SelectAll;
end;

procedure TForm1.usernameinKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
button1.Click;
end;

procedure TForm1.pinginKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
pingbut.Click;
end;

end.
