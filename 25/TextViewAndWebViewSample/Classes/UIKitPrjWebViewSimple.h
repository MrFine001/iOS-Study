//
//  UIKitPrjWebViewSimple.h


#import <UIKit/UIKit.h>

@interface UIKitPrjWebViewSimple : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}
@end
