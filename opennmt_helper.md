opennmt_helper

To load the latest checkpoint:

    onmt-main --config /content/toy-ende/data.yml --auto_config infer --features_file toy-ende/src-test.txt --predictions_file toy-ende/pred.txt

To load ckpt-1:

    onmt-main --config /content/toy-ende/data.yml --auto_config --checkpoint_path /content/toy-ende/run/ckpt-1 infer --features_file toy-ende/src-test.txt --predictions_file toy-ende/pred.txt
