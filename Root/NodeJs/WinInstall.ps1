param(
    [Parameter(Mandatory = $true)]
    [string]$DesiredVersion,

    [Parameter(Mandatory = $true)]
    [string]$WorkDir
)

# Build filenames and URL
$NodeZipOutName = "node-v$DesiredVersion-win-x64"
$NodeZipUrl = "https://nodejs.org/dist/v$DesiredVersion/$NodeZipOutName.zip"

# Ensure working directory exists
if (-not (Test-Path $WorkDir)) {
    New-Item -Path $WorkDir -ItemType Directory | Out-Null
}

Set-Location $WorkDir

# Clean up previous files/folders (ignore errors if they don't exist)
Remove-Item -Force -ErrorAction SilentlyContinue 'nodejs.zip'
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue 'nodejs'
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue $NodeZipOutName

# Download Node.js ZIP
Invoke-WebRequest -Uri $NodeZipUrl -OutFile './nodejs.zip'

# Extract ZIP
Expand-Archive -Path './nodejs.zip' -DestinationPath '.' -Force

# Rename extracted folder to "nodejs"
Rename-Item -Path $NodeZipOutName -NewName 'nodejs' -Force