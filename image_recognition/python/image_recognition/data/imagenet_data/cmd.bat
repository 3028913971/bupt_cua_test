@echo off
python E:\python3\python35\Lib\site-packages\tensorflow\models\image\imagenet\classify_image.py --model_dir %~dp0
pause
exit
