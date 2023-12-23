> cr

# 2023 dec 16
- good results using :
    onmt-main --config data.yaml --auto_config infer --features_file src_test.txt
- but __terrible results__ after exporting to tensorflow and serving it in python
- there is probably an issue with the tokenization
