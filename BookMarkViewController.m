//
//  BookMarkViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "BookMarkViewController.h"
#import "Element.h"
#import "Crystal.h"
#import "Substance_With_Ksp.h"
#import "Thermodynamics_Data.h"
#import "Reaction.h"
#import "ElementListCell.h"
#import "ThermodynamicsListCell.h"
#import "CrystalList.h"
#import "KSPListCell.h"
#import "ReactionListCell.h"
#import "ReactionDetailViewController.h"
#import "ThermodynamicsDetailViewController.h"
#import "ElementDetailViewController.h"
#import "CrystalDetailViewController.h"
#import "AppDelegate.h"


@interface BookMarkViewController ()

@end

@implementation BookMarkViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections != 0 ) {
        if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"元素"]) {
            return 61.0f;
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"晶体"]) {
            return 40;
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"热力学数据"]) {
            return 40;
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"沉淀积"]) {
            return 40;
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"反应"]) {
            return 40;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avails = [[NSMutableArray alloc] initWithCapacity:4];
    self.title = @"书签";
    self.titles = [[NSMutableArray alloc] initWithCapacity:4];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    self.HUD.dimBackground = NO;
    self.HUD.labelText = @"正载入数据...";
    [self.HUD show:YES];
    [self.navigationController.view addSubview:self.HUD];
    __weak BookMarkViewController *weakSelf = self;
    dispatch_group_t fetchGroup = dispatch_group_create();
    dispatch_queue_t fetchQueue = dispatch_queue_create("Fetch", NULL);
    dispatch_group_async(fetchGroup,fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Element" inManagedObjectContext:context];
        NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"molar_number" ascending:YES];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"starred == %@",[NSNumber numberWithBool:YES]];
        request.predicate = p;
        request.entity = eD;
        request.sortDescriptors = @[sD];
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        NSMutableArray *objectIDs = [[NSMutableArray alloc] initWithCapacity:250];
        for (Element *reac in results) {
            [objectIDs addObject:[reac objectID]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *convertToObjects = [[NSMutableArray alloc] initWithCapacity:250];
            for (NSManagedObjectID *ID in objectIDs) {
                [convertToObjects addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
            }
            weakSelf.elements = convertToObjects;
        });
    });
    dispatch_group_async(fetchGroup,fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
        NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"starred == %@",[NSNumber numberWithBool:YES]];
        request.predicate = p;
        request.entity = eD;
        request.sortDescriptors = @[sD];
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        NSMutableArray *objectIDs = [[NSMutableArray alloc] initWithCapacity:250];
        for (Crystal *reac in results) {
            [objectIDs addObject:[reac objectID]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *convertToObjects = [[NSMutableArray alloc] initWithCapacity:250];
            for (NSManagedObjectID *ID in objectIDs) {
                [convertToObjects addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
            }
            weakSelf.crystals = convertToObjects;
        });
    });
    dispatch_group_async(fetchGroup,fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Thermodynamics_Data" inManagedObjectContext:context];
        NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"starred == %@",[NSNumber numberWithBool:YES]];
        request.predicate = p;
        request.entity = eD;
        request.sortDescriptors = @[sD];
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        NSMutableArray *objectIDs = [[NSMutableArray alloc] initWithCapacity:250];
        for (Thermodynamics_Data    *reac in results) {
            [objectIDs addObject:[reac objectID]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *convertToObjects = [[NSMutableArray alloc] initWithCapacity:250];
            for (NSManagedObjectID *ID in objectIDs) {
                [convertToObjects addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
            }
            weakSelf.thermos = convertToObjects;
        });
    });
    dispatch_group_async(fetchGroup,fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Substance_With_Ksp" inManagedObjectContext:context];
        NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"starred == %@",[NSNumber numberWithBool:YES]];
        request.predicate = p;
        request.entity = eD;
        request.sortDescriptors = @[sD];
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        NSMutableArray *objectIDs = [[NSMutableArray alloc] initWithCapacity:250];
        for (Crystal *reac in results) {
            [objectIDs addObject:[reac objectID]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *convertToObjects = [[NSMutableArray alloc] initWithCapacity:250];
            for (NSManagedObjectID *ID in objectIDs) {
                [convertToObjects addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
            }
            weakSelf.ksps = convertToObjects;
        });
    });
    /*
    dispatch_group_async(fetchGroup,fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Reaction" inManagedObjectContext:context];
        NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"starred == %@",[NSNumber numberWithBool:YES]];
        request.predicate = p;
        request.entity = eD;
        request.sortDescriptors = @[sD];
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        NSMutableArray *objectIDs = [[NSMutableArray alloc] initWithCapacity:250];
        for (Reaction *reac in results) {
            [objectIDs addObject:[reac objectID]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *convertToObjects = [[NSMutableArray alloc] initWithCapacity:250];
            for (NSManagedObjectID *ID in objectIDs) {
                [convertToObjects addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
            }
            weakSelf.reactions = convertToObjects;
        });
    });
     */
    dispatch_group_notify(fetchGroup, dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
        [self.HUD hide:YES];
    });
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
    //Element, Crystal, Thermo, Ksp
    int sections = 0;
    if (self.elements) {
        if (self.elements.count > 0) {
            sections++;
            [self.avails addObject:self.elements];
            [self.titles addObject:@"元素"];
        }
    }
    if (self.crystals) {
        if (self.crystals.count > 0) {
            sections++;
            [self.avails addObject:self.crystals];
            [self.titles addObject:@"晶体"];


        }
    }
    if (self.thermos) {
        if (self.thermos.count > 0) {
            sections++;
            [self.avails addObject:self.thermos];
            [self.titles addObject:@"热力学数据"];

        }
    }
    if (self.ksps) {
        if (self.ksps.count > 0) {
            sections++;
            [self.avails addObject:self.ksps];
            [self.titles addObject:@"沉淀积"];


        }
    }
    self.sections = sections;
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSMutableArray *) [self.avails objectAtIndex:section]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"元素"]) {
          ElementListCell *  cell = [[ElementListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Bookmark"];
        [cell awakeFromNib];
        NSMutableArray *data = self.elements;
        Element *element = [data objectAtIndex:indexPath.row];
        cell.chineseNameString = [@"Name : " stringByAppendingString: element.english_name];
        cell.atomicMassString = [@"Molar mass : " stringByAppendingString:element.molar_mass];
        cell.atomicNumberString = [NSString stringWithFormat:@"%d", [element.molar_number intValue]];
        cell.elementString  = [element.elementary_substance stringByReplacingOccurrencesOfString:@"*" withString:@""];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (element.starred && ([element.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        [cell.starred setBackgroundImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateNormal];
        [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateSelected];
        cell.starred.enabled = NO;

        [cell awake];
        return cell;
    } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"晶体"]) {
          CrystalList *  cell = [[CrystalList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Bookmark"];
        [cell awakeFromNib];
        NSMutableArray *data = self.crystals;
        Crystal *reaction = [data objectAtIndex:indexPath.row];
        /*
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        cell.current = reaction;
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateNormal];
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateSelected];
        [cell.starred addTarget:self action:@selector(star:) forControlEvents:UIControlEventTouchUpInside];
         */
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        cell.current = reaction;
        [cell.starred setBackgroundImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateNormal];
        [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateSelected];
        cell.starred.enabled = NO;

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.crystal = reaction;
        cell.designatedImage = reaction.image_data;
        return cell;
    } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"热力学数据"]) {
           ThermodynamicsListCell * cell = [[ThermodynamicsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Bookmark"];
        [cell awakeFromNib];

        NSMutableArray *data = self.thermos;
        Thermodynamics_Data *reaction = [data objectAtIndex:indexPath.row];
        cell.current = reaction;
        cell.thermodynamics = reaction;
        cell.designatedImage = reaction.image_data;
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        cell.current = reaction;
        [cell.starred setBackgroundImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateNormal];
        [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateSelected];
        cell.starred.enabled = NO;

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"沉淀积"]) {
          KSPListCell *  cell = [[KSPListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Bookmark"];
        [cell awakeFromNib];
        cell.userInteractionEnabled = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableArray *data = self.ksps;
        Substance_With_Ksp *reaction = [data objectAtIndex:indexPath.row];
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        cell.current = reaction;
        [cell.starred setBackgroundImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateNormal];
        [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateSelected];
        cell.starred.enabled = NO;
        /*
        cell.current = reaction;
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateNormal];
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateSelected];
        [cell.starred addTarget:self action:@selector(star:) forControlEvents:UIControlEventTouchUpInside];
         */
        cell.substance = reaction;
        cell.designatedImage = reaction.image_data;
        return cell;
        
    }/* else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"反应"]) {
            ReactionListCell * cell = [[ReactionListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Bookmark"];
        [cell awakeFromNib];
        NSMutableArray *data = self.reactions;
        Reaction *reaction = [data objectAtIndex:indexPath.row];
        if (reaction.starred && ([reaction.starred boolValue])) {
            cell.starred.selected = YES;
        } else {
            cell.starred.selected = NO;
        }
        cell.current = reaction;
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateNormal];
        [cell.starred setBackgroundImage:[UIImage imageNamed:@"starred.png"] forState:UIControlStateSelected];
        cell.designatedImage = reaction.image_data;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        return cell;
    }*/
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.sections != 0 ) {
        return [self.titles objectAtIndex:section];
    }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if (self.sections != 0 ) {
        if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"元素"]) {
            ElementDetailViewController *detailViewController = [[ElementDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
            detailViewController.element = [self.elements objectAtIndex:indexPath.row];
            detailViewController.hidesBottomBarWhenPushed    = YES;
            [self.navigationController   pushViewController:detailViewController animated:YES];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            detailViewController.title = @"元素信息";
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"晶体"]) {
            CrystalDetailViewController *detailView = [[CrystalDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
            detailView.element = [self.crystals objectAtIndex:indexPath.row];
            detailView.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:detailView animated:YES];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"热力学数据"]) {
            ThermodynamicsDetailViewController *detailViewController = [[ThermodynamicsDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
            detailViewController.thermodynamics = [self.thermos objectAtIndex:indexPath.row];
            detailViewController.hidesBottomBarWhenPushed    = YES;
            [self.navigationController   pushViewController:detailViewController animated:YES];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            detailViewController.title = @"详细热力学数据";
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"沉淀积"]) {
            NSLog(@"D");
        } else if ([[self.titles objectAtIndex:indexPath.section] isEqualToString:@"反应"]) {
            ReactionDetailViewController *detailView = [[ReactionDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
            detailView.reaction = [self.reactions objectAtIndex:indexPath.row];
            detailView.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:detailView animated:YES];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
    
    
}

@end
