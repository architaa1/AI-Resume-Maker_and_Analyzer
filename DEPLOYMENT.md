# Deployment Guide for Smart AI Resume Analyzer

This guide provides instructions for deploying the Smart AI Resume Analyzer application in various environments, with a focus on resolving Chrome webdriver issues.

## Local Deployment

### Prerequisites
- Python 3.7 or higher
- Chrome browser installed
- pip for installing dependencies

### Steps for Windows
1. Clone the repository
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run the application using the Python script:
   ```
   python run_app.py
   ```
   
   Selenium manages a compatible ChromeDriver when the browser is used.

   Alternatively, you can run the batch file:
   ```
   startup.bat
   ```

### Steps for Linux/Mac
1. Clone the repository
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run the application:
   ```
   streamlit run app.py
   ```

   Alternatively, use the startup script after installing Chrome/Chromium and the required system packages:
   ```
   chmod +x startup.sh
   ./startup.sh
   ```

## Server Deployment (Linux)

### Installing Chrome on Ubuntu/Debian
```bash
# Update package list
sudo apt update

# Install Chrome dependencies
sudo apt install -y wget unzip fontconfig fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libdrm2 libgbm1 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libxcomposite1 libxdamage1 libxfixes3 libxkbcommon0 libxrandr2 xdg-utils

# Download and install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Verify installation
google-chrome --version

# Install OCR and PDF utilities
sudo apt install -y tesseract-ocr poppler-utils
```

### Installing Chrome on CentOS/RHEL
```bash
# Add Chrome repository
sudo tee /etc/yum.repos.d/google-chrome.repo <<EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

# Install Chrome
sudo yum install -y google-chrome-stable

# Verify installation
google-chrome --version
```

### Running the Application on Server
After installing Chrome, deploy the application:

1. Clone the repository
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run the application (or use `startup.sh` after installing Chromium):
   ```
   streamlit run app.py
   ```

## Windows Server Deployment

### Prerequisites
- Python 3.7 or higher
- Chrome browser installed
- pip for installing dependencies

### Steps
1. Clone the repository
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run the application using the Python script:
   ```
   python run_app.py
   ```
   
   Selenium manages a compatible ChromeDriver when the browser is used.

## Streamlit Cloud Deployment

The app uses Chromium for job-search scraping and system OCR/PDF tools for resume processing.

### Steps for Streamlit Cloud
1. Push your code to a GitHub repository
2. Create a new app in Streamlit Community Cloud and set the main file to `app.py`.
3. Keep `requirements.txt` and `packages.txt` at the repository root. `packages.txt` installs Chromium, Tesseract, and Poppler.

## Docker Deployment

The repository's `Dockerfile` installs Chromium, its matching driver, Tesseract, and Poppler.

```bash
docker build -t resume-analyzer .
docker run --rm -p 8501:8501 resume-analyzer
```

## Troubleshooting Common Issues

### Error: "Service unexpectedly exited"
This usually indicates that Chrome cannot be started. Ensure:
- Chrome is installed
- You have the correct permissions
- You're using the `--no-sandbox` option in headless environments

### Error: "Chrome version must be between X and Y"
Selenium Manager selects a compatible ChromeDriver automatically. Make sure the installed Selenium package is current and that the browser is available on `PATH` or configured with `CHROME_BIN`.

### Error: "Permission denied" when installing chromedriver
Ensure the browser and driver are installed in locations accessible to the application user. In Docker and Streamlit Cloud, use the repository's system package configuration rather than downloading a driver at startup.

### Error: "unknown error: DevToolsActivePort file doesn't exist"
This is common in containerized environments:
- Add `--disable-dev-shm-usage` to Chrome options (already included in our setup)
- Ensure you're using `--no-sandbox` in Docker/container environments

### Windows-specific issues
If you encounter issues on Windows:
- Make sure Chrome is installed in the standard location
- Try running the application as administrator
- Use `run_app.py` or `startup.bat` to start the application
- Check Windows Defender or antivirus software that might be blocking chromedriver

## Additional Resources
- [Selenium Documentation](https://www.selenium.dev/documentation/)
- [Chrome for Testing](https://developer.chrome.com/docs/chromium/chrome-for-testing)
- [Streamlit Deployment](https://docs.streamlit.io/streamlit-cloud/get-started/deploy-an-app) 