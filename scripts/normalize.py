import unicodedata
import re
import sys

# not working yet
with open('/Users/mac/Desktop/refacto_ml/MaLiNaLi_fulani/fra_ful_build2/data/src_full.txt') as f:
    linesSrc = f.readlines() 

for line in linesSrc:
  line = line.strip()
  line = unicodedata.normalize('NFC', line.encode('utf8'))
  line = line.replace(u"«", u"“").replace(u"»", u"”")
  line = line.encode('utf8').sub(r'(^|[^S\w])#([A-Za-z0-9_]+)', '\\1｟#\\2｠')
  #print(line)

with open('src_full_norm.txt', 'w') as f:
    for line in linesSrc:
        f.write(line)