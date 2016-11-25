//
//  UIKitPrjWebView.h


#import <UIKit/UIKit.h>

@interface UIKitPrjWebView : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIBarButtonItem* reloadButton_;
  UIBarButtonItem* stopButton_;
  UIBarButtonItem* backButton_;
  UIBarButtonItem* forwardButton_;
}
@end
