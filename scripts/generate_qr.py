#!/usr/bin/env python3
"""Generate a QR code PNG for a published Pages URL.

Usage:
  python scripts/generate_qr.py https://<owner>.github.io/<repo>/ output_qr.png

Requires:
  pip install qrcode[pil]
"""
import sys
from pathlib import Path

if len(sys.argv) < 2:
    print("Usage: python scripts/generate_qr.py <url> [output.png]", file=sys.stderr)
    sys.exit(2)

url = sys.argv[1]
out = Path(sys.argv[2] if len(sys.argv) >= 3 else "site_qr.png")

try:
    import qrcode
except ImportError:
    print("Missing dependency: qrcode. Install with: pip install 'qrcode[pil]'", file=sys.stderr)
    sys.exit(1)

img = qrcode.make(url)
img.save(out)
print(f"QR code written to {out}")
