//
//  ReactionDetailViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-3.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "ReactionDetailViewController.h"
#import "Tapku/src/TapkuLibrary/TapkuLibrary.h"
#import "ReactionListCell.h"
#define IPHONE_5_LIMIT 454
#define LIMIT 366

@interface ReactionDetailViewController ()

@end

@implementation ReactionDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 50;
    } else if (indexPath.row == 3) {
        if (IS_IPHONE_5) {
            CGSize textViewSize = [[self.reaction.reaction_description stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(IPHONE_5_LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation];
            return textViewSize.height+25;
        } else {
            CGSize textViewSize = [[self.reaction.reaction_description stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation];
            return textViewSize.height+25;
        }
        
    } else {
        return 44;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Reaction Details";
    ReactionListCell *cell1 = [[ReactionListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell1.equationImageView = [[UIImageView alloc] init];
    cell1.inside    = YES;
    [cell1.contentView addSubview:cell1.equationImageView];
    cell1.designatedImage = self.reaction.image_data;
    TKLabelFieldCell *cell2 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell2.label.text = @"No.";
	cell2.field.text = [self.reaction.tag stringValue];
	TKLabelFieldCell *cell3 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell3.label.text = @"Reaction Condition";
	cell3.field.text = self.reaction.reaction_condition;
    TKLabelFieldCell *cell4 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell4.label.text = @"Description";
	cell4.field.text = [self.reaction.reaction_description stringByAppendingString:@"。"];
    cell4.field.numberOfLines = 0;
    self.cells = [[NSArray alloc] initWithObjects:cell1,cell2,cell3,cell4, nil];
    for (id cell in self.cells) {
        if (![cell isKindOfClass:[ReactionListCell class]]) {
            ((TKLabelFieldCell *)cell).label.font = [UIFont boldSystemFontOfSize:12];
        }
        ((UITableViewCell *) cell).userInteractionEnabled = NO;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cells count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self.cells objectAtIndex:indexPath.row];
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

@end
