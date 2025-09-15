Imports System.ServiceModel

' NOTE: You can use the "Rename" command on the context menu to change the interface name "IDonorServiceV1" in both code and config file together.
<ServiceContract()>
Public Interface IDonorServiceV1

    <OperationContract()>
    Function DonorExists(phone As String, eMail As String) As Int32?

End Interface
