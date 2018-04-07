program FoodCount;

uses
  Vcl.Forms,
  AddUser in 'AddUser.pas' {AddUserForm},
  AddFood in 'AddFood.pas' {AddFoodForm},
  MainUnit in 'MainUnit.pas' {MainForm},
  AddGroupFood in 'AddGroupFood.pas' {AddGroupFoodForm},
  CalcUnit in 'CalcUnit.pas' {CalculateForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddUserForm, AddUserForm);
  Application.CreateForm(TAddFoodForm, AddFoodForm);
  Application.CreateForm(TAddGroupFoodForm, AddGroupFoodForm);
  Application.CreateForm(TCalculateForm, CalculateForm);
  Application.Run;
end.
