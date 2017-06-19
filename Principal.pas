unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdIPWatch;

type
  TForm1 = class(TForm)
    BtTestar: TButton;
    Edit1: TEdit;
    Ip: TIdIPWatch;
    procedure BtTestarClick(Sender: TObject);
    Function MacAddress: string;
    Function SerialNum(FDrive: String): String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtTestarClick(Sender: TObject);
begin
  // Procedure para carregar as informações.
  Edit1.Text := '['+Ip.LocalIP+']' + MacAddress + '['+SerialNum('C:')+']';
  // Edit1.Text :=  SerialNum('C:');

end;

function TForm1.MacAddress: string;
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;

begin
  Result := '';
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then
    begin
      if (Func(@GUID1) = 0) and (Func(@GUID2) = 0) and
        (GUID1.D4[2] = GUID2.D4[2]) and (GUID1.D4[3] = GUID2.D4[3]) and
        (GUID1.D4[4] = GUID2.D4[4]) and (GUID1.D4[5] = GUID2.D4[5]) and
        (GUID1.D4[6] = GUID2.D4[6]) and (GUID1.D4[7] = GUID2.D4[7]) then
      begin
        Result := IntToHex(GUID1.D4[2], 2) + '-' + IntToHex(GUID1.D4[3], 2) +
          '-' + IntToHex(GUID1.D4[4], 2) + '-' + IntToHex(GUID1.D4[5], 2) + '-'
          + IntToHex(GUID1.D4[6], 2) + '-' + IntToHex(GUID1.D4[7], 2);
      end;
    end;
  end;
end;

Function TForm1.SerialNum(FDrive: String): String;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: Array [0 .. 11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive + ':'), DLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  Except
    Result := '';
  end;
end;

end.
