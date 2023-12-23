
- building tokenized vocab
```bash
onmt-build-vocab --tokenizer_config config/source_tokenizer_config.yml --size 10000 --save_vocab data/src-vocab.txt data/src-train.txt
onmt-build-vocab --tokenizer_config config/target_tokenizer_config.yml --size 10000 --save_vocab data/tgt-vocab.txt data/tgt-train.txt
```