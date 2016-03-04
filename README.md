# international-language-localsetting
国际化语言 本地设置

How to setting international language in iOS9

- create an new file :
iOS -> Resource ->Strings File
Named by InternationalLanguage.strings (or you can use other name)
- with the same way to create InfoPlist.String (you can’t use another name)
- the first file for setting app’s international context, the second is for setting app’s international name; Then click ‘+’ in PROJECT -> Info -> Localization, we will see more branches in two .strings files;
- in file InternationalLanguage.strings the format is :
“text’s mark” = “the real text you want to use”
for example :
in InternationalLanguage.strings(english) file:
“hello world” = “hello world”;
in InternationalLanguage.strings(Simplified) file:
“hello world” = “你好, 世界”;
Then:
in English system with code:
NSLog( NSLocalizedString(<#key#>, <#comment#>));//key@“hello world”,comment fill nil
- you will print "hello world”
in Chinese system will print "你好, 世界"
- I am already code a class that can using English file in Chinese system environment.
for the better way to setting language is using my function:
[InternationalControl string:@"hello world”];
- in stead of : NSLocalizedString(@“hello world", nil);
- before setting language, you should init a local language by call  [InternationalControl initInternationalLanguage]; in appDelegate;


如何设置国际化多语言 iOS 9

1.创建新文件iOS -> Resource ->Strings File
命名为 InternationalLanguage.strings(可以自己取)
2.再用相同方法创建InfoPlist.strings(名字固定)
第一个文件是我们设置app内容的语言需要的文件
第二个文件是我们设置app名称的语言需要的文件

然后在PROJECT -> Info -> Localizations 中点+号添加所需要的国际语言
这个时候在2个strings文件中会对应的多了相应的语言的文件

InternationalLanguage.strings中的格式是:
“文字获取的符号” = “你真正想显示的文字内容”;
比如在InternationalLanguage.strings(english)中
“hello world” = “hello world”;
在InternationalLanguage.strings(Simplified)中
“hello world” = “你好, 世界”;
那么在英文系统环境下
NSLog( NSLocalizedString(<#key#>, <#comment#>));//key@“hello world”,comment填nil
会打印 hello world
中文环境下则是 你好, 世界

我这里封装了一个类, 可以让大家在中文系统环境下也显示英文内容
实现了语言设置的功能
所以更好的方法 是用我的库中的获取String的方法
[InternationalControl string:@"hello world”];
来取代NSLocalizedString(@“hello world", nil);

在设置国际化语言之前, 请现在appDelegate中初始化语言,通过 [InternationalControl initInternationalLanguage];方法