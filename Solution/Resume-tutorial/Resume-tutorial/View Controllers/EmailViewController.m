//
//  EmailViewController.m
//  Resume-tutorial
//
//  Created by Stephanie Szeto on 7/10/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "EmailViewController.h"
#import <sendgrid.h>

@interface EmailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *senderTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

- (IBAction)send:(id)sender;

@end

@implementation EmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutWithKeyboardEvent:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutWithKeyboardEvent:) name:UIKeyboardWillHideNotification object:nil  ];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.senderTextField.delegate = self;
}

- (void)viewWillLayoutSubviews {
    [self.senderTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

# pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.bodyTextView becomeFirstResponder];
    return NO;
}

# pragma mark - Private methods

- (void)layoutWithKeyboardEvent:(NSNotification *)notification {
    CGFloat animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardEndFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat newBottom = MIN(keyboardEndFrame.origin.y, self.view.frame.size.height);
    
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect bodyFrame = self.bodyTextView.frame;
        bodyFrame.size.height = newBottom - bodyFrame.origin.y;
        self.bodyTextView.frame = bodyFrame;
    }];
}

- (IBAction)send:(id)sender {
    sendgrid *message = [sendgrid user:@"stephanieszeto" andPass:@"sendgrid1"];
    
    message.to = @"stephaniexszeto@gmail.com";
    message.from = @"stephanie@liverail.com";
    message.subject = [NSString stringWithFormat:@"Message from: %@\n\n", self.senderTextField.text];
    message.text = self.bodyTextView.text;
    message.html = [NSString stringWithFormat:@"<html>%@</html>", self.bodyTextView.text];
    
    [message sendWithWeb];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
