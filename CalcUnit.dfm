object CalculateForm: TCalculateForm
  Left = 0
  Top = 0
  Caption = #1060#1086#1088#1084#1072' '#1087#1086#1076#1089#1095#1077#1090#1072
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
  OnCreate = FormCreate
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
    Top = 179
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
  object grpGraphs: TGroupBox
    Left = 455
    Top = 8
    Width = 315
    Height = 456
    Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080
    TabOrder = 4
    object gCals: TGauge
      Left = 3
      Top = 38
      Width = 309
      Height = 25
      Progress = 0
    end
    object lblCarbGr: TLabel
      Left = 3
      Top = 69
      Width = 51
      Height = 13
      Caption = #1059#1075#1083#1077#1074#1086#1076#1099
    end
    object lblProtGr: TLabel
      Left = 3
      Top = 121
      Width = 30
      Height = 13
      Caption = #1041#1077#1083#1082#1080
    end
    object gProt: TGauge
      Left = 3
      Top = 140
      Width = 309
      Height = 25
      Progress = 0
    end
    object lblFatGr: TLabel
      Left = 3
      Top = 171
      Width = 30
      Height = 13
      Caption = #1046#1080#1088#1099
    end
    object gFats: TGauge
      Left = 3
      Top = 190
      Width = 309
      Height = 25
      Progress = 0
    end
    object lblCals: TLabel
      Left = 3
      Top = 19
      Width = 72
      Height = 13
      Caption = #1050#1072#1083#1086#1088#1080#1081#1085#1086#1089#1090#1100
    end
    object gCarbons: TGauge
      Left = 3
      Top = 90
      Width = 309
      Height = 25
      Progress = 0
    end
    object pbCarbons: TPaintBox
      Left = 3
      Top = 252
      Width = 309
      Height = 25
    end
    object pbProteins: TPaintBox
      Left = 3
      Top = 283
      Width = 309
      Height = 25
    end
    object pbFats: TPaintBox
      Left = 3
      Top = 314
      Width = 309
      Height = 25
    end
    object pbCals: TPaintBox
      Left = 3
      Top = 221
      Width = 309
      Height = 25
    end
  end
  object grpUser: TGroupBox
    Left = 175
    Top = 8
    Width = 274
    Height = 165
    Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 5
    object lblUsers: TLabel
      Left = 3
      Top = 19
      Width = 72
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object lblUserCal: TLabel
      Left = 3
      Top = 65
      Width = 72
      Height = 13
      Caption = #1050#1072#1083#1086#1088#1080#1081#1085#1086#1089#1090#1100
    end
    object lblUserCarbons: TLabel
      Left = 3
      Top = 111
      Width = 51
      Height = 13
      Caption = #1059#1075#1083#1077#1074#1086#1076#1099
    end
    object lblUserProteins: TLabel
      Left = 81
      Top = 65
      Width = 30
      Height = 13
      Caption = #1041#1077#1083#1082#1080
    end
    object lblUserFats: TLabel
      Left = 81
      Top = 111
      Width = 30
      Height = 13
      Caption = #1046#1080#1088#1099
    end
    object cbbUsers: TComboBox
      Left = 3
      Top = 38
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object edtUserCals: TEdit
      Left = 3
      Top = 84
      Width = 52
      Height = 21
      TabOrder = 1
    end
    object edtUserProteins: TEdit
      Left = 81
      Top = 84
      Width = 52
      Height = 21
      TabOrder = 2
    end
    object edtUserCarbons: TEdit
      Left = 3
      Top = 130
      Width = 52
      Height = 21
      TabOrder = 3
    end
    object edtUserFats: TEdit
      Left = 81
      Top = 130
      Width = 52
      Height = 21
      TabOrder = 4
    end
  end
  object conMSSQL: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=FoodProj;Data Source=DENIS\MSSQL14DD'
    Provider = 'SQLOLEDB.1'
    Left = 232
    Top = 384
  end
  object qryMSSQL: TADOQuery
    Connection = conMSSQL
    Parameters = <>
    Left = 320
    Top = 384
  end
end
