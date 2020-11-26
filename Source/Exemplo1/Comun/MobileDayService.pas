unit MobileDayService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  IMobileDayService = interface(IInvokable)
    ['{3BF871EA-588F-4E5B-A23C-D018C1153765}']
    [HttpGet] function Sum(A, B: double): double;
    // By default, any service operation responds to (is invoked by) a POST request from the client.
    function EchoString(Value: string): string;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IMobileDayService));

end.
