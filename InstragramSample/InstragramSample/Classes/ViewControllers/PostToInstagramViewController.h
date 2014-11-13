//
//  PostToInstagramViewController.h
//  InstragramSample
//
//  Created by Neha Sinha on 29/01/14.
//  Copyright (c) 2014 Mindfire Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostToInstagramViewController : UIViewController <UIDocumentInteractionControllerDelegate>
{
    IBOutlet UIImageView*   _imageView;
    
}

@property(nonatomic,retain)UIDocumentInteractionController *docFile;

@end
