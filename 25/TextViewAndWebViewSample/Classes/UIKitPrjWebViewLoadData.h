//
//  UIKitPrjWebViewLoadData.h


#import <UIKit/UIKit.h>

@interface UIKitPrjWebViewLoadData : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}
@end
