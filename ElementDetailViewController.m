//
//  ElementDetailViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "ElementDetailViewController.h"
#import "Element.h"
#import "Tapku/src/TapkuLibrary/TapkuLibrary.h"
#define IPHONE_5_LIMIT 454
#define LIMIT 366
#define CONV(x) if (IS_IPHONE_5) { CGSize textViewSize = [[self.element.x stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(IPHONE_5_LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; } else { CGSize textViewSize = [[self.element.x stringByAppendingString:@"" ] sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(LIMIT, 9999) lineBreakMode:UILineBreakModeTailTruncation]; return textViewSize.height+25; }

@interface ElementDetailViewController ()

@end

@implementation ElementDetailViewController

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
    switch (indexPath.row) {
        case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9: case 10: case 11: case 12: case 13:
        {
            return 40;
        }
            break;
            
        case 14:
        {
            CONV(overview);
            break;
        }
        case 15:
        {
            CONV(description_of_element);
            break;
        }
        case 16:
        {
            CONV(origin);
            break;
        }
        case 17:
        {
            CONV(usage);
            break;
        }
        case 18:
        {
            CONV(origin_of_name);
            break;
        }
            break;
            default:
            return 40;
            break;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"详细元素信息";
    TKLabelFieldCell *cell1 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell1.label.text = @"原子序数";
	cell1.field.text = [self.element.molar_number stringValue];
	TKLabelFieldCell *cell2 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell2.label.text = @"元素符号";
	cell2.field.text = self.element.elementary_substance;
    TKLabelFieldCell *cell3 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell3.label.text = @"中文名称";
	cell3.field.text = self.element.chinese_name;
    TKLabelFieldCell *cell4 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell4.label.text = @"英文名称";
    cell4.field.text = self.element.english_name;
    TKLabelFieldCell *cell = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.label.text = @"原子量";
    cell.field.text = self.element.molar_mass;
    TKLabelFieldCell *cell5 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell5.label.text = @"常见单质";
    cell5.field.text = self.element.element;
    TKLabelFieldCell *cell6 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell6.label.text = @"常见价态";
    cell6.field.text = self.element.common_valencey;
    TKLabelFieldCell *cell7 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell7.label.text = @"密度";
    if ([self.element.density isEqualToString:@"[目前尚未有数据]"]) {
        cell7.field.text = [self.element.density stringByAppendingString:@" (克 / 立方厘米)"];
    } else {
        cell7.field.text = self.element.density;
    }
    TKLabelFieldCell *cell10 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell10.label.text = @"原子半径";
    cell10.field.text = self.element.atomic_radius;
    
    TKLabelFieldCell *ionic = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    ionic.label.text = @"离子半径";
    ionic.field.text = self.element.ionic_radius;
    
    TKLabelFieldCell *cell11 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell11.label.text = @"熔点";
    if (![self.element.melt_temperature isEqualToString:@""]) {
        cell11.field.text = [self.element.melt_temperature stringByAppendingString:@"(摄氏度)"];
    } else {
        cell11.field.text = self.element.melt_temperature;
    }
    TKLabelFieldCell *cell12 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell12.label.text = @"沸点";
    if (![self.element.boiling_temperature isEqualToString:@""]) {
        cell12.field.text = [self.element.boiling_temperature stringByAppendingString:@"(摄氏度)"];
    } else {
        cell12.field.text = self.element.boiling_temperature;
    }
    
    
    TKLabelFieldCell *cell8 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell8.label.text = @"发现年代";
    cell8.field.text = self.element.discovered_year;
    TKLabelFieldCell *cell9 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell9.label.text = @"发现者";
    cell9.field.text = self.element.discoverer;
    
    TKLabelFieldCell *cell13 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell13.label.text = @"概述";
    cell13.field.text = self.element.overview;
    
    TKLabelFieldCell *cell14 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell14.label.text = @"描述";
    cell14.field.text = self.element.description_of_element;
    
    TKLabelFieldCell *cell15 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell15.label.text = @"来源";
    cell15.field.text = self.element.origin;
    
    TKLabelFieldCell *cell16 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell16.label.text = @"用途";
    cell16.field.text = self.element.usage;
    
    TKLabelFieldCell *cell17 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell17.label.text = @"名字来源";
    cell17.field.text = self.element.origin_of_name;
    
    TKLabelFieldCell *cell18 = [[TKLabelFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell18.label.text = @"放射性";
    cell18.field.text = self.element.radio;
    
    self.cells = [[NSMutableArray alloc] initWithObjects:cell1,cell2,cell3,cell4,cell,cell5,cell6,cell7,cell10,ionic,cell11,cell12,cell8,cell9, cell13,cell14,cell15,cell16,cell17,cell18,nil];
    for (id cell in self.cells) {
        ((TKLabelFieldCell *) cell).label.font = [UIFont boldSystemFontOfSize:12];
        ((UITableViewCell *) cell).userInteractionEnabled = NO;
        ((TKLabelFieldCell *) cell).field.numberOfLines     = 0;
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
