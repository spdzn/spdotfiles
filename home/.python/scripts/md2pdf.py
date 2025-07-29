#!/usr/bin/env python3

import sys
import os
import markdown
import pdfkit

def md_to_pdf(input_path, output_dir):
    if not os.path.exists(input_path):
        print(f"❌ File not found: {input_path}")
        return

    with open(input_path, 'r', encoding='utf-8') as f:
        text = f.read()

    html = markdown.markdown(text)

    base_name = os.path.basename(input_path).replace('.md', '.pdf')
    output_path = os.path.join(output_dir, base_name)

    # Create output dir if not exists
    os.makedirs(output_dir, exist_ok=True)

    # Convert to PDF
    try:
        pdfkit.from_string(html, output_path)
        print(f"✅ PDF saved: {output_path}")
    except Exception as e:
        print(f"⚠️ Failed to convert: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("📌 Usage: md2pdf <file.md>")
        sys.exit(1)

    input_md = sys.argv[1]
    output_pdf_dir = "/home/sagar/notes/pdf"
    md_to_pdf(input_md, output_pdf_dir)

