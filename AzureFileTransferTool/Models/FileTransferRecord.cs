using System;

namespace AzureFileTransferTool.Models;

public class FileTransferRecord
{
    public int Id { get; set; }
    public int JobId { get; set; }
    public string FilePath { get; set; } = string.Empty;
    public long FileSize { get; set; }
    public string SourceHash { get; set; } = string.Empty;
    public string DestinationHash { get; set; } = string.Empty;
    public TransferStatus Status { get; set; }
    public string? ErrorMessage { get; set; }
    public DateTime? TransferStartedAt { get; set; }
    public DateTime? TransferCompletedAt { get; set; }
    public int RetryCount { get; set; }
}