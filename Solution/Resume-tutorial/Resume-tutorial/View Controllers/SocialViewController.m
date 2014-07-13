//
//  SocialViewController.m
//  Resume-tutorial
//
//  Created by Stephanie Szeto on 7/10/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "SocialViewController.h"
#import "WebViewController.h"
#import "SocialInfo.h"

@interface SocialViewController ()

@property (strong, nonatomic) NSArray *socialInfo;

@end

@implementation SocialViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.socialInfo = [SocialInfo allSocialInfo];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // email
    if (section == 0) {
        return 1;
    
    // social links
    } else {
        return self.socialInfo.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    // email
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MailCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"SocialInfoCell" forIndexPath:indexPath];
        SocialInfo *info = self.socialInfo[indexPath.row];
        cell.textLabel.text = info.title;
        cell.imageView.image = info.icon;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationVC = segue.destinationViewController;
    if ([destinationVC isKindOfClass:[WebViewController class]] &&
        [sender isKindOfClass:[UITableViewCell class]]) {
            
        UITableViewCell *sourceCell = (UITableViewCell *)sender;
        WebViewController *destination = (WebViewController *)destinationVC;
            
        NSInteger row = [self.tableView indexPathForCell:sourceCell].row;
        SocialInfo *info = self.socialInfo[row];
        destination.title = info.title;
        destination.url = info.url;
    }
}


@end
