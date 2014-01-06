//
//  DataLoadingViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-2.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "DataLoadingViewController.h"
#import "Reaction.h"
#import "Element.h"
#import "Data.h"
#import "Thermodynamics_Data.h"
#import "Crystal.h"
#import "Substance_With_Ksp.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#define GET(x) [x objectAtIndex:i]
#define DELETE @[@740,@745,@746,@748,@889,@1427,@1430,@2220,@2283,@2284,@2860,@2968,@3143,@3652,@3877,@5038,@5565,@5567,@5926,@5987,@6254,@6255,@6346,@6347,@7080,@7081,@7194,@7259,@7306,@7333,@7692,@8174,@8388,@9405,@9408,@9409,@9682,@9685,@9717,@9926,@9927,@10098,@10265,@10268,@10286,@10288,@10447,@10451,@10487,@10491,@10733,@10759,@10761,@11084,@11085,@11095,@11096,@11215,@11219,@11297,@11301,@11313,@11632,@11640,@11694,@11737,@11738,@11739,@11740,@11745,@11746,@11748,@11786,@11878,@12005,@12006,@12012,@12024,@12031,@12036,@12249,@12308,@12347,@12374,@12376,@12388,@12536,@12601]

@interface DataLoadingViewController ()

@end

@implementation DataLoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __block UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [self.view addSubview:imageView];
    __block NSManagedObjectContext *blockedContext = nil;
    dispatch_group_t writeGroup = dispatch_group_create();
    dispatch_queue_t writeQueue = dispatch_queue_create("Adding sets and its terms", NULL);
    dispatch_group_async(writeGroup, writeQueue, ^{
        NSManagedObjectContext *mainContext = [NSManagedObjectContext defaultContext];
        NSManagedObjectContext *localContext = [[NSManagedObjectContext alloc] init];
        localContext.persistentStoreCoordinator = mainContext.persistentStoreCoordinator;
        blockedContext = localContext;
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(backgroundContextDidSave:)
         name:NSManagedObjectContextDidSaveNotification
         object:localContext];
        for (int i = 0 ; i < 683 ; i++) {
            if ((i!=220) && (i!=221)) {
                NSEntityDescription *entityDescription = [NSEntityDescription
                                                          entityForName:@"Thermodynamics_Data" inManagedObjectContext:localContext];
                NSFetchRequest *request = [[NSFetchRequest alloc] init];
                [request setEntity:entityDescription];
                
                // Set example predicate and sort orderings...
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tag == %@",@(i+1)];
                [request setPredicate:predicate];
                NSError *error = nil;
                NSArray *crystals = [localContext executeFetchRequest:request error:&error];
                Thermodynamics_Data *mod = [crystals lastObject];
                //NSLog(@"Loading %@",[@[ADDRESS] objectAtIndex:i]);
                
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[@[ADDRESS] objectAtIndex:i] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
                while ((image.size.height == 0) || (image.size.width == 0)) {
                    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[@[ADDRESS] objectAtIndex:i]]]];
                }
                mod.image_data = image;
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
                    imageView.image = image;
                });
                if (![localContext save:&error]) {
                    NSLog(@"Oops");
                } else {
                    NSLog(@"Done %d",i+1);
                }
            }
            
            
            //NSLog(@"%@",mod.formula);
        }
    });
        /*
        NSArray *equationDescription = @[EQUATION_DESCRIPTION];
        NSArray *equationCondition = @[REACTION_CONDITION];
        int count = 0;
        int countOfSave = 0;
        for (int i = 0 ; i<= 12656;i++) {
            if (![DELETE containsObject:@(i+1)]) {
                NSEntityDescription *entityDescription = [NSEntityDescription
                                                          entityForName:@"Reaction" inManagedObjectContext:localContext];
                NSFetchRequest *request = [[NSFetchRequest alloc] init];
                [request setEntity:entityDescription];
                
                // Set example predicate and sort orderings...
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tag == %@",@(i+1)];
                [request setPredicate:predicate];
                NSError *error;
                NSArray *reactions = [localContext executeFetchRequest:request error:&error];
                Reaction *reac = [reactions lastObject];
                reac.reaction_condition = [equationCondition objectAtIndex:i];
                reac.reaction_description = [equationDescription objectAtIndex:i];
                count ++;
                if (count == 50) {
                    countOfSave ++;
                    if (![localContext save:&error]) {
                        NSLog(@"Oops");
                    } else {
                        NSLog(@"Done %d",countOfSave);
                    }
                    count = 0;
                }
            } else {
                NSLog(@"Skipped %d",(i+1));
            }
        }
         */
    /*
    });
    dispatch_group_notify(writeGroup, writeQueue, ^{
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:blockedContext];
    });
    dispatch_release(writeQueue);
    dispatch_release(writeGroup);*/

     /*
    __block NSManagedObjectContext *blockedContext = nil;
    dispatch_group_t writeGroup = dispatch_group_create();
    dispatch_queue_t writeQueue = dispatch_queue_create("Adding sets and its terms", NULL);
    dispatch_group_async(writeGroup, writeQueue, ^{
        NSManagedObjectContext *mainContext = [NSManagedObjectContext defaultContext];
        NSManagedObjectContext *localContext = [[NSManagedObjectContext alloc] init];
        localContext.persistentStoreCoordinator = mainContext.persistentStoreCoordinator;
        blockedContext = localContext;
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(backgroundContextDidSave:)
         name:NSManagedObjectContextDidSaveNotification
         object:localContext];
        
        NSArray *reactionCondition = @[REACTION_CONDITION];
        int count = 0;
        for (int i = 0; i<=12656; i++) {
            NSEntityDescription *entityDescription = [NSEntityDescription
                                                      entityForName:@"Reaction" inManagedObjectContext:localContext];
            NSFetchRequest *request = [[NSFetchRequest alloc] init];
            [request setEntity:entityDescription];
            
            // Set example predicate and sort orderings...
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tag == %@",@(i+1)];
            [request setPredicate:predicate];
            NSError *error;
            NSArray *words = [localContext executeFetchRequest:request error:&error];
            Reaction *reac = (Reaction *) [words lastObject];
            NSString *str = [reactionCondition objectAtIndex:i];
            [reac setValue:str forKey:@"reaction_condition"];
            NSLog(@"Processing item %d",i+1);
            count ++;
            if (count == 50) {
                NSError *error = nil;
                if (![localContext save:&error]) {
                    NSLog(@"Some error occured");
                } else {
                    NSLog(@"Saved");
                }
                count = 0;
            }
         
         }
        NSEntityDescription *entityDescription = [NSEntityDescription
                                                  entityForName:@"Reaction" inManagedObjectContext:localContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDescription];
        
        // Set example predicate and sort orderings...
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES];
        NSPredicate *predicate = nil;
        [request setPredicate:predicate];
        [request setSortDescriptors:@[sort]];
        NSError *error;
        NSArray *arrayOfAllReactions = [localContext executeFetchRequest:request error:&error];
        int count = 1;
        for (int i = 0 ; i <= 12656 ; i++) {
            Reaction *reac = [arrayOfAllReactions objectAtIndex:i];
            UIImage *image = reac.image_data;
            [UIImagePNGRepresentation(image) writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%d.png",i+1]] atomically:YES];
            NSLog(@"%d",i);
        }
         
        
    });
    dispatch_group_notify(writeGroup, writeQueue, ^{
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:blockedContext];
    });
    dispatch_release(writeQueue);
    dispatch_release(writeGroup);
    */

}

- (void) backgroundContextDidSave:(NSNotification *)notification {
    NSManagedObjectContext *mainContext = [NSManagedObjectContext defaultContext];
    /* Make sure we're on the main thread when updating the main context */
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(backgroundContextDidSave:)
                               withObject:notification
                            waitUntilDone:NO];
        return;
    }
    /* merge in the changes to the main context */
    [mainContext mergeChangesFromContextDidSaveNotification:notification];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
