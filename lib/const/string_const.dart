///
/// Created by NieBin on 18-12-14
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
///

class StringConst {
  //strings
  static const String APP_NAME = "ibaozi";
  static const String CREATE_BY = "Created By Volunteer";
  static const String DEVELOPER = "Volunteer";
  static const String PROFESSION = "Flutter Developer";
  static const String DEV_EMAIL = "niebin312@gmail.com";
  static const String SIGN_UP = "注册";
  static const String SIGN_UP_TEXT = "没有账号?";

  static const String Blog_01 = '# 看Android的发展历程-谈一下当下最合适的架构\n'+
          '[两年后我对Android架构的思考](https://www.jianshu.com/p/a6d078042f7c) \n' +
          '## 接着上面的讲 \n' +
          '上次我们讲到一个好的架构有哪些优点，当然好的架构肯定还有其他方面的优势，我只是表达了自己的一些观点，有问题欢迎反驳，我们一起讨论。下面我们来看看当前版本的Android架构，如何做到最合适，也不一定是最合适，但大方向肯定要正确。我们先看看架构的历程。\n' +
          '## Android架构演进 \n' +
          '#### MVC > MVP > MVVM \n' +
          '我们先回顾一下google为我们做了什么，一开始我们接触android，大家都在用MVC，甚至可以说没有架构，而且那个时候app是真的简单，但随着不断的迭代，问题越来越多，google也发现了这个问题，于是github开源了MVP架构的示例，教我们如何整合框架，如何在架构设计上保证业务的发展需求，再到现在主推的MVVM，其实不难发现一个共性，WEB端大家都知道吧，你看现在最火的React、Vue，不都是MVVM的架构吗（有人说不是，有人说是，这里不多解释，我们不应该纠结是不是，应该理解M-V 、 V-M 是数据绑定UI，无非是单向还是双向的，都属于一种理念吧，理解就行。）\n' +
          '#### 原生 > React Native > Flutter \n' +
          '一个好的架构只是MVC到MVVM吗？我不这么认为，从一开始我们接触到原生的Android开发，到后来大火的React Native，我们16年还专门集成了React Native模块，但做了几个迭代后放弃了，我们发现为了适配Android、Ios 也花费了很多时间，倒不如用原生做的好用。目前最火的Flutter，也是Google主推的跨平台框架，而且我们现在就在C端项目中集成了，效果还不错，虽然也是有很多问题，但总体来看比React Native 要好，还有一点Google内部正在开发的另一个操作系统Fuchsia的UI layer采用的是Flutter，也就是说Flutter天然可以支持Android、IOS以及未来的Fuchsia。在大前端方向，对于跨平台开发中一直在不断迭代中寻找更好、更优的解决方案，目前来看Flutter还是更有优势 \n' +
          '#### Java > Kotlin，Dart \n' +
          "来说说语言，你说语言属于架构吗？我也不知道，但这是我架构的时候考虑的一个方向，语言是我们组织架构最基础的单元，kotlin的普及，应该不仅仅是google认为语言不错，让我们广大开发者使用，其实这里面涉及了很多东西，我们知道最新的android引用的是open jdk，前几年的官司打个不停，付出了不少人力财力，这肯定不是我们还要考虑的，但有一点可以肯定，kotlin语言确实是个趋势，因为他有更合理的设计，更安全的性能表现，更加简洁的代码，当然你可以用java写android写到老，我也不认为你用kotlin写就一定比java写的好，看个人选择吧。再说说Dart，这个我就有点不理解，为啥Flutter一定要用Dart写，好像Google工程师这么回答：说Dart就在隔壁啊，好沟通。哈哈。\n";
}
