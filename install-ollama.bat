@echo off
echo 🚀 Starting Ollama installation with CORS enabled...

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ✓ Running with administrator privileges
) else (
    echo ❌ Please run as administrator!
    echo Right-click this file and select "Run as administrator"
    pause
    exit /b 1
)

:: Download Ollama installer
echo 📥 Downloading Ollama...
curl -L -o "%TEMP%\OllamaSetup.exe" "https://ollama.com/download/OllamaSetup.exe"

:: Install Ollama silently
echo 💿 Installing Ollama...
"%TEMP%\OllamaSetup.exe" /S

:: Wait for installation
timeout /t 5 /nobreak

:: Kill any running Ollama processes
echo 🔄 Configuring Ollama...
taskkill /F /IM "ollama app.exe" 2>nul
taskkill /F /IM "ollama.exe" 2>nul

:: Set CORS environment variable permanently
setx OLLAMA_ORIGINS "*" /M

:: Wait for environment variable to propagate
timeout /t 2 /nobreak

:: Start Ollama with new settings
echo ✨ Starting Ollama with CORS enabled...
start "" "%LOCALAPPDATA%\Programs\Ollama\ollama.exe" serve

:: Wait for Ollama to start
timeout /t 5 /nobreak

:: Pull the model
echo 📥 Downloading llama3 model...
"%LOCALAPPDATA%\Programs\Ollama\ollama.exe" pull llama3:latest

echo ✅ Installation complete! Ollama is running with CORS enabled and llama3 model is installed.
echo You can now close this window and use Ollama with your application.
pause