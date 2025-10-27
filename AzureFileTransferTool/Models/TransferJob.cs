using System;

namespace AzureFileTransferTool.Models;

public class TransferJob
{
    public int Id { get; set; }
    public string SourcePath { get; set; } = string.Empty;
    public StorageType DestinationType { get; set; }
    public string DestinationConnection { get; set; } = string.Empty;
    public string ContainerName { get; set; } = string.Empty;
    public TransferStatus Status { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public int TotalFiles { get; set; }
    public int CompletedFiles { get; set; }
    public int FailedFiles { get; set; }
}