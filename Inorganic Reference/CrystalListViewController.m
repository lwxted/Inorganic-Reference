//
//  CrystalListViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "CrystalListViewController.h"
#import "CrystalList.h"
#import "Crystal.h"
#import "CrystalDetailViewController.h"

@interface CrystalListViewController ()

@end

@implementation CrystalListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) aboutShow : (id) sender
{
    [self performSegueWithIdentifier:@"About" sender:self];
    //AboutViewController *about = [[AboutViewController alloc] init];
    //[self presentModalViewController:about animated:YES];
}
- (void) showBookMark : (id) sender
{
    BookMarkViewController *b = [[BookMarkViewController alloc] init];
    [self.navigationController pushViewController:b animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *about = [UIButton buttonWithType:UIButtonTypeInfoLight];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:about];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showBookMark:)];
    self.navigationItem.rightBarButtonItem = left;
    [about addTarget:self action:@selector(aboutShow:) forControlEvents:UIControlEventTouchUpInside];
    for (UIView *searchBarSubview in [self.searchBar subviews]) {
        if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
            @try {
                // set style of keyboard
                
                // always force return key to be enabled
                [(UITextField *)searchBarSubview setEnablesReturnKeyAutomatically:NO];
            }
            @catch (NSException * e) {
                // ignore exception
            }
        }
    }
    self.title = @"Crystals";
    /*
     NSLog(@"Started");
     NSManagedObjectContext *backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
     backgroundContext.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
     [backgroundContext performBlock:^{
     NSFetchRequest *request = [[NSFetchRequest alloc] init];
     NSEntityDescription *eD = [NSEntityDescription entityForName:@"Reaction" inManagedObjectContext:backgroundContext];
     NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
     request.entity = eD;
     request.sortDescriptors = @[sD];
     NSError *error = nil;
     NSArray *allItems = [backgroundContext executeFetchRequest:request error:&error];
     NSMutableArray *arrayOfIDs = [[NSMutableArray alloc] initWithCapacity:12656];
     for (Reaction *reac in allItems) {
     [arrayOfIDs addObject:[reac objectID]];
     }
     [[NSManagedObjectContext defaultContext] performBlock:^{
     NSMutableArray *allItemsByID = [[NSMutableArray alloc] initWithCapacity:12656];
     for (NSManagedObjectID *ID in arrayOfIDs) {
     [allItemsByID addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
     }
     self.allItems = [[NSArray alloc] initWithArray:allItemsByID];
     self.displayItems = [[NSMutableArray alloc] initWithArray:allItemsByID];
     NSLog(@"Ended");
     [self.tableView reloadData];
     }];
     }];
     */
    self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    self.HUD.dimBackground = NO;
    self.HUD.labelText = @"Loading Data...";
    [self.HUD show:YES];
    [self.navigationController.view addSubview:self.HUD];
    __weak CrystalListViewController *weakSelf = self;
    dispatch_queue_t fetchQueue = dispatch_queue_create("Fetch", NULL);
    dispatch_async(fetchQueue, ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [[NSManagedObjectContext defaultContext] persistentStoreCoordinator];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
        //NSSortDescriptor *sD = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        request.entity = eD;
        //request.sortDescriptors = @[sD];
        [request setFetchBatchSize:250];
        [request setFetchLimit:250];
        //[request setFetchBatchSize:50];
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
            weakSelf.displayItems = convertToObjects;
            weakSelf.allItems = [[NSArray alloc] initWithArray:convertToObjects];
            NSLog(@"Ended");
            [weakSelf.tableView reloadData];
            [self.HUD hide:YES];
        });
    });
    
    /*
     self.allItems = [Reaction findAllSortedBy:@"tag" ascending:YES];
     NSArray *arrayOfUnwantedItems = [Reaction findByAttribute:@"formula" withValue:@""];
     self.displayItems = [[NSMutableArray alloc] initWithArray:self.allItems];
     [self.displayItems removeObjectsInArray:arrayOfUnwantedItems];
     */
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.displayItems count];
}

- (void) star : (UIButton *) sender
{
    Crystal *element = [(CrystalList *) sender.superview.superview current];
    if (element.starred && ([element.starred boolValue])) {
        element.starred = @(NO);
    } else {
        element.starred = @(YES);
    }
    [[NSManagedObjectContext defaultContext] save];
    if (element.starred && ([element.starred boolValue])) {
        sender.selected = YES;
    } else {
        sender.selected = NO;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Crystal Cell";
    CrystalList *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[CrystalList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Crystal Cell"];
    }
    NSMutableArray *data = self.displayItems;
    Crystal *reaction = [data objectAtIndex:indexPath.row];
    
    if (reaction.starred && ([reaction.starred boolValue])) {
        cell.starred.selected = YES;
    } else {
        cell.starred.selected = NO;
    }
    cell.current = reaction;
    [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).plain forState:UIControlStateNormal];
    [cell.starred setImage:((AppDelegate *)[UIApplication sharedApplication].delegate).starred forState:UIControlStateSelected];
    [cell.starred addTarget:self action:@selector(star:) forControlEvents:UIControlEventTouchUpInside];
    cell.crystal = reaction;
    cell.designatedImage = reaction.image_data;
    return cell;
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    if (!self.pop) {
        if (!self.shownTip) {
            self.pop = [[CMPopTipView alloc] initWithMessage:NSLocalizedString(@"在这里输入元素符号或原子量进行搜索，可用逗号分开多个关键词。",nil)];
            self.shownTip = YES;
            self.pop.delegate = self;
            self.pop.backgroundColor = [UIColor colorWithRed:0.22f green:0.23f blue:0.23f alpha:1.00f];
            [self.pop presentPointingAtView:self.searchBar inView:self.navigationController.view animated:YES];
        }
    } else {
        [self.pop dismissAnimated:YES];
        self.pop = nil;
    }
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchBar.text isEqualToString:@""] || [searchBar.text isEqualToString:@" "]) {
        self.displayItems = [[NSMutableArray alloc] initWithArray:self.allItems];
        [self.tableView reloadData];
    } else {
        __weak CrystalListViewController *weakSelf = self;
        dispatch_queue_t searchQueue = dispatch_queue_create("Search Queue", NULL);
        dispatch_async(searchQueue, ^{
            NSError *error = nil;
            NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
            context.persistentStoreCoordinator = [NSManagedObjectContext defaultContext].persistentStoreCoordinator;
            NSString *str = self.searchBar.text;
            if (!([str isEqualToString:@""] || [str isEqualToString:@","] || [str isEqualToString:@" "])) {
                if ([str rangeOfString:@","].location == NSNotFound && [str rangeOfString:@"，"].location == NSNotFound) {
                    NSString *search = str;
                    NSFetchRequest *request = [[NSFetchRequest alloc] init];
                    NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
                    NSPredicate *p = [NSPredicate predicateWithFormat:@"(formula contains[c] %@) || (molar_mass contains %@)",search,search];
                    request.predicate = p;
                    request.entity = eD;
                    NSArray *arrayOfObjects = [context executeFetchRequest:request error:&error];
                    NSMutableArray *arrayOfIDs = [[NSMutableArray alloc] initWithCapacity:100];
                    for (Crystal    *reac in arrayOfObjects) {
                        [arrayOfIDs addObject:[reac objectID]];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSMutableArray *arrayOfObjectsByID = [[NSMutableArray alloc] initWithCapacity:100];
                        for (NSManagedObjectID *ID in arrayOfIDs) {
                            [arrayOfObjectsByID addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
                        }
                        weakSelf.displayItems = arrayOfObjectsByID;
                        [weakSelf.tableView reloadData];
                    });
                } else {
                    NSString *search = str;
                    NSArray *array = [search componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",，"]];
                    NSMutableArray *arrayOfSearchStrings = [[NSMutableArray alloc] initWithCapacity:array.count];
                    for (int i = 0; i<array.count;i++) {
                        if ([array objectAtIndex:i]) {
                            if (![[array objectAtIndex:i] isEqualToString:@""]) {
                                if (![[array objectAtIndex:i] isEqualToString:@" "]) {
                                    if ([[((NSString *)[array objectAtIndex:i]) substringWithRange:NSMakeRange(0, 1)] isEqualToString:@" "]) {
                                        [arrayOfSearchStrings addObject:[(NSString *)[array objectAtIndex:i] substringFromIndex:1]];
                                    } else {
                                        [arrayOfSearchStrings addObject:[array objectAtIndex:i]];
                                    }
                                }
                            }
                        }
                    }
                    NSFetchRequest *request = [[NSFetchRequest alloc] init];
                    NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
                    NSMutableArray *predicateArray = [[NSMutableArray alloc] initWithCapacity:arrayOfSearchStrings.count];
                    for (NSString *str in arrayOfSearchStrings) {
                        [predicateArray addObject:[NSPredicate predicateWithFormat:@"(formula contains[c] %@) || (molar_mass contains %@)",str,str]];
                    }
                    NSPredicate *predicateCompound = [NSCompoundPredicate andPredicateWithSubpredicates:predicateArray];
                    request.predicate = predicateCompound;
                    request.entity = eD;
                    NSArray *arrayOfObjects = [context executeFetchRequest:request error:&error];
                    NSMutableArray *arrayOfIDs = [[NSMutableArray alloc] initWithCapacity:100];
                    for (Crystal *reac in arrayOfObjects) {
                        [arrayOfIDs addObject:[reac objectID]];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSMutableArray *arrayOfObjectsByID = [[NSMutableArray alloc] initWithCapacity:100];
                        for (NSManagedObjectID *ID in arrayOfIDs) {
                            [arrayOfObjectsByID addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
                        }
                        weakSelf.displayItems = arrayOfObjectsByID;
                        [weakSelf.tableView reloadData];
                    });
                }
            }
        });
    }
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    if (self.pop) {
        [self.pop dismissAnimated:YES];
        self.pop = nil;
    }
    __weak CrystalListViewController *weakSelf = self;
    dispatch_queue_t searchQueue = dispatch_queue_create("Search Queue", NULL);
    dispatch_async(searchQueue, ^{
        NSError *error = nil;
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = [NSManagedObjectContext defaultContext].persistentStoreCoordinator;
        NSString *str = self.searchBar.text;
        if (!([str isEqualToString:@""] || [str isEqualToString:@","] || [str isEqualToString:@" "])) {
            if ([str rangeOfString:@","].location == NSNotFound && [str rangeOfString:@"，"].location == NSNotFound) {
                NSString *search = str;
                NSFetchRequest *request = [[NSFetchRequest alloc] init];
                NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
                NSPredicate *p = [NSPredicate predicateWithFormat:@"(formula contains[c] %@) || (molar_mass contains %@)",search,search];
                request.predicate = p;
                request.entity = eD;
                NSArray *arrayOfObjects = [context executeFetchRequest:request error:&error];
                NSMutableArray *arrayOfIDs = [[NSMutableArray alloc] initWithCapacity:100];
                for (Crystal    *reac in arrayOfObjects) {
                    [arrayOfIDs addObject:[reac objectID]];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSMutableArray *arrayOfObjectsByID = [[NSMutableArray alloc] initWithCapacity:100];
                    for (NSManagedObjectID *ID in arrayOfIDs) {
                        [arrayOfObjectsByID addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
                    }
                    weakSelf.displayItems = arrayOfObjectsByID;
                    [weakSelf.tableView reloadData];
                });
            } else {
                NSString *search = str;
                NSArray *array = [search componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",，"]];
                NSMutableArray *arrayOfSearchStrings = [[NSMutableArray alloc] initWithCapacity:array.count];
                for (int i = 0; i<array.count;i++) {
                    if ([array objectAtIndex:i]) {
                        if (![[array objectAtIndex:i] isEqualToString:@""]) {
                            if (![[array objectAtIndex:i] isEqualToString:@" "]) {
                                if ([[((NSString *)[array objectAtIndex:i]) substringWithRange:NSMakeRange(0, 1)] isEqualToString:@" "]) {
                                    [arrayOfSearchStrings addObject:[(NSString *)[array objectAtIndex:i] substringFromIndex:1]];
                                } else {
                                    [arrayOfSearchStrings addObject:[array objectAtIndex:i]];
                                }
                            }
                        }
                    }
                }
                NSFetchRequest *request = [[NSFetchRequest alloc] init];
                NSEntityDescription *eD = [NSEntityDescription entityForName:@"Crystal" inManagedObjectContext:context];
                NSMutableArray *predicateArray = [[NSMutableArray alloc] initWithCapacity:arrayOfSearchStrings.count];
                for (NSString *str in arrayOfSearchStrings) {
                    [predicateArray addObject:[NSPredicate predicateWithFormat:@"(formula contains[c] %@) || (molar_mass contains %@)",str,str]];
                }
                NSPredicate *predicateCompound = [NSCompoundPredicate andPredicateWithSubpredicates:predicateArray];
                request.predicate = predicateCompound;
                request.entity = eD;
                NSArray *arrayOfObjects = [context executeFetchRequest:request error:&error];
                NSMutableArray *arrayOfIDs = [[NSMutableArray alloc] initWithCapacity:100];
                for (Crystal *reac in arrayOfObjects) {
                    [arrayOfIDs addObject:[reac objectID]];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSMutableArray *arrayOfObjectsByID = [[NSMutableArray alloc] initWithCapacity:100];
                    for (NSManagedObjectID *ID in arrayOfIDs) {
                        [arrayOfObjectsByID addObject:[[NSManagedObjectContext defaultContext] objectWithID:ID]];
                    }
                    weakSelf.displayItems = arrayOfObjectsByID;
                    [weakSelf.tableView reloadData];
                });
            }
        }
    });
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    if (self.pop) {
        [self.pop dismissAnimated:YES];
        self.pop = nil;
    }
    self.displayItems = [[NSMutableArray alloc] initWithArray:self.allItems];
    [self.tableView reloadData];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void) viewWillDisappear:(BOOL)animated
{
   // [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
   // [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void) popTipViewWasDismissedByUser:(CMPopTipView *)popTipView {
    // User can tap CMPopTipView to dismiss it
    popTipView = nil;
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
 
     //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     //[self.navigationController pushViewController:detailViewController animated:YES];
 
    CrystalDetailViewController *detailView = [[CrystalDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailView.element = [self.displayItems objectAtIndex:indexPath.row];
    detailView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailView animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
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


@end
