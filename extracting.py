# python3 -m pip install pypdf

from pathlib import Path
from pypdf import PdfReader

home = Path.home()
cwd = Path.cwd()

pdf_path = cwd/'to_extract'/'poemes.pdf'
txt_file = cwd/'to_extract'/'poemes.txt'

pdf_reader = PdfReader(pdf_path)
content = [f'{pdf_reader.metadata.title}']

print(len(pdf_reader.pages))

for page in pdf_reader.pages:    
    content.append(page.extract_text())

txt_file.write_text("\n".join(content))


