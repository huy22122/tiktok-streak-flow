@echo off
chcp 65001 >nul
title 1. Dang Nhap va Lay Cookie TikTok
echo ========================================================
echo   TIKTOK STREAK SAVER - HUONG DAN DANG NHAP
echo ========================================================
echo.
echo Dang kiem tra moi truong Python va thu vien...
python -m pip install -r requirements.txt >nul 2>&1
playwright install chromium >nul 2>&1

set PYTHONIOENCODING=utf-8
python login_helper.py

pause
