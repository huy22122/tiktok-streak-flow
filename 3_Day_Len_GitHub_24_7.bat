@echo off
chcp 65001 >nul
title 3. Day Code Len GitHub de chay Free 24/7
echo ======================================================================
echo          ĐẨY MÃ NGUỒN LÊN GITHUB ĐỂ CHẠY TIKTOK STREAK 24/7
echo ======================================================================
echo.
echo Link Repo GitHub cua ban hien tai la:
echo 👉 https://github.com/huy22122/tiktok-streak-saver.git
echo.
echo [Nhan Enter de su dung link tren, hoac dan link moi neu muon doi]
set /p REPO_URL="👉 Nhan Enter de tiep tuc: "

if "%REPO_URL%"=="" (
    set REPO_URL=https://github.com/huy22122/tiktok-streak-saver.git
)

echo.
echo ======================================================================
echo [1] Dang kiem tra va commit toan bo ma nguon...
git config user.name "huy22122" >nul 2>&1
git config user.email "huy22122@users.noreply.github.com" >nul 2>&1
git add .
git commit -m "feat: setup TikTok Streak Saver 24/7 with app manager" >nul 2>&1
git branch -M main

echo [2] Dang ket noi toi Repo: %REPO_URL%
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%

echo [3] Dang day ma nguon len GitHub...
echo (Luu y: Neu co cua so trinh duyet hien ra, hay bam "Sign in with your browser" de dang nhap GitHub)
echo.

git push -u origin main
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ======================================================================
    echo ⚠️ CHUA THE DAY LEN DUOC! CO THE DO BAN CHUA DANG NHAP GITHUB TREN MAY.
    echo Hay lam theo 1 trong 2 cach sau:
    echo.
    echo Cach 1: Chay lenh sau trong CMD hoac PowerShell de dang nhap:
    echo         gh auth login
    echo.
    echo Cach 2: Neu GitHub yeu cau Personal Access Token (PAT):
    echo         Vao https://github.com/settings/tokens tao 1 token co quyen 'repo'
    echo         roi dung token do lam mat khau khi git hoi.
    echo ======================================================================
) else (
    echo.
    echo ======================================================================
    echo 🎉 DA DAY TOAN BO CODE LEN GITHUB THANH CONG!
    echo.
    echo Cac buoc tiep theo:
    echo 1. Vao GitHub Repo cua ban:
    echo    https://github.com/huy22122/tiktok-streak-saver/settings/secrets/actions
    echo 2. Them 2 Secrets (lay tu App Quan Ly):
    echo    - TASKS
    echo    - COOKIES_ACC1
    echo 3. Vao tab Actions tren GitHub -> Bam "Enable workflows"
    echo ======================================================================
)

echo.
pause
