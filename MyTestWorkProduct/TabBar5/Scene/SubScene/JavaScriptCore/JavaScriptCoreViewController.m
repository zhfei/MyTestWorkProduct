//
//  JavaScriptCoreViewController.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/16.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "JavaScriptCoreViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>
#import "JSProtolObj.h"

@interface JavaScriptCoreViewController ()<UIWebViewDelegate,WKScriptMessageHandler,WKScriptMessageHandler>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) JSContext *jsContent;
@property (strong, nonatomic) JSProtolObj *jsProtolObj;
@end

@implementation JavaScriptCoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    
    [self OC_Call_JS];
    
    [self JS_Call_OC];
}

- (void)creatWKWebView {
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences.minimumFontSize = 10.f;
    [config.userContentController addScriptMessageHandler:self name:@"playSound"];

    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    
    
    
    [webView evaluateJavaScript:@"playSount()" completionHandler:nil];

}

- (void)OC_Call_JS {

    self.jsContent = [[JSContext alloc] init];
    
    NSString *js = @"function add(a,b) {return a + b}";
    [self.jsContent evaluateScript:js];
    JSValue *jsValue = [self.jsContent[@"add"] callWithArguments:@[@2,@3]];
    
    NSLog(@"%d",jsValue.toInt32);
}

- (void)JS_Call_OC {

    self.jsContent = [[JSContext alloc] init];
    self.jsContent[@"add"] = ^(int a, int b){
        NSLog(@"a+b = %d",a+b);
    };
    
    [self.jsContent evaluateScript:@"add(10,20)"];
}

- (void)JSProtol_Method{

    self.jsContent = [[JSContext alloc] init];
    
    self.jsContent.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        [JSContext currentContext].exception = exception;
        NSLog(@"exception:%@",exception);
    };
    
    self.jsContent[@"OCobj"] = self.jsProtolObj;
    [self.jsContent evaluateScript:@"OCobj.sum = OCobj.add(10,20)"];
}



#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlString = webView.request.URL.absoluteString;
    NSString *schem = webView.request.URL.scheme;
    if ([schem containsString:@"jsCallBack://"]) {
        //action...
        return NO;
    }

    NSLog(@"webView:%@",webView);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {

    NSLog(@"webView:%@",webView);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *htmlString = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSString *textString = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];
    
    NSLog(@"webView:%@",webView);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {

    if ([message.name isEqualToString:@"playSound"]) {
        [self playSound];
    }
}

- (void)playSound {

    NSLog(@"playSound");
}



@end
