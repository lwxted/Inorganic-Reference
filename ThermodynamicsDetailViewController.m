//
//  ThermodynamicsDetailViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "ThermodynamicsDetailViewController.h"
#import "Thermodynamics_Data.h"
#import "Tapku/src/TapkuLibrary/TapkuLibrary.h"
#import "ThermodynamicsListCell.h"
#define IPHONE_5_LIMIT 454
#define LIMIT 366
#define CONV(x) if (IS_IPHONE_5) { CGSize textViewSize = [[self.thermodynamics.x stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(IPHONE_5_LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; } else { CGSize textViewSize = [[self.thermodynamics.x stringByAppendingString:@"。" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; }

@interface ThermodynamicsDetailViewController ()

@end

@implementation ThermodynamicsDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
        return 55;
    } else {
        return 40;
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Thermodynamics Detail";
    ThermodynamicsListCell *cell1 = [[ThermodynamicsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Thermodynamics Detail Cell"];
    cell1.equationImageView = [[UIImageView alloc] init];
    [cell1.contentView addSubview:cell1.equationImageView];
    cell1.inside = YES;
    cell1.designatedImage =self.thermodynamics.image_data;
    TKLabelFieldCell *cell2 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell2.label.text = @"No.";
	cell2.field.text = [self.thermodynamics.tag stringValue];
	TKLabelFieldCell *cell3 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell3.label.text = @"State";
    NSString *cue = @"";
    if ([self.thermodynamics.state isEqualToString:@"g"]) {
        cue = @"";
    } else if ([self.thermodynamics.state isEqualToString:@"l"]) {
        cue = @"";
    } else if ([self.thermodynamics.state isEqualToString:@"cr"]) {
        cue = @"";
    } else {
        cue = @"";
    }
	cell3.field.text =self.thermodynamics.state;
    cell3.field.text = [cue stringByAppendingFormat:@" (%@)",self.thermodynamics.state];
    TKLabelFieldCell *cell4 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell4.label.text = @"△fHΘ Enthalpy";
	cell4.field.text =[self.thermodynamics.enthalpy stringByAppendingString:@" (kJ / mol)"];
    TKLabelFieldCell *cell5 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell5.label.text = @"△fGΘ Gibbs";
	cell5.field.text =[self.thermodynamics.gibbs stringByAppendingString:@" (kJ / mol)"];
    TKLabelFieldCell *cell6 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell6.label.text = @"SΘ Entropy";
	cell6.field.text =[self.thermodynamics.entropy stringByAppendingString:@" (J / mol K)"];
    TKLabelFieldCell *cell7 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell7.label.text = @"CpΘ Heat Cap.";
	cell7.field.text = [self.thermodynamics.heat_capacity stringByAppendingString:@" (J / mol K)"];

    self.cells = [[NSMutableArray alloc] initWithObjects:cell1,cell2,cell3,cell4,cell5,cell6,cell7, nil];
    for (id cell in self.cells) {
        if (![cell isKindOfClass:[ThermodynamicsListCell class]]) {
            ((TKLabelFieldCell *)cell).label.font = [UIFont boldSystemFontOfSize:12];
        }
        ((UITableViewCell *) cell).userInteractionEnabled = NO;
    }
}
/*
 - (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (indexPath.row == 0) {
 return 50;
 } else if (indexPath.row == 3) {
 if (IS_IPHONE_5) {
 CGSize textViewSize = [[self.reaction.reaction_description stringByAppendingString:@"。" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(IPHONE_5_LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation];
 return textViewSize.height+25;
 } else {
 CGSize textViewSize = [[self.reaction.reaction_description stringByAppendingString:@"。" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation];
 return textViewSize.height+25;
 }
 
 } else {
 return 44;
 }
 }
 
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 self.title = @"详细反应信息";
 ReactionListCell *cell1 = [[ReactionListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
 cell1.equationImageView = [[UIImageView alloc] init];
 cell1.inside    = YES;
 [cell1.contentView addSubview:cell1.equationImageView];
 cell1.designatedImage = self.reaction.image_data;
 TKLabelFieldCell *cell2 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
 cell2.label.text = @"编号";
 cell2.field.text = [self.reaction.tag stringValue];
 TKLabelFieldCell *cell3 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
 cell3.label.text = @"反应条件";
 cell3.field.text = self.reaction.reaction_condition;
 TKLabelFieldCell *cell4 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
 cell4.label.text = @"反应说明";
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
 }*/

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
@end
