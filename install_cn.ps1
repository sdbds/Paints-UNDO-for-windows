Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
$Env:PIP_INDEX_URL = "https://pypi.mirrors.ustc.edu.cn/simple"
$Env:HF_ENDPOINT = "https://hf-mirror.com"
$Env:HF_HUB_ENABLE_HF_TRANSFER=1

if (!(Test-Path -Path "venv")) {
    Write-Output  "创建python虚拟环境venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "安装依赖..."
pip install xformers==0.0.26.post1 --no-deps
pip install -U -r requirements-windows.txt

Write-Output  "下载模型..."
#huggingface-cli download --resume-download fudan-generative-ai/hallo --local-dir pretrained_models --local-dir-use-symlinks False


Write-Output "安装完成"
Read-Host | Out-Null ;
