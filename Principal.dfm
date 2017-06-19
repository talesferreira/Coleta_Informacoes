object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 216
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object BtTestar: TButton
    Left = 32
    Top = 136
    Width = 217
    Height = 57
    Caption = 'Carregar'
    TabOrder = 0
    OnClick = BtTestarClick
  end
  object Edit1: TEdit
    Left = 32
    Top = 40
    Width = 593
    Height = 24
    TabOrder = 1
    Text = 'Edit1'
  end
  object Ip: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 600
    Top = 72
  end
end
