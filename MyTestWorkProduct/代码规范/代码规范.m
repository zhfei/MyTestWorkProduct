iOS 代码规范

四类：

一、命名规范
1.统一要求：
2.类名：
3.私有变量：
4.property变量：
5.宏：
6.常量：
7.Enum
8.Delegate：
9.方法

二、代码注释规范
1.import注释：
2.属性注释：
3.方法声明注释：
4、代码块注释
5、TODO


三、代码格式化规范
1.指针*位置
2、方法的声明和定义
3、代码缩进
4、对method进行分组
5、大括号写法
6.property变量


四、编码规范
1、if语句
2、for语句
3、Switch语句
4、函数


controller内布局结构
#pragma mark - Life Cycle

#pragma mark - Getter, Setter

#pragma mark - Event

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - NSCopying

#pragma mark - NSObject

swift:controller内布局结构
// MARK: - lift
// TODO: - todo
// FIXME: - 小bug

// MARK: - Life Cycle

// MARK: - Event

// MARK: - Getter, Setter

// MARK: - Public Method

// MARK: - Private Method

// MARK: - Delegate

// MARK: - NSCopying

// MARK: - NSObject

// MARK: - Extension



项目结构

模块
controller
view
model
Common 公用函数, 基类, Utility(通用的设备)
Tools 具体工具集合
Widgets 公用控件, 分类
external 第三方库
Resource 资源, 配置文件等


helper：
DataHandleHelper //数据处理helper




一、命名规范
1.统一要求：名称尽量不需要注释也能看懂其作用，如做不到就加注释。名词用全称，不要简称。

2.类名：大驼峰式命名：每个单词的首字母都大写
例：== MFHomePageViewController

3.私有变量：在.m 文件中声明, 以 _ 开头，第一个单词首字母小写，后面的单词的首字母全部大写。
例：== NSString  *_somePrivateVariable

4.property变量：小驼峰式命名：每个单词的首字母都大写
属性的关键字推荐按照 原子性，读写，内存管理的顺序排列。
Block、NSString 属性应该使用copy 关键字
禁止使用synthesize 关键词
例：==
typedef void (^ErrorCodeBlock) (id errorCode,NSString *message);
@property (nonatomic, readwrite, strong) UIView *headerView;    //注释
@property (nonatomic, readwrite, copy) ErrorCodeBlock errorBlock;   //将block
拷贝到堆中
@property (nonatomic, readwrite, copy) NSString *userName;

5.宏：
对于宏定义的常量#define
预处理定义的常量全部大写，单词间用 _ 分隔
宏定义中如果包含表达式或变量，表达式或变量必须用小括号括起来。
例：==
//宏定义的常量
#define ANIMATION_DURATION    0.3
#define MY_MIN(A, B)  ((A)>(B)?(B):(A))

6.常量：
对于类型常量，对于局限于某编译单元(实现文件)的常量，以字符k开头，
例如kAnimationDuration，且需要以static const 修饰

对于定义于类头文件的常量，外部可见，则以定义该常量所在类的类名开头，
例如EOCViewClassAnimationDuration, 仿照苹果风格，在头文件中进行extern
声明，在实现文件中定义其值
例：==
//局部类型常量
static const NSTimeInterval kAnimationDuration = 0.3;
 
//外部可见类型常量
//EOCViewClass.h
extern const NSTimeInterval EOCViewClassAnimationDuration;
extern NSString *const EOCViewClassStringConstant;  //字符串类型
 
//EOCViewClass.m
const NSTimeInterval EOCViewClassAnimationDuration = 0.3;
NSString *const EOCViewClassStringConstant = @"EOCStringConstant";

7.Enum
Enum类型的命名与类的命名规则一致
Enum中枚举内容的命名需要以该Enum类型名称开头
NS_ENUM 定义通用枚举，NS_OPTIONS 定义位移枚举
例：==
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
};
 
typedef NS_OPTIONS(NSUInteger, UIControlState) {
    UIControlStateNormal       = 0,
    UIControlStateHighlighted  = 1,
}

8.Delegate：
用delegate 做后缀，如
用optional 修饰可以不实现的方法，
用required 修饰必须实现的方法
当你的委托的方法过多, 可以拆分数据部分和其他逻辑部分, 数据部分用dataSource做后缀. 如
使用did和will通知Delegate已经发生的变化或将要发生的变化。
类的实例必须为回调方法的参数之一
回调方法的参数只有类自己的情况，方法名要符合实际含义
回调方法存在两个以上参数的情况，以类的名字开头，以表明此方法是属于哪个类的
例：==
@protocol UITableViewDataSource
@required
//回调方法存在两个以上参数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
@optional
//回调方法的参数只有类自己
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented

@protocol UITableViewDelegate
@optional
//使用`did`和`will`通知`Delegate`
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

9.方法
方法名用小驼峰式命名
方法名不要使用new作为前缀
不要使用and来连接属性参数，
如果方法描述两种独立的行为，使用and来串接它们。

方法实现时，如果参数过长，则令每个参数占用一行，以冒号对齐。
一般方法不使用前缀命名，私有方法可以使用统一的前缀来分组和辨识
方法名要与对应的参数名保持高度一致
表示对象行为的方法、执行性的方法应该以动词开头
返回性的方法应该以返回的内容开头，但之前不要加get，除非是间接返回一个或多个值。
可以使用情态动词(动词前面can、should、will等)进一步说明属性意思，但不要使用do或does
,因为这些助动词没什么实际意义。也不要在动词前使用副词或形容词修饰
例：==
//不要使用 and 来连接属性参数
- (int)runModalForDirectory:(NSString *)path file:(NSString *)name types:(NSArray *)fileTypes;    //推荐
- (int)runModalForDirectory:(NSString *)path andFile:(NSString *)name andTypes:(NSArray *)fileTypes;    //反对
 
//表示对象行为的方法、执行性的方法
- (void)insertModel:(id)model atIndex:(NSUInteger)atIndex;
- (void)selectTabViewItem:(NSTableViewItem *)tableViewItem
 
//返回性的方法
- (instancetype)arrayWithArray:(NSArray *)array;
 
//参数过长的情况
- (void)longMethodWith:(NSString *)theFoo
                  rect:(CGRect)theRect
              interval:(CGFloat)theInterval
{
   //Implementation
}
 
//不要加get
- (NSSize) cellSize;  //推荐
- (NSSize) getCellSize;  //反对
 
//使用情态动词,不要使用do或does
- (BOOL)canHide;  //推荐
- (BOOL)shouldCloseDocument;  //推荐
- (BOOL)doesAcceptGlyphInfo;  //反对


二、代码注释规范

优秀的代码大部分是可以自描述的，我们完全可以用代码本身来表达它到底在干什么，而不需要注释的辅助。
但并不是说一定不能写注释，有以下三种情况比较适合写注释：
公共接口（注释要告诉阅读代码的人，当前类能实现什么功能）。
涉及到比较深层专业知识的代码（注释要体现出实现原理和思想）。
容易产生歧义的代码（但是严格来说，容易让人产生歧义的代码是不允许存在的）。

除了上述这三种情况，如果别人只能依靠注释才能读懂你的代码的时候，就要反思代码出现了什么问题。
最后，对于注释的内容，相对于“做了什么”
，更应该说明“为什么这么做”

1.import注释：
如果有一个以上的import语句，就对这些语句进行分组，每个分组的注释是可选的。
例：==
// Frameworks
#import ;
 
// Models
#import "NYTUser.h"
 
// Views
#import "NYTButton.h"
#import "NYTUserView.h"

2.属性注释：
写在属性之后，用两个空格隔开
例：==
@property (nonatomic, readwrite, strong) UIView *headerView;  //注释

3.方法声明注释：
一个函数(方法)必须有一个字符串文档来解释，除非它：非公开、私有函数、很短、显而易见。

而其余的，包括公开接口，重要的方法，分类，以及协议，都应该伴随文档（注释）：
以/开始
第二行是总结性的语句
第三行永远是空行
在与第二行开头对齐的位置写剩下的注释。

建议这样写：
/This comment serves to demonstrate the format of a doc string.
 
Note that the summary line is always at most one line long, and after the opening block comment,
and each line of text is preceded by a single space.
*/

方法的注释使用Xcode
自带注释快捷键:Commond+option+/
例：==
/**
 
 
 @param tableView 
 @param section 
 <a href='http://www.jobbole.com/members/wx1409399284'>@return</a> 
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //...
}

4、代码块注释
单行的用//+空格开头，
多行的采用/* */注释

5、TODO
使用//TODO:说明
标记一些未完成的或完成的不尽如人意的地方
例：==
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //TODO:增加初始化
    return YES;
}

三、代码格式化规范
1.指针*位置
定义一个对象时，指针*靠近变量
例:== 
NSString *userName;

2、方法的声明和定义
在 - 、+ 和 返回值之间留一个空格，方法名和第一个参数之间不留空格
例：==
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index;

3、代码缩进
不要在工程里使用 Tab 键，使用空格来进行缩进。在 Xcode > Preferences > Text Editing 将 Tab 和自动缩进都设置为 4 个空格
Method与Method之间空一行
一元运算符与变量之间没有空格、二元运算符与变量之间必须有空格
例：==
!bValue
fLength = fWidth * 2;
 
- (void)sampleMethod1;
 
- (void)sampleMethod2;

4、对method进行分组 
使用#pragma mark - 对method 进行分组
例：==

pragma mark - Life Cycle Methods
- (instancetype)init
- (void)dealloc
 
- (void)viewWillAppear:(BOOL)animated
- (void)viewDidAppear:(BOOL)animated
- (void)viewWillDisappear:(BOOL)animated
- (void)viewDidDisappear:(BOOL)animated
 
#pragma mark - Override Methods
 
#pragma mark - Intial Methods
 
#pragma mark - Network Methods
 
#pragma mark - Target Methods
 
#pragma mark - Public Methods
 
#pragma mark - Private Methods
 
#pragma mark - UITableViewDataSource  
#pragma mark - UITableViewDelegate  
 
#pragma mark - Lazy Loads
 
#pragma mark - NSCopying  
 
#pragma mark - NSObject  Methods

5、大括号写法
对于类的method:
左括号另起一行写(遵循苹果官方文档)
对于其他使用场景(if,for,while,switch等)
: 左括号跟在第一行后边
例：==
- (void)sampleMethod
{
    BOOL someCondition = YES;
    if(someCondition) {
        // do something here
    }
}

6.property变量
例：==
@property (nonatomic, readwrite, strong) UIView *headerView;    //注释

四、编码规范
1、if语句
①、须列出所有分支（穷举所有的情况），而且每个分支都须给出明确的结果。
②、不要使用过多的分支，要善于使用return来提前返回错误的情况，把最正确的情况放到最后返回。
例==：
推荐这样写：==
if (!user.UserName) return NO;
if (!user.Password) return NO;
if (!user.Email) return NO;
 
return YES;

不推荐这样写：==
BOOL isValid = NO;
if (user.UserName)
{
    if (user.Password)
    {
        if (user.Email) isValid = YES;
    }
}
return isValid;

③、条件过多，过长的时候应该换行。条件表达式如果很长，则需要将他们提取出来赋给一个BOOL值，或者抽取出一个方法
推荐这样写：==
if (condition1 && 
    condition2 && 
    condition3 && 
    condition4) {
  // Do something
}
BOOL finalCondition = condition1 && condition2 && condition3 && condition4
if (finalCondition) {
  // Do something
}

不推荐这样写：==
if (condition1 && condition2 && condition3 && condition4) {
  // Do something
}

④、条件语句的判断应该是变量在右，常量在左。
==推荐：==
if (6 == count) {
}
 
if (nil == object) {
}
 
if (!object) {
}

不推荐：==
if (count == 6) {
}
 
if (object == nil) {
}

if (object == nil)

⑤、每个分支的实现代码都须被大括号包围

if (!error) {
  return success;
}
也可以这样写：
if (!error) return success;

不推荐：==
if (!error)
    return success;

2、for语句
①、不可在for循环内修改循环变量，防止for循环失去控制。
②、避免使用continue和break。
如果出现了break，continue，只需要把continue的条件取反即可

3、Switch语句
①、每个分支都必须用大括号括起来
推荐这样写：
switch (integer) {  
  case 1:  {
    // ...  
   }
    break;  
  case 2: {  
    // ...  
    break;  
  }  
  default:{
    // ...  
    break; 
  }
}
②、使用枚举类型时，不能有default
分支， 除了使用枚举类型以外，都必须有default
分支
RWTLeftMenuTopItemType menuType = RWTLeftMenuTopItemMain;  
switch (menuType) {  
  case RWTLeftMenuTopItemMain: {
    // ...  
    break; 
   }
  case RWTLeftMenuTopItemShows: {
    // ...  
    break; 
  }
  case RWTLeftMenuTopItemSchedule: {
    // ...  
    break; 
  }
}

在Switch
语句使用枚举类型的时候，如果使用了default
分支，在将来就无法通过编译器来检查新增的枚举类型了。


4、函数

①、一个函数只做一件事（单一原则）
每个函数的职责都应该划分的很明确（就像类一样）
推荐：==
dataConfiguration()
viewConfiguration()

不推荐：==
void dataConfiguration()
{   
   ...
   viewConfiguration()
}

②、对于有返回值的函数（方法），每一个分支都必须有返回值
推荐：==
int function()
{
    if(condition1){
        return count1
    }else if(condition2){
        return count2
    }else{
       return defaultCount
    } 
}
不推荐：==
int function()
{
    if(condition1){
        return count1
    }else if(condition2){
        return count2
    }
}

③、对输入参数的正确性和有效性进行检查，参数错误立即返回
推荐：==
void function(param1,param2)
{
      if(param1 is unavailable){
           return;
      }
 
      if(param2 is unavailable){
           return;
      }
 
     //Do some right thing
}

④、如果在不同的函数内部有相同的功能，应该把相同的功能抽取出来单独作为另一个函数

⑤、将函数内部比较复杂的逻辑提取出来作为单独的函数
一个函数内的不清晰（逻辑判断比较多，行数较多）的那片代码，往往可以被提取出去，构成一个新的函数，然后在原来的地方调用它这样你就可以使用有意义的函数名来代替注释，增加程序的可读性。

举一个发送邮件的例子：


openEmailSite();
login();
 
writeTitle(title);
writeContent(content);
writeReceiver(receiver);
addAttachment(attachment);
 
send();
中间的部分稍微长一些，我们可以将它们提取出来：

void writeEmail(title, content,receiver,attachment)
{
  writeTitle(title);
  writeContent(content);
  writeReceiver(receiver);
  addAttachment(attachment); 
}
然后再看一下原来的代码：

openEmailSite();
login();
writeEmail(title, content,receiver,attachment)
send();




















