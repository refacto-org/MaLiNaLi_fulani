import os
from pathlib import Path
from pypdf import PdfReader

cwd = Path.cwd()
pdf_path = cwd/'to_extract'/'pular_new_testament.pdf'

reader = PdfReader(pdf_path)
if reader.is_encrypted:
    try:
        reader.decrypt("")
        print("File Decrypted (PyPDF2)")
    except:
        command = (
            "cp "
            + filename
            + " temp.pdf; qpdf --password='' --decrypt temp.pdf "
            + filename
            + "; rm temp.pdf"
        )
        os.system(command)
        print("File Decrypted (qpdf)")
        reader = PdfReader(filename)
else:
    print("File Not Encrypted")
