@echo off
chcp 65001 >nul
title 2. Chay Thu Nghiem Rep Chuoi TikTok
echo ========================================================
echo   TIKTOK STREAK SAVER - CHAY THU NGHIEM TAI CHO
echo ========================================================
echo.
if not exist .env (
    echo [CANH BAO] Ban chua tao file .env!
    echo Vui long chay file '1_Dang_Nhap_Lay_Cookie.bat' truoc de dang nhap.
    echo.
    pause
    exit /b
)

set PYTHONIOENCODING=utf-8
python main.py

echo.
echo ========================================================
echo Da hoan thanh qua trinh gui tin nhan giu chuoi!
echo ========================================================
pause
