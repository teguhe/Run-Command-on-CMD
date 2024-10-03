unit umain;

{$mode objfpc}{$H+}

interface

uses
    Windows,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Command: string;
begin

  Button2Click(sender);
  Command := 'cmd.exe /C echo Test Shell Execute by Teguh Prasetyo ';
  Command := Command + Memo2.Text;

  //ShowMessage(Command);

  ShellExecute(0, 'open', 'cmd.exe', PChar('/C ' + Command), nil, SW_SHOWNORMAL);

end;

procedure TForm1.Button2Click(Sender: TObject);
var jumlahbaris, i : Integer;
begin

  jumlahbaris := memo1.Lines.Count;
  memo2.Clear;

  for i := 0 to jumlahbaris-1 do
  begin
    if Memo1.Lines[i]=''
    then memo2.Text:=memo2.Text+(' & echo[ ')
    else memo2.Text:=memo2.Text+(' & '+Memo1.Lines[i]);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Caption:='Test Execute Command via CMD';
  Position:=poScreenCenter;

end;

end.

