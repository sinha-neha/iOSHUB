//
//  SignInViewController.m
//  InstragramSample
//
//  Created by Neha Sinha on 29/01/14.
//  Copyright (c) 2014 Mindfire Solutions. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

#pragma mark -- ViewController life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_webView sizeToFit];
    _webView.scrollView.scrollEnabled = NO;
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPressed)];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	self.title = @"Instagram Login";
    
    NSString* urlString = [kBaseURL stringByAppendingFormat:kAuthenticationURL,kClientID,kRedirectURI];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	if (![UIUtils checkNetworkConnection])
		return;
	
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
	_ReleaseObject(_webView);
    [super dealloc];
}

- (void) backBtnPressed
{
    [_gAppDelegate showLoadingView:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- WebView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* urlString = [[request URL] absoluteString];
    NSURL *Url = [request URL];
    NSArray *UrlParts = [Url pathComponents];
    
    // runs a loop till the user logs in with Instagram and after login yields a token for that Instagram user
    // do any of the following here
    if ([UrlParts count] == 1)
    {
        NSRange tokenParam = [urlString rangeOfString: kAccessToken];
        if (tokenParam.location != NSNotFound)
        {
            NSString* token = [urlString substringFromIndex: NSMaxRange(tokenParam)];
            // If there are more args, don't include them in the token:
            NSRange endRange = [token rangeOfString: @"&"];
            
            if (endRange.location != NSNotFound)
                token = [token substringToIndex: endRange.location];
            
            if ([token length] > 0 )
            {
                // call the method to fetch the user's Instagram info using access token
                [_gAppData getUserInstagramWithAccessToken:token];
            }
        }
        else
        {
            DLog(@"rejected case, user denied request");
        }
        return NO;
    }
    return YES;
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
	[_gAppDelegate showLoadingView:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_gAppDelegate showLoadingView:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   // DLog(@"Code : %d \nError : %@",error.code, error.description);
    //Error : Error Domain=WebKitErrorDomain Code=102 "Frame load interrupted"
    if (error.code == 102)
        return;
    if (error.code == -1009 || error.code == -1005)
    {
        //        _completion(kNetworkFail,kPleaseCheckYourInternetConnection);
    }
    else
	{
        //        _completion(kError,error.description);
	}
    [UIUtils networkFailureMessage];
}

@end
