一.UIPickerView
1.UIPickerView的常见属性
// 数据源(用来告诉UIPickerView有多少列多少行)
@property(nonatomic,assign) id<UIPickerViewDataSource> dataSource;
// 代理(用来告诉UIPickerView每1列的每1行显示什么内容,监听UIPickerView的选择)
@property(nonatomic,assign) id<UIPickerViewDelegate>   delegate;
// 是否要显示选中的指示器
@property(nonatomic)        BOOL                       showsSelectionIndicator;
// 一共有多少列
@property(nonatomic,readonly) NSInteger numberOfComponents;

2.UIPickerView的常见方法
// 重新刷新所有列
- (void)reloadAllComponents;
// 重新刷新第component列
- (void)reloadComponent:(NSInteger)component;

// 主动选中第component列的第row行
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;

// 获得第component列的当前选中的行号
- (NSInteger)selectedRowInComponent:(NSInteger)component;

3.数据源方法(UIPickerViewDataSource)
//  一共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
//  第component列一共有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

4.代理方法(UIPickerViewDelegate)
//  第component列的宽度是多少
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
//  第component列的行高是多少
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;

//  第component列第row行显示什么文字
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

//  第component列第row行显示怎样的view(内容)
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;

//  选中了pickerView的第component列第row行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

二.UIDatePicker
1.常见属性
// datePicker的显示模式
@property (nonatomic) UIDatePickerMode datePickerMode;
// 显示的区域语言
@property (nonatomic, retain) NSLocale   *locale;

2.监听UIDatePicker的选择
* 因为UIDatePicker继承自UIControl,所以通过addTarget:...监听

三.程序启动的完整过程
1.main函数

2.UIApplicationMain
* 创建UIApplication对象
* 创建UIApplication的delegate对象

3.delegate对象开始处理(监听)系统事件(没有storyboard)
* 程序启动完毕的时候, 就会调用代理的application:didFinishLaunchingWithOptions:方法
* 在application:didFinishLaunchingWithOptions:中创建UIWindow
* 创建和设置UIWindow的rootViewController
* 显示窗口

3.根据Info.plist获得最主要storyboard的文件名,加载最主要的storyboard(有storyboard)
* 创建UIWindow
* 创建和设置UIWindow的rootViewController
* 显示窗口