@echo off
chcp 65001 >nul
title Day Ma Nguon Len GitHub - TikTok Streak Flow
echo ======================================================================
echo          ĐẨY MÃ NGUỒN LÊN GITHUB: huy22122/tiktok-streak-saver
echo ======================================================================
echo.
echo [1] Dang kiem tra git va commit ma nguon...
git config user.name "huy22122"
git config user.email "huy22122@users.noreply.github.com"
git branch -M main
git remote remove origin >nul 2>&1
git remote add origin https://github.com/huy22122/tiktok-streak-saver.git

echo.
echo ======================================================================
echo BAN CHON 1 TRONG 2 CACH DE DAY LEN GITHUB:
echo.
echo [1] Nhan [Enter]: Trinh duyet se tu dong bat len de ban dang nhap GitHub
echo [2] Dan ma Token moi (co quyen repo va workflow) vao day
echo ======================================================================
set /p USER_INPUT="👉 Nhap Token (hoac nhan Enter de dung trinh duyet): "

if not "%USER_INPUT%"=="" (
    echo Dang su dung Token cua ban de ket noi...
    git remote set-url origin https://huy22122:%USER_INPUT%@github.com/huy22122/tiktok-streak-saver.git
) else (
    git remote set-url origin https://github.com/huy22122/tiktok-streak-saver.git
)

echo.
echo Dang day ma nguon len GitHub...
echo (Neu co cua so trinh duyet bat len, hay bam "Sign in with your browser")
echo.

git push -u origin main --force

if errorlevel 1 (
    echo.
    echo ======================================================================
    echo ❌ CHUA DAY LEN DUOC!
    echo Nguyen nhan thuong gap:
    echo 1. Token cu da bi thay the khi ban sua quyen tren GitHub.
    echo    - Hay vao https://github.com/settings/tokens copy lai chuoi token moi!
    echo 2. Hoac ban chua bam "Sign in with your browser" khi cua so hien len.
    echo ======================================================================
) else (
    echo.
    echo ======================================================================
    echo 🎉 XUAT SAC! DA DAY TOAN BO MA NGUON LEN GITHUB THANH CONG!
    echo.
    echo Bay gio ban hay:
    echo 1. F5 lai trang GitHub cua ban de xem code:
    echo    https://github.com/huy22122/tiktok-streak-saver
    echo.
    echo 2. Cai dat Secrets (lay tu App Quan Ly Mo_Trinh_Quan_Ly.bat):
    echo    https://github.com/huy22122/tiktok-streak-saver/settings/secrets/actions
    echo    - TASKS
    echo    - COOKIES_ACC1
    echo ======================================================================
)

echo.
pause
