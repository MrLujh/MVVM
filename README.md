# MVVM开发模式

### 项目中数据配置设置
* 为内置测试工具提供公开配置入口


 ![(icon)](https://github.com/MrLujh/BugKit/blob/master/resource/json.03.png)

```objc
{
    "host":[
            {
            "name":"当前环境",
            "type":"hostBaseTypeNow",
            "url":""
            },
            {
            "name":"测试环境",
            "type":"hostBaseTypeTest",
            "url":"https://119.120.88.640"
            },
            {
            "name":"生产环境",
            "type":"hostBaseTypeProduct",
            "url":"https://lujh.com"
            },
            {
            "name":"类环境",
            "type":"hostBaseTypeStaging",
            "url":""
            },
            {
            "name":"个人环境",
            "type":"hostBaseTypePersonal",
            "url":""
            }
            ],
    "pgyConfig":{
        "appKey":"332ada3b2e4c856c09acc9796cfc9099",
        "api_key":"1303c11160b475cc56b9d5df820a17ed",
        "openUrl":"https://www.pgyer.com/R1mF"
    }
}
```

* 蒲谷英历史版本查看URL配置参数如下

  ![(icon)](https://github.com/MrLujh/BugKit/blob/master/resource/json.01.png)

* 蒲谷英API 2.0文档说明链接如下:

    https://www.pgyer.com/doc/view/api#paramInfo
   
### 项目中如何使用
* 项目中数据配置设置按照上图配置，key value 对照
* 网络层的封装，新建一个类来处理基础IP的切换，方便给测试打包和APP上线在同一个版本中不同环境的切换
```objc
#import <Foundation/Foundation.h>

#define kEnvHostURLChangeNotificationName @"kEnvHostURLChangeNotificationName"

@interface LujhBaseUrlManager : NSObject<NSCoding>

+(instancetype)sharedInstance;
/** 基础IP */
@property (nonatomic,copy) NSString *hostBaseURL;
@end
```
```objc
#import "LujhBaseUrlManager.h"
#import "LujhNetWorkManager.h"

// 宏设置默认环境Host..
#if (DEVELOP==1)
// Debug
#define DEFAULT_URL_HOST @"https://119.120.88.640"

#else
// Release
#define DEFAULT_URL_HOST @"https://lujh.com"

#endif
@implementation LujhBaseUrlManager
+(instancetype)sharedInstance{
    
    static  LujhBaseUrlManager *baseUrlManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseUrlManager = [LujhBaseUrlManager getCurrentEnvObjFormUserDefault];
    });
    return baseUrlManager;
}

+ (instancetype)getCurrentEnvObjFormUserDefault {
    
    LujhBaseUrlManager *envDefault = [[LujhBaseUrlManager alloc] init];
    NSString*resourcePath =[[NSBundle mainBundle] pathForResource:@"config.json" ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:resourcePath];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *arr = [json objectForKey:@"host"];
    NSMutableArray *muArr = arr.mutableCopy;
    NSMutableDictionary *dic = ((NSDictionary *)muArr[0]).mutableCopy;
    [dic setObject:DEFAULT_URL_HOST forKey:@"url"];
    muArr[0] = dic;
    
    
    NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithDictionary:json];
    [dataDictionary setObject:muArr forKey:@"host"];
    
    NSData *jdata = [NSJSONSerialization dataWithJSONObject:dataDictionary options:NSJSONReadingAllowFragments error:nil];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"config.json"];
    [jdata writeToFile:filePath atomically:YES];
    return envDefault;
    
}

- (NSString *)hostBaseURL {
    NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"config.json"];
    NSData *jdata = [[NSData alloc] initWithContentsOfFile:filePatch];
    id json = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:nil];
    NSArray *arr = [json objectForKey:@"host"];
    return arr[0][@"url"];
}

@end
```
* 更重要的一步是项目中TARGETS 要copy一个新的targets，其作用是copy的那个是用来打包上架App Store，另外一个开放给测试打包，如下图：

 ![(icon)](https://github.com/MrLujh/BugKit/blob/master/resource/network_01.png)

* build settings中预编译宏设置，区分开放版还是上线版本接口切换，如下图:

 ![(icon)](https://github.com/MrLujh/BugKit/blob/master/resource/network_02.png)

 ![(icon)](https://github.com/MrLujh/BugKit/blob/master/resource/network_03.png)

* 导入bugkit之后 库的头文件不需要引入，在APPdelegate

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {}方法中调入

-(void)initShakeWindow
{
    Class class = NSClassFromString(@"BugKitShakeWindow");
    self.window = [[class alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}
```

![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)

