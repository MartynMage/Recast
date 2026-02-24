# Recast

A free, local file converter for Windows. No internet connection required — everything runs on your machine.

## Supported Formats

| Category  | Formats |
|-----------|---------|
| 🖼 Images  | PNG, JPG, WEBP, GIF, BMP, TIFF, ICO, HEIC, TGA, PPM |
| 📄 Documents | PDF, DOCX, TXT, CSV, XLSX, XLS, PPTX, RTF, HTML, MD, JSON, XML, ODT |
| 🎵 Audio  | MP3, WAV, FLAC, AAC, OGG, M4A, WMA, OPUS, AIFF |
| 🎬 Video  | MP4, MOV, AVI, MKV, WEBM, FLV, TS, M4V, 3GP, WMV, MPEG + video→GIF, video→MP3 |
| 📚 Ebooks | EPUB, MOBI, AZW3, FB2 |
| 📦 Archives | ZIP, TAR, GZ, 7Z, BZ2 |

## Requirements

- Python 3.10+
- FFmpeg (for audio and video conversion)
- LibreOffice (optional — for PDF/DOCX/RTF conversions)
- Calibre (optional — for ebook conversion)

## Setup

```bash
# Install Python dependencies
pip install -r requirements.txt

# Run
python src/main.py
```

### Installing FFmpeg (required for audio & video)

1. Download from https://ffmpeg.org/download.html
2. Extract the zip
3. Add the `bin` folder to your Windows PATH
4. Verify with: `ffmpeg -version`

## Build (Windows .exe)

```bash
pip install pyinstaller
build.bat
```

The compiled `.exe` will appear in `dist/Recast.exe`.

## Optional dependencies

| Feature | Requirement |
|---------|-------------|
| HEIC images | `pillow-heif` (included) |
| PDF/DOCX/RTF conversion | [LibreOffice](https://www.libreoffice.org) |
| Ebook conversion | [Calibre](https://calibre-ebook.com) |
| 7z archives | `py7zr` (included) |

## License

MIT
