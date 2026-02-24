<img width="892" height="610" alt="image" src="https://github.com/user-attachments/assets/d804c818-3bf9-41de-85dd-f4e883b0398d" />

# Recast

A free, local file converter for Windows. No internet connection required — everything runs on your machine.

## Supported Formats

| Category     | Formats |
|--------------|---------|
| 🖼 Images    | PNG, JPG, WEBP, GIF, BMP, TIFF, ICO, HEIC, TGA, PPM |
| 📄 Documents | PDF, DOCX, TXT, CSV, XLSX, XLS, PPTX, RTF, HTML, MD, JSON, XML, ODT |
| 🎵 Audio     | MP3, WAV, FLAC, AAC, OGG, M4A, WMA, OPUS, AIFF |
| 🎬 Video     | MP4, MOV, AVI, MKV, WEBM, FLV, TS, M4V, 3GP, WMV, MPEG + video→GIF, video→MP3 |
| 📚 Ebooks    | EPUB, MOBI, AZW3, FB2 |
| 📦 Archives  | ZIP, TAR, GZ, 7Z, BZ2 |

---

## Setup

### 1. Install Python

Download Python **3.10–3.12** from https://python.org

> ⚠️ **Avoid Python 3.13+** — the `pydub` audio library depends on `audioop` which was removed in Python 3.13. If you are already on 3.13, see the Known Issues section below.

During install, tick **"Add Python to PATH"**.

### 2. Install FFmpeg (required for audio & video)

Download the pre-built Windows binaries from https://www.gyan.dev/ffmpeg/builds/

Download **`ffmpeg-release-essentials.zip`**, extract it, then:

1. Copy the contents of the `bin\` folder to somewhere permanent (e.g. `C:\ffmpeg\bin\`)
2. Add that path to your Windows **System PATH**:
   - Search "Environment Variables" in Start
   - System variables → Path → Edit → New → paste `C:\ffmpeg\bin`
   - Click OK all the way through
3. Open a **new** terminal and verify: `ffmpeg -version`

> ⚠️ **Do not use the FFmpeg source code tarball** — you need the pre-built essentials build from gyan.dev, not the raw source.

### 3. Install Python dependencies

> ⚠️ **Do not use `pip install -r requirements.txt` directly** — one of the transitive dependencies (`pycryptodomex`) can hang indefinitely during install. Use the command below instead, which only installs what Recast actually needs:

```
pip install customtkinter pillow pillow-heif pandas openpyxl xlrd python-docx fpdf2 python-pptx markdown pydub ffmpeg-python py7zr
```

### 4. Run

```
python src/main.py
```

---

## Build (Windows .exe)

> ⚠️ Do not run `build.bat` directly until dependencies are installed — the script uses `python -m PyInstaller` which requires it to be installed first.

```
python -m pip install pyinstaller
python -m PyInstaller --onefile --windowed --name Recast --hidden-import=audioop --hidden-import=audioop_lts --collect-all=pydub src/main.py
```

The compiled `.exe` will appear in `dist\Recast.exe`.

> ⚠️ **Do not use `pyinstaller` directly** (without `python -m`) — on some Windows setups the pyinstaller command is not added to PATH and will show `'pyinstaller' is not recognized`.

> ℹ️ The `--hidden-import=audioop` and `--collect-all=pydub` flags are required. Without them the `.exe` will crash on launch with `ModuleNotFoundError: No module named 'pyaudiooop'`.

---

## Optional Dependencies

Some conversions require external tools to be installed. Recast detects these at startup — if a tool is missing, the affected format chips are shown as locked with a tooltip explaining what to install.

| Feature | Tool | Download |
|---------|------|----------|
| PDF → DOCX, DOCX → PDF, HTML → PDF, PPTX → PDF, RTF conversions | LibreOffice | https://www.libreoffice.org |
| Ebook conversion (EPUB, MOBI, AZW3, FB2) | Calibre | https://calibre-ebook.com |

Both are free. After installing either tool, restart Recast and the locked chips will become available.

---

## Known Issues

### Python 3.13 — `No module named 'pyaudiooop'`

`pydub` depends on `audioop` which was removed in Python 3.13. Fix:

```
pip install audioop-lts
```

Then rebuild the exe with the hidden import flags shown in the Build section above.

### `'pyinstaller' is not recognized`

Use `python -m PyInstaller` instead of `pyinstaller`. See Build section above.

### `pip install -r requirements.txt` hangs

A transitive dependency (`pycryptodomex`) can stall indefinitely. Press `Ctrl+C` and use the manual install command in Step 3 instead.

### Windows SmartScreen warning on first run

Windows may show "Windows protected your PC" for unsigned executables. Click **More info → Run anyway** to proceed. This is expected for any new unsigned `.exe`.

---

## License

MIT
