$ErrorActionPreference = "Stop"

$Source = Join-Path $PSScriptRoot "src\SquadSeedingLauncher\Program.cs"
$LowSettings = Join-Path $PSScriptRoot "src\SquadSeedingLauncher\Assets\GameUserSettings_Low.ini"
$PublishDir = Join-Path $PSScriptRoot "dist\publish"
$SetupPath = Join-Path $PSScriptRoot "dist\SquadSeedingSetup.exe"
$Compiler = Join-Path $env:WINDIR "Microsoft.NET\Framework64\v4.0.30319\csc.exe"

if (Test-Path $PublishDir) {
    Remove-Item -LiteralPath $PublishDir -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $PublishDir | Out-Null

$CompilerArgs = @(
    "/nologo",
    "/target:exe",
    "/platform:x64",
    "/optimize+",
    "/out:$SetupPath",
    "/resource:$LowSettings,GameUserSettings_Low.ini",
    "/reference:Microsoft.CSharp.dll",
    $Source
)

& $Compiler @CompilerArgs

if ($LASTEXITCODE -ne 0) {
    throw "Build failed."
}

Copy-Item -LiteralPath $SetupPath -Destination (Join-Path $PublishDir "SquadSeeding.exe") -Force

Write-Host ""
Write-Host "Built setup executable:"
Write-Host $SetupPath
