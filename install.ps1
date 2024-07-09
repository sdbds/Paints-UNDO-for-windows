Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1

if (!(Test-Path -Path "venv")) {
    Write-Output  "Creating venv for python..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "install deps..."
pip install -U -r requirements-windows.txt
pip install .

Write-Output "check models..."

huggingface-cli download --resume-download fudan-generative-ai/hallo --local-dir pretrained_models --local-dir-use-symlinks False

Write-Output "Install completed"
Read-Host | Out-Null ;
