@echo off
chcp 65001 >nul
title 3. Day Code Len GitHub de chay Free 24/7
echo ========================================================
echo   HUONG DAN DAY CODE LEN GITHUB CHAY FREE 24/7
echo ========================================================
echo.
echo 1. Tao mot Repo moi tren GitHub cua ban (chon Private).
echo 2. Dan link GitHub Repository (vi du: https://github.com/username/repo-name.git) vao ben duoi.
echo.
set /p REPO_URL="👉 Nhap link Git Repo cua ban: "

if "%REPO_URL%"=="" (
    echo [LOI] Ban chua nhap link GitHub repo!
    pause
    exit /b
)

echo.
echo Dang khoi tao Git va commit code...
git init
git add .
git commit -m "Setup TikTok Streak Saver 24/7 Free"
git branch -M main
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
git push -u origin main

echo.
echo ========================================================
echo 🎉 DA DAY CODE LEN GITHUB THANH CONG!
echo Bay gio ban chi can vao GitHub Repo:
echo   1. Settings -> Secrets and variables -> Actions -> Them TASKS va COOKIES_ACC1
echo   2. Tab Actions -> Chon workflow -> Run workflow
echo ========================================================
pause
