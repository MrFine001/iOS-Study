//
//  UIKitPrjLoadHTMLString.m


#import "UIKitPrjLoadHTMLString.h"

@implementation UIKitPrjLoadHTMLString

- (void)dealloc {
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"loadHTMLString";

  // UIWebView的设置
  webView_ = [[UIWebView alloc] init];
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.dataDetectorTypes = UIDataDetectorTypeAll;
  [self.view addSubview:webView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSString* html = @"<b>【电话号码】</b><br />"
                    "090-0000-0000<hr />"
                    "<b>【主页】</b><br />"
                    "http://www.apple.com/";
  [webView_ loadHTMLString:html baseURL:nil];
}

@end
