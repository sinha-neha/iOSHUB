//
//  PostToInstagramViewController.m
//  InstragramSample
//
//  Created by Neha Sinha on 29/01/14.
//  Copyright (c) 2014 Mindfire Solutions. All rights reserved.
//

#import "PostToInstagramViewController.h"

@interface PostToInstagramViewController ()

@end

@implementation PostToInstagramViewController

#pragma mark -- View Controller life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Post Photo";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    _ReleaseObject(_imageView);
    [super dealloc];
}

#pragma mark -- action when Post To Instagram button is clicked

- (IBAction)postToInstagramClicked:(id)sender
{
    [self shareImageWithInstagram];
}

- (void) shareImageWithInstagram
{
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL])
    {
        NSData* imageData = UIImagePNGRepresentation(_imageView.image);
        NSString* imagePath = [UIUtils documentDirectoryWithSubpath:@"image.igo"];
        [imageData writeToFile:imagePath atomically:NO];
        NSURL* fileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"file://%@",imagePath]];
        
        self.docFile = [[self setupControllerWithURL:fileURL usingDelegate:self] retain];
        self.docFile.annotation = [NSDictionary dictionaryWithObject: @"This is a demo caption"
                                                              forKey:@"InstagramCaption"];
        self.docFile.UTI = @"com.instagram.photo";
        
        // OPEN THE HOOK
        [self.docFile presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
    }
    else
    {
        [UIUtils messageAlert:@"Instagram not installed in this device!\nTo share image please install instagram." title:nil delegate:nil];
    }
}

#pragma mark -- UIDocumentInteractionController delegate

- (UIDocumentInteractionController *) setupControllerWithURL:(NSURL*)fileURL
                                               usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate
{
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    
    return interactionController;
}

- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller
{
    
}

@end
