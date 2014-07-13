//
//  ViewController.m
//  Resume-tutorial
//
//  Created by Stephanie Szeto on 7/1/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews {
    CGRect descriptionFrame = self.descriptionTextView.frame;
    descriptionFrame.size = [self.descriptionTextView sizeThatFits:self.view.bounds.size];
    self.descriptionTextView.frame = descriptionFrame;
    
    CGSize scrollContentSize = self.view.frame.size;
    for (UIView *subview in self.scrollView.subviews) {
        CGFloat viewBottom = CGRectGetMaxY(subview.frame);
        if (viewBottom > scrollContentSize.height) {
            scrollContentSize.height = viewBottom;
        }
    }
    
    self.scrollView.contentSize = scrollContentSize;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
