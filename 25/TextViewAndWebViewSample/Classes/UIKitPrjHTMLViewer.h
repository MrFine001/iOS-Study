//
//  UIKitPrjHTMLViewer.h


#import <UIKit/UIKit.h>

@interface UIKitPrjHTMLViewer : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}

@end
