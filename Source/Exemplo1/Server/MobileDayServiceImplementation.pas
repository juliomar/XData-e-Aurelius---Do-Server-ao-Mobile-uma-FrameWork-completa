unit MobileDayServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  MobileDayService;

type
  [ServiceImplementation]
  TMobileDayService = class(TInterfacedObject, IMobileDayService)
  private
    function Sum(A, B: double): double;
    function EchoString(Value: string): string;
  end;

implementation

function TMobileDayService.Sum(A, B: double): double;
begin
  Result := A + B;
end;

function TMobileDayService.EchoString(Value: string): string;
begin
  Result := Value;
end;

initialization
  RegisterServiceType(TMobileDayService);

end.
