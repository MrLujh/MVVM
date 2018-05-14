# MVVM 开发模式

# 浅谈MVVM

项目开发中，用的比较多的就是MVC，高级一点的就会用MVVM，因为后者开发比较灵活，界面便于维护。另外一种MVP，开发中的比较少，主流的就是MVC，MVVM。个人比较偏爱MVVM，在项目中用的比较多。

## 概述 [引用自iOS应用架构谈](http://www.cocoachina.com/ios/20150525/11919.html)

&emsp;&emsp;MVVM的出现主要是为了解决在开发过程中Controller越来越庞大的问题，变得难以维护，所以MVVM把数据加工的任务从Controller中解放了出来，使得Controller只需要专注于数据调配的工作，ViewModel则去负责数据加工并通过通知机制让View响应ViewModel的改变。

&emsp;&emsp;MVVM是基于胖Model的架构思路建立的，然后在胖Model中拆出两部分：Model和ViewModel。ViewModel本质上算是Model层（因为是胖Model里面分出来的一部分），所以View并不适合直接持有ViewModel，因为ViewModel有可能并不是只服务于特定的一个View，使用更加松散的绑定关系能够降低ViewModel和View之间的耦合度。

&emsp;&emsp;还有一个让人很容易忽略的问题，大部分国内外资料阐述MVVM的时候都是这样排布的：
```
View<->ViewModel <->Model
```
造成了MVVM不需要Controller的错觉，现在似乎发展成业界开始出现MVVM是不需要Controller的声音了。其实MVVM是一定需要Controller的参与的，虽然MVVM在一定程度上弱化了Controller的存在感，并且给Controller做了减负瘦身（这也是MVVM的主要目的）。但是，这并不代表MVVM中不需要Controller，MMVC和MVVM他们之间的关系应该是这样：
```
View <-> C <-> ViewModel <->Model
```
所以使用MVVM之后，就不需要Controller的说法是不正确的。严格来说MVVM其实是MVCVM。从中可以得知，Controller夹在View和ViewModel之间做的其中一个主要事情就是将View和ViewModel进行绑定。在逻辑上，Controller知道应当展示哪个View，Controller也知道应当使用哪个ViewModel，然而View和ViewModel它们之间是互相不知道的，所以Controller就负责控制他们的绑定关系，所以叫Controller/控制器就是这个原因。

&emsp;&emsp;前面扯了那么多，其实归根结底就是一句话：在MVC的基础上，把C拆出一个ViewModel专门负责数据处理的事情，就是MVVM。然后，为了让View和ViewModel之间能够有比较松散的绑定关系，于是我们使用ReactiveCocoa，KVO，Notification，block，delegate和target-action都可以用来做数据通信，从而来实现绑定，但都不如ReactiveCocoa提供的RACSignal来的优雅，如果不用ReactiveCocoa，绑定关系可能就做不到那么松散那么好，但并不影响它还是MVVM。

##MVVM(View-ViewManger-C-ViewModel-Model)
![image](https://github.com/lovemo/MVVMFramework/raw/master/resources/MVVMFrameWork-Thinking.png)
- [View - 用来呈现用户界面](#1)
- [Controller - 负责ViewManger和ViewModel之间的绑定，负责控制器本身的生命周期。](#3)
- [ViewModel - 存放各种业务逻辑和网络请求](#4)

&emsp;&emsp;这种设计的目的是保持View和Model的高度纯洁，提高可扩展性和复用度。在日常开发中，ViewModel是为了拆分Controller业务逻辑而存在的，所以ViewModel需要提供公共的服务接口，以便为Controller提供数据。而ViewManger的作用相当于一个小管家，帮助Controller来分别管理每个subView，ViewManger负责接管来自View的事件，也负责接收来自Controller的模型数据，而View进行自己所负责的视图数据绑定工作。Controller则是最后的大家长，负责将ViewModel和ViewManger进行绑定，进行数据转发工作。把合适的数据模型分发给合适的视图管理者。

&emsp;&emsp;日常开发中，往往一个视图页面交由一个控制器进行管理，而一个页面上又有N个小的子页面，这就要求我们来对这些视图进行合适的分层处理，拆分视图，将这些视图进行封装，将复杂View抽象成独立的类，不必暴露出具体的实现细节。这样做的好处是，简化应用层的层级复杂度，同时也方便进行管理，视图结构就会变得很清晰。

&emsp;&emsp;这样的架构设计，就像一条生产线，ViewModel进行数据的采集和加工，Controller则进行数据的装配和转发工作从而进行负责View的展示工作和管理View的事件。这样，不管哪个环节，都是可以更换的，同时也提高了复用性。

##架构讲解


&emsp;&emsp;控制器中的代码结构如下图：

<img src="https://github.com/lovemo/MVVMFramework/raw/master/resources/img1.jpeg "height="460">


&emsp;&emsp;这样把各个部分区分开来，是不是感觉代码结构十分清晰了呢，当然可以根据个人习惯来进行修改，代码实现因人而异，但是思想确是互通的。把合适的业务逻辑交给最合适的对象去处理实现，只需要遵守这么一个基本原则就可以了。

&emsp;&emsp;至于是否采用更轻量级的ViewController做法，即 `通过将各个 protocol 的实现挪到 ViewController 之外，来为 ViewController 瘦身` ，众口不一。以UITableView为例，我的做法是：
- 如果只是在页面上进行简单的展示，并不设计负责的业务逻辑时，会将UITableViewDelegate与UITableViewDataSource单独放到一个Handler钟进行处理，抽象出tableHander，由MVVMTableDataDelegate进行负责管理；
- 当然，事实上，实际开发中，每个tableView页面都很复杂，有很多逻辑要处理，这时候只能考虑将protocol重新请回Controller中了，因为View层与ViewController层本身是持有与被持有的依赖关系，所以任何类作为ViewController的类内实例来实现协议回调，实际上都是在跨层调用，所以，随着时间和业务逻辑的愈来愈复杂，就注定要以额外的接口为代价，换言之，ViewController 的内聚性变差了。

&emsp;&emsp;总之，具体情况具体分析，采用最合适的方式来处理应对不同的问题。兵来将挡，水来土掩。本文的相关Demo见github，实现的功能并不复杂，仅供参考，欢迎补充。

####如果想学习更多关于MVVM的文章，请参考本项目demo中下方的推荐文章。
####如果想获取关于本项目的最新情况，请持续关注github。
####项目传送门：[点击进入](https://github.com/lovemo/MVVMFramework)
    
```

### <a id="demo效果"></a> demo效果
- 只需实现加载请求以及配置自定义cell和上述代码，就能轻松实现以下效果，最重要的是代码解耦。

![image](https://github.com/lovemo/MVVMFramework/raw/master/resources/demo.gif)

## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢

## 推荐(欢迎补充)<a id="Recommend"></a>
### 应用架构文章
##### 部分来自原创微信公众平台-移动开发前线
* [Service Oriented 的 iOS 应用架构](http://www.cocoachina.com/ios/20160520/16363.html)
* [新浪微博iOS客户端架构与优化之路](http://chuansong.me/n/335912751245)
* [糯米移动组件架构演进之路](http://top.caibaojian.com/t?url=http://t.cn/RqRDJIe)
* [文化碰撞：函数式、面向协议、面向对象编程的最佳实践](https://realm.io/cn/news/tryswift-daniel-steinberg-blending-cultures/)
* [探索 Swift 中的 MVC-N 模式](https://realm.io/cn/news/slug-marcus-zarra-exploring-mvcn-swift/)
* [Code-T 沙龙资料](https://github.com/Code-T/salon-resources)
* [高速公路换轮胎——为遗留系统替换数据库](http://www.jianshu.com/p/d684693f1d77)
* [围观神仙打架，反革命工程师《iOS应用架构谈 组件化方案》和蘑菇街Limboy的《蘑菇街 App 的组件化之路》的阅读指导](http://reviewcode.cn/article.html?reviewId=20)
* [iOS 组件化方案探索](http://blog.cnbang.net/tech/3080/)
* [iOS应用架构谈 组件化方案 ](http://casatwy.com/iOS-Modulization.html)
* [解耦神器 —— 统跳协议和Rewrite引擎](http://pingguohe.net/2015/11/24/Navigator-and-Rewrite.html)
* [携程移动App架构优化之旅 ](https://mp.weixin.qq.com/s?__biz=MzA3ODg4MDk0Ng==&mid=403009403&idx=1&sn=d19264fa1d06b9c5a9dfb1d192a0ed8e&scene=1&srcid=0401q08nZugjahvHG8rIXA3D&key=710a5d99946419d9421e8fbc5fb565c3a91aaaba22b5db9dffc9bcfae33aa18f533fbe82c6c570fec3720d82be5b9b5a&ascene=0&uin=MTMzODgyNTU%3D&devicetype=iMac+MacBookPro10%2C1+OSX+OSX+10.11+build%2815A282b%29&version=11000004&pass_ticket=IbzhLj2Kxa98XTnVDWywF6o6dyAlCik592Btwh3yT4A%3D)
* [蘑菇街App的组件化之路](#蘑菇街App的组件化之路)
	* [蘑菇街App的组件化之路(微信文章)](https://mp.weixin.qq.com/s?__biz=MzA3ODg4MDk0Ng==&mid=402696366&idx=1&sn=ba8cbd75849b9657175c4b25bb0ac5b5&scene=1&srcid=0401oAmP7sfKiXI2di3pJuOk&key=710a5d99946419d91e680351171de6fada2f6c71eaae2e235c5d4c37c97363d6a9d3cd45dd9ab9cdcccf2a0e701d01c5&ascene=0&uin=MTMzODgyNTU%3D&devicetype=iMac+MacBookPro10%2C1+OSX+OSX+10.11+build%2815A282b%29&version=11000004&pass_ticket=IbzhLj2Kxa98XTnVDWywF6o6dyAlCik592Btwh3yT4A%3D)
	* [蘑菇街App的组件化之路(博客文章)](http://limboy.me/ios/2016/03/10/mgj-components.html?utm_source=tuicool&utm_medium=referral)
* [蘑菇街 App 的组件化之路·续](http://limboy.me/ios/2016/03/14/mgj-components-continued.html)
* [猿题库 iOS 客户端架构设计](http://gracelancy.com/blog/2016/01/06/ape-ios-arch-design/)
* [豆瓣混合开发实践](http://lincode.github.io/Hybrid-Rexxar)
* [滴滴出行iOS客户端架构演进之路](http://chuansong.me/n/2687514)
* [不要写死！天猫App的动态化配置中心实践 ](http://chuansong.me/n/2682208)
* [为移动应用提供离线支持](http://www.infoq.com/cn/articles/mobile-apps-offline-support)
* [携程App的网络性能优化实践](http://www.infoq.com/cn/articles/how-ctrip-improves-app-networking-performance)
* [QCon旧金山演讲总结：阿里无线技术架构演进](http://www.infoq.com/cn/articles/alibaba-mobile-infrastructure)


### MVVM学习文章
* [MVVM奇葩说](http://www.cocoachina.com/ios/20160520/16004.html)
* [面向协议的 MVVM 架构介绍](https://realm.io/cn/news/doios-natasha-murashev-protocol-oriented-mvvm/)
* [MVVM With ReactiveCocoa](http://www.cocoachina.com/ios/20160330/15823.html)
* [#1 更轻量的 View Controllers](http://objccn.io/issue-1/)
* [ReactiveCocoa 和 MVVM 入门](http://yulingtianxia.com/blog/2015/05/21/ReactiveCocoa-and-MVVM-an-Introduction/)
* [MVVM 介绍](http://objccn.io/issue-13-1/)
* [写给iOS小白的MVVM教程(序)](http://www.ios122.com/2015/10/mvvm_start/)
* [多方位全面解析：如何正确地写好一个界面](http://ios.jobbole.com/83657/)
* [iOS应用架构谈 view层的组织和调用方案](http://www.cocoachina.com/ios/20150525/11919.html)
* [用Model-View-ViewModel构建iOS App](http://www.cocoachina.com/ios/20140716/9152.html)
* [浅谈iOS中MVVM的架构设计与团队协作](http://www.cocoachina.com/ios/20150122/10987.html)
* [一次简单的 ViewModel 实践](http://bifidy.net/index.php/407)
* [不要把ViewController变成处理tableView的"垃圾桶"](http://www.cocoachina.com/ios/20151218/14743.html)
* [实践干货！猿题库 iOS 客户端架构设计](http://www.cocoachina.com/ios/20160108/14911.html)
