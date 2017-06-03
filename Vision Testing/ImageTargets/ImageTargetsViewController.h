/*===============================================================================
Copyright (c) 2012-2014 Qualcomm Connected Experiences, Inc. All Rights Reserved.

Vuforia is a trademark of QUALCOMM Incorporated, registered in the United States 
and other countries. Trademarks of QUALCOMM Incorporated are used with permission.
===============================================================================*/

#import <UIKit/UIKit.h>
#import "SampleAppMenu.h"
#import "ImageTargetsEAGLView.h"
#import "TimeMachineSession.h"
#import <QCAR/DataSet.h>

@interface ImageTargetsViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    ImageTargetsEAGLView* eaglView;
    QCAR::DataSet*  dataSetCurrent;
    QCAR::DataSet*  dataSetInstallation;
    UITapGestureRecognizer * tapGestureRecognizer;
    TimeMachineSession * vapp;
    
    BOOL switchToTarmac;
    BOOL switchToStonesAndChips;
    BOOL extendedTrackingIsOn;
}
@property NSString *datName;
@property NSString *xmlName;
@property NSMutableArray *imageCoordinates;
@property NSMutableArray *imageFileNames;

@end
