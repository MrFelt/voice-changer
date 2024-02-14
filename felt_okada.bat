@echo off

:: Set the name of your virtual environment folder
set VENV_DIR=%~dp0\voice-changer\venv\
set SERV_DIR=%~dp0\voice-changer\server\
set REPO_DIR=%~dp0\voice-changer\
set REPO_URL=https://github.com/MrFelt/voice-changer



:download
cd %REPO_DIR%
if exist %REPO_DIR% (
    echo "'%REPO_DIR%' already exists. Updating..."
    git pull
    if %ERRORLEVEL% NEQ 0 (
        pause
    )
) else (
    echo "Directory '%REPO_DIR%' does not exist. Cloning repository..."
	git clone %REPO_URL% w-okada_felt
    if %ERRORLEVEL% NEQ 0 (
        pause
    ) 
)



:venv
if exist %VENV_DIR% (
    echo "Virtual environment '%VENV_DIR%' already exists. Activating..."
    call %VENV_DIR%\Scripts\activate.bat
) else (
    echo "Virtual environment '%VENV_DIR%' not found. Creating..."
    python -m venv %VENV_DIR%
    if %ERRORLEVEL% NEQ 0 (
        echo "Error creating virtual environment. Please check your Python installation."
        pause
        exit /B 1
    )
    echo "Virtual environment created successfully. Activating..."
    call %VENV_DIR%\Scripts\activate.bat
)

set /P "Q=Is this your first time running? (y/n): "
if /I not "%Q%" == "y" goto requirements
if /I not "%Q%" == "Y" goto requirements
if /I "%Q%" == "" goto start 
if /I "%Q%" == "n" goto start
if /I "%Q%" == "N" goto start

:requirements
cd %SERV_DIR%
python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
python -m pip install fairseq==0.12.2 pyworld==0.3.4
python -m pip install -r requirements.txt


MD model_dir



:start
cd %SERV_DIR%
python MMVCServerSIO.py -p 18888 --https true \
    --content_vec_500 pretrain/checkpoint_best_legacy_500.pt  \
    --content_vec_500_onnx pretrain/content_vec_500.onnx \
    --content_vec_500_onnx_on true \
    --hubert_base pretrain/hubert_base.pt \
    --hubert_base_jp pretrain/rinna_hubert_base_jp.pt \
    --hubert_soft pretrain/hubert/hubert-soft-0d54a1f4.pt \
    --nsf_hifigan pretrain/nsf_hifigan/model \
    --crepe_onnx_full pretrain/crepe_onnx_full.onnx \
    --crepe_onnx_tiny pretrain/crepe_onnx_tiny.onnx \
    --rmvpe pretrain/rmvpe.pt \
    --model_dir model_dir \
    --samples samples.json
