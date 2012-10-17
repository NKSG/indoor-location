//
//  MainTVC.m
//  Indopos.ios
//
//  Created by Wonsang Song on 10/4/12.
//  Copyright (c) 2012 Wonsang Song. All rights reserved.
//

#import "Logger.h"
#import "MainTVC.h"

@implementation MainTVC

@synthesize buildingInfo;
@synthesize distanceFormatter;
@synthesize delegate;

# pragma mark -
# pragma mark View

- (void)viewDidLoad
{
    self.curFloorTextField.text = [self.buildingInfo.floorOfEntry stringValue];
    self.curDispositionTextField.text = @"0";
    startButtonOn = NO;
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *addr = [NSString stringWithFormat:@"%@\n%@\n%@", self.buildingInfo.address1, self.buildingInfo.address2, self.buildingInfo.address3];
    self.addressTextView.text = addr;
}


# pragma mark -
# pragma mark UI Action functions

- (IBAction)startButtonTouched:(id)sender {
    DLog(@"startbutton touched state: %@", startButtonOn ? @"YES" : @"NO");
    UIButton *button = (UIButton *)sender;
    if (startButtonOn == YES) {
        DLog(@"stop pushed");
        startButtonOn = NO;
        [button setTitle:@"Start" forState:UIControlStateNormal];
        //[button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.delegate stopButtonPushed:self];
    } else {
        DLog(@"start pushed");
        startButtonOn = YES;
        [button setTitle:@"Stop" forState:UIControlStateNormal];
        //[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.delegate startButtonPushed:self];
    }
}

- (IBAction)refresh:(id)sender {
    [self.delegate refreshButtonPushed:self];
}

- (void)updateCurrentFloor:(NSNumber *)currentFloor {
    self.curFloorTextField.text = [NSString stringWithFormat:@"%d", [currentFloor intValue]];
}

- (void)updateCurrentDisplacement:(NSNumber *)currentDisplacement {
    self.curDispositionTextField.text = [NSString stringWithFormat:@"%@", [self.distanceFormatter stringFromNumber:currentDisplacement]];

}

@end;