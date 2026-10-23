@echo off
title Landslide AI PRO Launcher
echo ======================================================================
echo             Landslide AI PRO - Starting Ecosystem
echo ======================================================================
echo.

cd /d "%~dp0"

echo [1/3] Starting FastAPI Backend on http://127.0.0.1:8000 ...
start "Landslide AI PRO - Backend" powershell -NoExit -ExecutionPolicy Bypass -Command "Set-Location '%~dp0'; & '.\.venv\Scripts\python.exe' -m uvicorn backend.app:app --reload --host 127.0.0.1 --port 8000"

echo [2/3] Waiting 4 seconds for backend to start...
timeout /t 4 /nobreak >nul

echo [3/3] Starting Next.js Dashboard Frontend on http://localhost:3000 ...
start "Landslide AI PRO - Frontend" powershell -NoExit -ExecutionPolicy Bypass -Command "Set-Location '%~dp0dashboard'; npm run dev"

echo.
echo ======================================================================
echo Both servers are launching!
echo Backend API & Docs: http://127.0.0.1:8000/docs
echo Frontend Dashboard: http://localhost:3000
echo ======================================================================
echo.
echo Opening browser in 3 seconds...
timeout /t 3 /nobreak >nul
start http://localhost:3000
