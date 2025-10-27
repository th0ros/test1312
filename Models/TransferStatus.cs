namespace AzureFileTransferTool.Models;

public enum TransferStatus
{
    Pending,
    InProgress,
    Completed,
    Failed,
    Cancelled,
    VerificationFailed
}