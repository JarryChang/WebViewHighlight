//
//  ViewController.m
//  WebViewHighlight
//
//  Created by Zaldy Bernabe Bughaw on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    UIWebView *_webView;
}

@synthesize webView = _webView;

- (IBAction)markHighlightedString:(id)sender {
    
    // The JS File   
    NSString *filePath  = [[NSBundle mainBundle] pathForResource:@"HighlightedString" ofType:@"js" inDirectory:@""];
    NSData *fileData    = [NSData dataWithContentsOfFile:filePath];
    NSString *jsString  = [[NSMutableString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
    
    // The JS Function
    NSString *startSearch   = [NSString stringWithFormat:@"stylizeHighlightedString()"];
    [_webView stringByEvaluatingJavaScriptFromString:startSearch];
    
}

- (IBAction)getHighlightedString:(id)sender {
    
    
    // The JS File   
    NSString *filePath  = [[NSBundle mainBundle] pathForResource:@"HighlightedString" ofType:@"js" inDirectory:@""];
    NSData *fileData    = [NSData dataWithContentsOfFile:filePath];
    NSString *jsString  = [[NSMutableString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
    
    // The JS Function
    NSString *startSearch   = [NSString stringWithFormat:@"getHighlightedString()"];
    [_webView stringByEvaluatingJavaScriptFromString:startSearch];
    
    NSString *selectedText   = [NSString stringWithFormat:@"selectedText"];
    NSString * highlightedString = [_webView stringByEvaluatingJavaScriptFromString:selectedText];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Highlighted String" 
                                                    message:highlightedString
                                                   delegate:nil 
                                          cancelButtonTitle:@"Oh Yeah" 
                                          otherButtonTitles:nil];
    [alert show];
    //[alert release]; // not required anymore because of ARC
}
/*
 Removes all highlighted string searched before
 */
- (IBAction)removeAllHighlights
{
    // calls the javascript function to remove html highlights
    [_webView stringByEvaluatingJavaScriptFromString:@"uiWebview_RemoveAllHighlights()"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load index.html to our webview
    NSString *urlAddress        = [[NSBundle mainBundle] pathForResource:@"index" 
                                                                  ofType:@"html"]; //you can also use PDF files
    NSURL *url                  = [NSURL fileURLWithPath:urlAddress];
    NSURLRequest *requestObj    = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
    
    // Menu Controller
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem *getHighlightString = [[UIMenuItem alloc] initWithTitle: @"Get String" action: @selector(getHighlightString:)];
    UIMenuItem *markHighlightedString = [[UIMenuItem alloc] initWithTitle: @"Mark String" action: @selector(markHighlightedString:)];
    [menuController setMenuItems: [NSArray arrayWithObjects:getHighlightString, markHighlightedString, nil]];

}

- (BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    
    if (action == @selector(getHighlightString:)) {
        return YES;
    } else if (action == @selector(markHighlightedString:)) {
        return YES;
    }
    
    return NO;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    _webView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
