//
//  CrystalDetailViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "CrystalDetailViewController.h"
#import "CrystalList.h"
#import "Crystal.h"
#import "Tapku/src/TapkuLibrary/TapkuLibrary.h"
#define IPHONE_5_LIMIT 454
#define LIMIT 366
#define CONV(x) if (IS_IPHONE_5) { CGSize textViewSize = [[self.element.x stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(IPHONE_5_LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; } else { CGSize textViewSize = [[self.element.x stringByAppendingString:@"。" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; }

@interface CrystalDetailViewController ()

@end

@implementation CrystalDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 55;
    } else {
        return 40;
    }
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"晶体信息";
    CrystalList *cell1 = [[CrystalList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell Crystal"];
    cell1.equationImageView = [[UIImageView alloc] init];
    [cell1.contentView addSubview:cell1.equationImageView];
    cell1.inside = YES;
    cell1.designatedImage = self.element.image_data;
    TKLabelFieldCell *cell2 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell2.label.text = @"编号";
	cell2.field.text = [self.element.tag stringValue];
	TKLabelFieldCell *cell3 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell3.label.text = @"熔点";
	cell3.field.text = self.element.melt_temperature;
    TKLabelFieldCell *cell4 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell4.label.text = @"沸点";
	cell4.field.text = self.element.boiling_temperature;
    TKLabelFieldCell *cell5 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell5.label.text = @"密度";
	cell5.field.text = self.element.density;
    TKLabelFieldCell *cell6 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell6.label.text = @"溶解度";
	cell6.field.text = self.element.solubility;
    TKLabelFieldCell *cell7 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell7.label.text = @"该晶形的摩尔质量";
	cell7.field.text = [NSString stringWithFormat:@"%.2f" ,[self.element.molar_mass floatValue]];
    TKLabelFieldCell *cell8 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell8.label.text = @"晶形";
	cell8.field.text = self.element.form;
    TKLabelFieldCell *cell9 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell9.label.text = @"颜色 / 描述";
	cell9.field.text = self.element.color;
    self.cells = [[NSMutableArray alloc] initWithObjects:cell1,cell8,cell2,cell3,cell4,cell5,cell6,cell7,cell9, nil];
    for (id cell in self.cells) {
        if (![cell isKindOfClass:[CrystalList class]]) {
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
