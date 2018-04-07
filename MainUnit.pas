unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, AddUser, AddFood, CalcUnit,   AddGroupFood;

type
  TMainForm = class(TForm)
    btnAddUser: TButton;
    btnAddFoodGroup: TButton;
    btnAddFood: TButton;
    btnCalcul: TButton;
    procedure btnAddUserClick(Sender: TObject);
    procedure btnAddFoodClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddFoodGroupClick(Sender: TObject);
    procedure btnCalculClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnAddFoodClick(Sender: TObject);
begin
  AddFoodForm.ShowModal;
end;

procedure TMainForm.btnAddFoodGroupClick(Sender: TObject);
begin
  AddGroupFoodForm.ShowModal;
end;

procedure TMainForm.btnAddUserClick(Sender: TObject);
begin
  AddUserForm.ShowModal;
end;

procedure TMainForm.btnCalculClick(Sender: TObject);
begin
  CalculateForm.ShowModal;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  iMidWidth:Integer;
  iBtnLeft:Integer;
  iBtnHalfWidth:Integer;
begin
  iMidWidth:= MainForm.Width div 2;
  iBtnHalfWidth:= btnAddUser.Width div 2;
  iBtnLeft:= iMidWidth - iBtnHalfWidth;
  btnAddUser.Left:= iBtnLeft;
  btnAddFood.Left:= iBtnLeft;
  btnAddFoodGroup.Left:= iBtnLeft;
  btnCalcul.Left:=iBtnLeft;
end;

end.
