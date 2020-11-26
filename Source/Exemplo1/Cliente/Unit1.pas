unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses XData.Client, Entidades, System.Generics.Collections, MobileDayService;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.Button1Click(Sender: TObject);
var
  LCliente : TXDataClient;
  LArtistas : TList<TArtist>;
  LArtista : TArtist;
begin
  LCliente := TXDataClient.Create;
  try
    LCliente.Uri := 'http://192.168.0.106:2001/tms/xdata';

    LArtistas:=  LCliente.List<TArtist>;

    for LArtista in LArtistas do
    begin
      ListBox1.Items.Add(LArtista.ArtistId.ToString + ' - ' + LArtista.Name.Value);
    end;

  finally
    LCliente.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LCliente : TXDataClient;
  LArtista : TArtist;
begin
  LCliente := TXDataClient.Create;
  try
    LCliente.Uri := 'http://192.168.0.106:2001/tms/xdata';

    LArtista := TArtist.Create;
    try
      LArtista.Name := 'Juliomar Marchetti';

      LCliente.Post(LArtista);
    finally
      LArtista.Free;
    end;
  finally
    LCliente.Free;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  LCliente : TXDataClient;
  LArtista : TArtist;
begin
  LCliente := TXDataClient.Create;
  try
    LCliente.Uri := 'http://192.168.0.106:2001/tms/xdata';


    LArtista := LCliente.Get<TArtist>(274);
    try
      LArtista.Name := 'Mobile Days 2020';

      LCliente.Put(LArtista);
    finally
      LArtista.Free;
    end;
  finally
    LCliente.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  LCliente : TXDataClient;
  LArtista : TArtist;
begin
  LCliente := TXDataClient.Create;
  try
    LCliente.Uri := 'http://192.168.0.106:2001/tms/xdata';

    LArtista := LCliente.Get<TArtist>(275);

    LCliente.Delete(LArtista);

  finally
    LCliente.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  LCliente : TXDataClient;
  LMobileDay : IMobileDayService;
  res : double;
begin
  LCliente := TXDataClient.Create;
  try
    LCliente.Uri := 'http://192.168.0.106:2001/tms/xdata';

    LMobileDay := LCliente.Service<IMobileDayService>;

    res := LMobileDay.Sum(4,5);
    Label1.Text := FloatToStr(res) ;



  finally
    LCliente.Free;
  end;
end;

end.
