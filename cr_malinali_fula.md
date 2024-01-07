state-of-the-art accuracy (37.5 in terms of BLEU score)
hugging face token : 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

# 2024 
## 2024 janvier 

leave offline until openNMT answers : https://github.com/OpenNMT/OpenNMT-tf/issues/1005

Extending OpenNMT’s TensorFlow Lite to Include Transformer Models - https://apps.dtic.mil/sti/pdfs/AD1144269.pdf

Transformer models cannot be quantized !
Transformer Relative models with Beam Search do not export to
TensorFlow Lite

Beam Search can

?? TFLite interpreter needs to link Flex delegate in order to run the model since it contains the following Select TFop(s): Flex ops: FlexStringToHashBucketFast, FlexTensorListLength, FlexTensorListReserve, FlexTensorListSetItem, FlexTensorListStack

=> flex free is possible but require additionnal work, see : https://github.com/tensorflow/tensorflow/issues/45875


- use OpenNMT on the Grammar Error Correction (GEC) task for low resource language
https://huggingface.co/jordimas/gec-opennmt-english

https://nlpcloud.com/

### 2024 janvier 4 jeudi
- échec définitif Marian, vive OpenNMT et si besoin explorons de + gros modèles mais BASTA !

### 2024 janvier 3 mercredi
- puisque le finetuning ne fonctionne pas via azure ml, si via autotrain de hugging face...
- checking the progress of training at : 
  - https://huggingface.co/spaces/flutter-painter/autotrain-autotrain-jmw80-7o2dg?logs=container


- KO sur m2m_100, ko sur mbart, mais ok (en cours) chez google byt5 :::
  - https://huggingface.co/spaces/flutter-painter/autotrain-autotrain-jmw80-7o2dg?logs=container

- une approche clé en main pour "finetuner" le modèle mbart : https://medium.com/@pablo_rf/fine-tuning-mbart-to-unseen-languages-c2fd55388ac5
- seulement il faut un GPU à 50G, je ne sais pas si ça fonctionnera sur azure ML
- ce serait plus prudent de revenir à openNMT voire à MarianMT pour 


- failed finetuning on M2M_100 using auto-train : 


____

***

- backup fichiers lourds dans : azureml / awesome_fula_pular_heavy_resources_and_audio

# 2023 dec 26
> utils extraction des ressources pdf

https://github.com/ocrmypdf/OCRmyPDF
brew install ocrmypdf
20 giga pour console mac

https://github.com/jrmuizel/pdf-extract rust
https://github.com/insinfo/pdf_text_extraction dart windows/linux rekk

https://pdfsam.org/download-pdfsam-enhanced/
https://github.com/torakiki/pdfsam


# 2023 dec 16
- good results using :
    onmt-main --config data.yaml --auto_config infer --features_file src_test.txt
- but __terrible results__ after exporting to tensorflow and serving it in python
- there is probably an issue with the tokenization


# 2023_12_13

- bitextor?  https://bitextor.readthedocs.io/en/latest/ 
    - tool to automatically harvest bitexts from multilingual websites.


- desktop translator - windows & macos, génial
  - https://github.com/ymoslem/DesktopTranslator

# 2023_12_12
- refait une 3è version du modèle, là ça passait pas à l'export
- ouvert issue sur openNMT & onnx

- pretty easy for android textfield

- relancé sacha, mais candle c'est bon de toute façon que pour du pc
  - https://github.com/gyscos/cursive - pour du rust textfield natif

# 2023_12_11
- première version du modèle intégrée dans l'app tensorflow mais KO
  - modèle erroné fort probable en tous cas export simple échoue 

- cawoyel slack - https://app.slack.com/client/T066JMQ097G/D06A4GD83R7

# 2023_11_19

- avancées sur k2/sherpa grâce à Nick Fisher, à poursuivre
- avancée sur le fait d'utiliser ML direct dans Flutter grâce à https://github.com/Telosnex/fonnx
  - seulement galère pour whisper au-delà de tiny...
- avancée sur talkbridge, build bien sur macos

# 2023_11_08

- rust flutter bridge galère, met de côté (encore) et prioris openNMT
  - la génération est ok mais il ne se passe rien lors du build macos

- isolé les expressions du dico fula-fr jusqu'à la ligne 1331 (sur 16 925)

- mongodb pour la connexion avec l'app

# 2023_10_28

- j'ai joué l'exemple marian translation dans __rust_bert__
- j'ai joué l'exemple __flutter_rust_bridge_template__
- mais je ne parviens pas à build rust_bert dans le bridge à cause de libtorch (rs-torch)
- déjà bien relou à configurer au niveau du path, j'ai l'impression que cette lib est trop lourde
- je bascule sur [candle](https://github.com/huggingface/candle/tree/main)
- dont l'un des membres actifs LaurentMazare est le créateur de rs-torch justement
- j'ai demandé de l'aide pour un exemple Marian via candle

- je tente avec t5 et me rend compte que le rust-flutter-bridge ne supporte pas les tokenizer
- -> donc on va sur OpenNMT et tensorflow __sans hésiter !__

En attendant de voir comment ça évolue, je me concentre sur le modèle via Azure ML

> réponse à la question du 2023_10_22 
- OpenNMT ceux sont x3 français à Paris  
  - avec un framework tensorfow !
- quid du traducteur ?
- MarianMT qui fournit des modèles légers et de qualité

# 2023_10_22

Conclusions

- vosk fr pour l'appli flutter de collaboration

- sherpa-onnx pour le modèle de reconnaissance vocale
    - pytorch -> onnx
    - onnx in android ok
    - android - > flutter ok 

- quid du traducteur ?

## concernant la portabilité des modèles vers le mobile

- me semble plus viable de passer par ONNX et de lire ça dans SHERPA 

__Export a Model from PyTorch to ONNX__
https://pytorch.org/tutorials/advanced/super_resolution_with_onnxruntime.html
https://deci.ai/blog/how-to-convert-a-pytorch-model-to-onnx/

https://learn.microsoft.com/en-us/windows/ai/windows-ml/tutorials/pytorch-convert-model

-> plus de contrainte !

speechbrain à fond !
- pytorch est/__serait__ compatible sur android/iOS
  - https://pub.dev/packages/pytorch_mobile // images et custom ?
  - PyTorch Mobile Runtime for Android 
    - 2022 - https://youtu.be/Gzr_-jS0tlA?si=pVb0m-Az_ETsJUvR
    - 2020 - https://youtu.be/5Lxuu16_28o?si=Yy4iVGT-bCwOKiLf
  - https://pytorch.org/mobile

https://github.com/pytorch/android-demo-app/tree/master/SpeechRecognition


## concernant VOSK
- top pour du hors-ligne + Flutter mais beaucoup de boulot à la mano pour le modèle
- je suppose qu'un modèle sera bientôt dispo
- et sinon envisagerait d'en faire avec bcp de puissance de calcul, pas à l'ancienne
- j'ai récolté qqls ressources pour faire le modèle __à la kaldi__ et ça sera peut être repis


# 2023_10_21

- fr -> ff
	- fr -> fr text (vosk-flutter or ffline speech_to_text)
	- fr text -> ff text (our own tensorflow)
	- ff text to speech (our own speechbrain ou coqui)

- ff -> fr
	- ff -> ff text (our own speechbrain or mms or vosk for offline)
	- ff text > fr text (our own tensorflow)
	- french text to speech - (flutter_tts)