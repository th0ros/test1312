# ekostra-processor.ps1

# Define the function to update identityserver.json files
function Update-IdentityServer {
    param (
        [string]$ekostraPath,
        [string]$identityServerPath
    )

    # Backup the original identityserver.json
    Copy-Item -Path $identityServerPath -Destination "$identityServerPath.bak"

    # Read the current content of identityserver.json
    $identityServerContent = Get-Content -Path $identityServerPath -Raw | ConvertFrom-Json

    # Add Ekostra configuration under Clients section
    $ekostraConfig = @{
        Name = "Ekostra"
        Enabled = $true
        # Add other necessary properties here
    }

    $identityServerContent.Clients += $ekostraConfig

    # Write the updated content back to identityserver.json
    $identityServerContent | ConvertTo-Json -Depth 10 | Set-Content -Path $identityServerPath
}

# Search for ekostra.json files
$ekostraFiles = Get-ChildItem -Path "C:\" -Recurse -Filter "ekostra.json"

foreach ($ekostraFile in $ekostraFiles) {
    $ekostraContent = Get-Content -Path $ekostraFile.FullName | ConvertFrom-Json
    if ($ekostraContent.Enabled -eq $true) {
        # Find corresponding identityserver.json file, assuming it is located in the same directory
        $identityServerFile = Join-Path -Path $ekostraFile.DirectoryName -ChildPath "identityserver.json"
        if (Test-Path -Path $identityServerFile) {
            Update-IdentityServer -ekostraPath $ekostraFile.FullName -identityServerPath $identityServerFile
        }
    }
}