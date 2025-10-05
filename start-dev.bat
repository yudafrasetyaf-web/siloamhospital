@echo off
echo Starting Siloam Hospital Management System Development...
echo.

echo [1/3] Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm run dev"

echo [2/3] Waiting 5 seconds for backend to start...
timeout /t 5 /nobreak > nul

echo [3/3] Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm run dev"

echo.
echo Development servers are starting...
echo Backend: http://localhost:4000
echo Frontend: http://localhost:3000
echo.
echo Press any key to exit...
pause > nul