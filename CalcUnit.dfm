object CalculateForm: TCalculateForm
  Left = 0
  Top = 0
  Caption = 'CalculateForm'
  ClientHeight = 472
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCarbon: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = #1059#1075#1083#1077#1074#1086#1076#1099
  end
  object lblProteins: TLabel
    Left = 8
    Top = 162
    Width = 30
    Height = 13
    Caption = #1041#1077#1083#1082#1080
  end
  object lblFats: TLabel
    Left = 8
    Top = 316
    Width = 30
    Height = 13
    Caption = #1046#1080#1088#1099
  end
  object btnAddProt: TSpeedButton
    Left = 135
    Top = 232
    Width = 34
    Height = 22
    Caption = #8212'>'
  end
  object btnAddCarbons: TSpeedButton
    Left = 135
    Top = 72
    Width = 34
    Height = 22
    Caption = #8212'>'
  end
  object btnAddFats: TSpeedButton
    Left = 135
    Top = 384
    Width = 34
    Height = 25
    Caption = #8212'>'
  end
  object lstCarbons: TListBox
    Left = 8
    Top = 27
    Width = 121
    Height = 129
    ItemHeight = 13
    TabOrder = 0
  end
  object lstProteins: TListBox
    Left = 8
    Top = 181
    Width = 121
    Height = 129
    ItemHeight = 13
    TabOrder = 1
  end
  object lstFats: TListBox
    Left = 8
    Top = 335
    Width = 121
    Height = 129
    ItemHeight = 13
    TabOrder = 2
  end
  object grpDayMenu: TGroupBox
    Left = 175
    Top = 151
    Width = 274
    Height = 186
    Caption = #1055#1088#1086#1076#1091#1082#1090#1099
    TabOrder = 3
    object lblDayMenu: TLabel
      Left = 3
      Top = 18
      Width = 52
      Height = 13
      Caption = #1055#1088#1086#1076#1091#1082#1090#1099
    end
    object lblGramms: TLabel
      Left = 143
      Top = 40
      Width = 21
      Height = 13
      Caption = #1042#1077#1089':'
    end
    object lblPg: TLabel
      Left = 143
      Top = 68
      Width = 34
      Height = 13
      Caption = #1041#1077#1083#1082#1080':'
    end
    object lblCarbons: TLabel
      Left = 143
      Top = 96
      Width = 55
      Height = 13
      Caption = #1059#1075#1083#1077#1074#1086#1076#1099':'
    end
    object lblFG: TLabel
      Left = 143
      Top = 124
      Width = 34
      Height = 13
      Caption = #1046#1080#1088#1099':'
    end
    object lstDayMenu: TListBox
      Left = 3
      Top = 37
      Width = 134
      Height = 130
      ItemHeight = 13
      TabOrder = 0
    end
    object seGramms: TSpinEdit
      Left = 205
      Top = 37
      Width = 66
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object seProts: TSpinEdit
      Left = 205
      Top = 65
      Width = 66
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object seCarbons: TSpinEdit
      Left = 205
      Top = 93
      Width = 66
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object seFats: TSpinEdit
      Left = 205
      Top = 121
      Width = 66
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
  end
end
