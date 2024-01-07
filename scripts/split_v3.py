# voir aussi le script dart à compléter

from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
 
# read the dataset
with open('/Users/mac/Desktop/refacto_ml/MaLiNaLi_fulani/fra_ful_build2/data/src_full.txt') as f:
    linesSrc = f.readlines() 

with open('/Users/mac/Desktop/refacto_ml/MaLiNaLi_fulani/fra_ful_build2/data/tgt_full.txt') as t:
    linesTgt = t.readlines() 

 
# split the dataset
X_train, X_test, y_train, y_test = train_test_split(
    linesSrc, linesTgt, test_size=0.05, random_state=42)

with open('src_train.txt', 'w') as f:
    for line in X_train:
        f.write(line)

with open('src_test.txt', 'w') as f:
    for line in X_test:
        f.write(line)

with open('tgt_train.txt', 'w') as f:
    for line in y_train:
        f.write(line)

with open('tgt_test.txt', 'w') as f:
    for line in y_test:
        f.write(line)