//
//  WebBrowserViewController.m
//  MSSNGR
//
//  Created by Lars Kuhnt on 29.01.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "WebBrowserViewController.h"
#import "NSString+Extensions.h"

@interface WebBrowserViewController ()

@end

@implementation WebBrowserViewController

@synthesize urlString;

+ (id)webViewControllerWithURLString:(NSString *)urlString {
  return [[WebBrowserViewController alloc] initWebViewControllerWithURLString:urlString];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (id)initWebViewControllerWithURLString:(NSString *)_urlString {
  if (self = [super init]) {
    if ([_urlString hasPrefix:@"http://"] || [_urlString hasPrefix:@"https://"]) {
      self.urlString = _urlString;
    } else {
      self.urlString = [NSString stringWithFormat:@"http://%@", _urlString];
    }
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  webView.delegate = self;
  navigationBar.topItem.title = self.urlString;
  if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending) {
    UIColor * tintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    navigationBar.tintColor = tintColor;
    toolbar.tintColor = tintColor;
  }
  NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
  [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
  return UIStatusBarStyleLightContent;
}

- (IBAction)closeButtonClicked:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionButtonClicked:(id)sender {
  [[UIApplication sharedApplication] openURL:webView.request.URL];
}

- (IBAction)backButtonClicked:(id)sender {
  if ([webView canGoBack])
    [webView goBack];
}

- (IBAction)forwardButtonClicked:(id)sender {
  if ([webView canGoForward])
    [webView goForward];
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)_webView {
  NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
  navigationBar.topItem.title = [NSString isBlank:title] ? webView.request.URL.absoluteString : title;
  backButton.enabled = [webView canGoBack];
  forwardButton.enabled = [webView canGoForward];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  return YES;
}



@end
