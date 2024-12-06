# Ollama CORS Setup Helper

A simple Windows batch script that automates the installation and configuration of Ollama with CORS enabled for client-side applications.

## Why This Exists

Running Large Language Models (LLMs) locally offers several advantages:
- 🔒 Complete privacy - your data never leaves your machine
- 💨 Fast response times - no internet latency
- 💰 No API costs or usage limits
- 🔌 Works offline

However, by default, Ollama's security settings prevent web applications from accessing it directly due to CORS (Cross-Origin Resource Sharing) restrictions. This creates friction for users trying to interact with Ollama through browser-based applications.

## What This Script Does

1. 📥 Downloads the official Ollama installer
2. 💿 Performs a silent installation
3. ⚙️ Configures CORS settings automatically
4. 🤖 Downloads the llama3 model
5. 🚀 Starts Ollama with the correct settings

## Usage

1. Download `install-ollama.bat`
2. Right-click and select "Run as administrator"
3. Wait for the installation to complete
4. That's it! Your Ollama installation is now configured for web access

## Technical Details

The script:
- Sets `OLLAMA_ORIGINS="*"` as a system environment variable
- Manages Ollama processes to ensure clean configuration
- Installs and configures everything with minimal user interaction

## Security Note

This configuration allows any webpage to access your local Ollama instance. While this enables easy integration with web applications, be aware of the security implications. Only use this setup if you trust the web applications accessing Ollama.

## Requirements

- Windows 10 or 11
- Administrator privileges (for installation)
- ~5GB free space (for Ollama and base model)

## Support

If you encounter any issues:
1. Check that you ran the script as administrator
2. Verify Ollama is running (`netstat -ano | findstr :11434`)
3. Check that the model was downloaded (`ollama list`)
