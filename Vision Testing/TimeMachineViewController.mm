//
//  TimeMachineViewController.m
//  Vision Testing
//
//  Created by Adam Gleichsner on 12/21/14.
//  Copyright (c) 2014 Lufthouse, Inc. All rights reserved.
//

#import "TimeMachineViewController.h"
#import "ImageTargetsViewController.h"
#import "TimeMachineSlidingMenuController.h"

#define FLOATBOX(x) [NSNumber numberWithFloat:x]

@implementation TimeMachineViewController

- (void) viewWillAppear:(BOOL)animated {
    BOOL didSetupTestData = [self setupTestData];
    if  (!didSetupTestData)
        throw [[NSException alloc] initWithName:@"IllegalActionException" reason:@"Error in setting up test data" userInfo:nil];
    else
        NSLog(@"Test data loaded");
}

- (BOOL) setupTestData {
    
    self.datName = @"Sloths.dat";
    self.xmlName = @"Sloths.xml";
    self.displayImages = [self generateImageArray:@[@"http://images.nationalgeographic.com/wpf/media-live/photos/000/603/cache/babythreetoe-990_60372_600x450.jpg", @"http://caseyweldon.com/home/newsite/paintings/images/full/SLOTHH.jpg", @"http://theawkwardyeti.com/wp-content/uploads/2013/08/FancySloth.png"]];
    
    return true;
}

- (NSMutableArray *) generateImageArray:(NSArray *)imageURLs {
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    NSURL *url;
    NSData *imageData;
    NSMutableArray *fileNames = [[NSMutableArray alloc] init];
    NSMutableArray *imageCoordinates = [[NSMutableArray alloc] init];
    
    
    for (int i = 0; i < [imageURLs count]; i++) {
        url = [NSURL URLWithString:imageURLs[i]];
        imageData = [NSData dataWithContentsOfURL:url];
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
            [imageCoordinates addObject:[self generateImageCoordinatesWithWidth:image.size.width AndHeight:image.size.height]];
            
            NSArray   *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString  *documentsDirectory = [paths objectAtIndex:0];
            
            NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [NSString stringWithFormat:@"%d.jpg", i]];
            [imageData writeToFile:filePath atomically:YES];
            [fileNames addObject:[NSString stringWithFormat:@"%d.jpg", i]];
        } else
            NSLog(@"Error in downloading image");
        
    }
    
    [returnArray addObject:fileNames];
    [returnArray addObject:imageCoordinates];
    
    return returnArray;
}

- (NSArray *) generateImageCoordinatesWithWidth:(CGFloat) width AndHeight:(CGFloat) height
{
    /* Example of 600 x 755
     {
     -300.0f, -382.5f, 0.0f, //bottom-left corner
     300.0f, -382.5f, 0.0f, //bottom-right corner
     300.0f, 382.5f, 0.0f, //top-right corner
     -300.0f, 382.5f, 0.0f //top-left corner
     }
     */
    NSArray *returnArray = [NSMutableArray arrayWithObjects:
                                  FLOATBOX(-width/2), FLOATBOX(-height/2), FLOATBOX(0),
                                  FLOATBOX(width/2), FLOATBOX(-height/2), FLOATBOX(0),
                                  FLOATBOX(width/2), FLOATBOX(height/2), FLOATBOX(0),
                                  FLOATBOX(-width/2), FLOATBOX(height/2), FLOATBOX(0),
                                  nil];
    
    return returnArray;
}

- (IBAction)startImageTargeting {
    
    ImageTargetsViewController *vc = [[[ImageTargetsViewController class] alloc] initWithNibName:nil bundle:nil];
    vc.datName = self.datName;
    vc.xmlName = self.xmlName;
    vc.imageFileNames = self.displayImages[0];
    vc.imageCoordinates = self.displayImages[1];
    
    TimeMachineSlidingMenuController *slidingMenuController = [[TimeMachineSlidingMenuController alloc] initWithRootViewController:vc];
    
    [self.navigationController pushViewController:slidingMenuController animated:NO];
}

@end
