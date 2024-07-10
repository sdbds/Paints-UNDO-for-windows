Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1

if (!(Test-Path -Path "venv")) {
    Write-Output  "Creating venv for python..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "install deps..."
pip install xformers==0.0.26.post1 --no-deps
pip install -U -r requirements-windows.txt

Write-Output "Install completed"
Read-Host | Out-Null ;
