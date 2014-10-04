//
//  ViewController.h
//  WebViewHighlight
//
//  Created by Zaldy Bernabe Bughaw on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIWebView *webView;
- (IBAction)removeAllHighlights;
- (IBAction)markHighlightedString:(id)sender;
- (IBAction)getHighlightedString:(id)sender;
@end
