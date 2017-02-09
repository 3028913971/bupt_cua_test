这是图像识别这一块的东西。

目前我用webservice实现了java调用python的图像识别脚本，
并且用tensorflow训练的模型进行了测试。（我只是测试一下webservice能不能正常工作，不要在意识别的准确度）
测试的结果当然是可以工作了~

##开发环境
#操作系统
Windows10

#Python
python用的是python3.5.3（大概python2.7也可以用吧，不清楚，不能用的话告诉我一下，我再改改），
IDE是JetBrains PyCharm Community Edition 2016.3.2。
python这边需要的库有：
spyne，lxml，suds，pytz，都是用于发布webservice的，其中pytz是spyne的依赖。这些都可以用pip或者easy-install安装。
由于我用的是tensorflow做的测试，所以你想运行图像识别的webservice（我把它叫做IRService）的话还需要安装tensorflow，具体怎么安装可翻墙参照：https://www.tensorflow.org/get_started/os_setup
如果你懒得安装tensorflow的话，就玩一玩里面那个HelloService好了。

#Java
java是java8，IDE是IntelliJ IDEA 2016.3.2（我试着导出为eclipse项目了，你可以看到熟悉的.classpath和.project文件，但是能不能用我就不知道了╮(╯_╰)╭），
java这边需要的库都在lib文件夹里，如果你们用eclipse打开出现什么库找不到了就到这里面添加吧。
java的代码绝大多数都是IDE自动生成的，要是什么代码风格看不习惯了不要怪我，懒得改了~
webservice相关的东西用的是Apache Axis。（没有用上课做实验的时候用的wsimport）
测试用的是JUnit，所以不要问我main方法在哪，没有main。用JUnit运行那些XXXTest里的东西就行了。（你要是不会用的话就自己写个main方法，把XXXTest里的代码copy出来）

##目录结构&文件内容
……（此处省略N个字）
（我相信你们都很棒你们看的懂这些文件都是干什么的！不用我说！）

By：高远
2017/02/09
