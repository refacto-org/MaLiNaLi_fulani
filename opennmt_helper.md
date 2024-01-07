> opennmt_helper

# building tokenized vocab using sentence piece

spm_train --input=/Users/mac/Desktop/refacto_ml/MaLiNaLi_fulani/fr_ff_2/data/src_full.txt --model_prefix=src --vocab_size=14980 --character_coverage=1.0

spm_train --input=/Users/mac/Desktop/refacto_ml/MaLiNaLi_fulani/fr_ff_2/data/tgt_full.txt --model_prefix=tgt --vocab_size=14980 --character_coverage=1.0

# convert sentencepiece vocab to OpenNMT .txt to use it during training

onmt-build-vocab --from_vocab src.vocab --from_format sentencepiece --save_vocab src_vocab.txt
onmt-build-vocab --from_vocab tgt.vocab --from_format sentencepiece --save_vocab tgt_vocab.txt

- then reference it in yml


# boots training if GPU available : 

--num_gpus 2

## To load the latest checkpoint:

    onmt-main --config /content/toy-ende/data.yml --auto_config infer --features_file toy-ende/src-test.txt --predictions_file toy-ende/pred.txt

## To load ckpt-1:

    onmt-main --config /content/toy-ende/data.yml --auto_config --checkpoint_path /content/toy-ende/run/ckpt-1 infer --features_file toy-ende/src-test.txt --predictions_file toy-ende/pred.txt

