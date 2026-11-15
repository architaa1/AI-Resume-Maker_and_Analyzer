#!/bin/bash
# Startup script for Smart AI Resume Analyzer
# Install Chromium and the system OCR/PDF packages before running this script.
if ! command -v google-chrome >/dev/null 2>&1 \
    && ! command -v chromium >/dev/null 2>&1 \
    && ! command -v chromium-browser >/dev/null 2>&1; then
    echo "Chrome/Chromium not found. Install it before starting the application." >&2
    exit 1
fi

exec streamlit run app.py --server.address=0.0.0.0 --server.port="${PORT:-8501}"