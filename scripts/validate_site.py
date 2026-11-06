from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlparse, unquote
import sys

ROOT = Path(__file__).resolve().parents[1]
APP = ROOT / "application"
HTML_FILE = APP / "index.html"

class SiteChecker(HTMLParser):
    def __init__(self):
        super().__init__()
        self.ids = set()
        self.links = []

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)

        if attrs.get("id"):
            self.ids.add(attrs["id"])

        for attr in ("href", "src"):
            value = attrs.get(attr)
            if value:
                self.links.append(value)

def main():
    required = [
        APP / "index.html",
        APP / "style.css",
        APP / "script.js",
    ]

    failed = False

    for file in required:
        if file.is_file():
            print(f"PASS: {file.relative_to(ROOT)} exists")
        else:
            print(f"FAIL: {file.relative_to(ROOT)} is missing")
            failed = True

    if failed:
        return 1

    checker = SiteChecker()

    try:
        checker.feed(HTML_FILE.read_text(encoding="utf-8"))
    except Exception as error:
        print(f"FAIL: HTML could not be parsed: {error}")
        return 1

    for link in checker.links:
        parsed = urlparse(link)

        if parsed.scheme or parsed.netloc:
            continue

        if parsed.path:
            target = (APP / unquote(parsed.path)).resolve()

            if not target.is_relative_to(APP.resolve()) or not target.is_file():
                print(f"FAIL: Broken local file reference: {link}")
                failed = True
            else:
                print(f"PASS: Local file reference: {link}")

        if parsed.fragment and parsed.fragment not in checker.ids:
            print(f"FAIL: Missing HTML section: #{parsed.fragment}")
            failed = True
        elif parsed.fragment:
            print(f"PASS: HTML section: #{parsed.fragment}")

    if failed:
        print("\nSite validation failed.")
        return 1

    print("\nSUCCESS: All website checks passed.")
    return 0

if __name__ == "__main__":
    sys.exit(main())
