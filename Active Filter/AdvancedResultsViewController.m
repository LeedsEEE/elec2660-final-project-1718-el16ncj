//
//  AdvancedResultsViewController.m
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "AdvancedResultsViewController.h"

@interface AdvancedResultsViewController ()

@end

@implementation AdvancedResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Freq1 = %f", self.AdvancedObjectPassed.freq1);
    NSLog(@"Freq2 = %f", self.AdvancedObjectPassed.freq2);
    NSLog(@"Freq3 = %f", self.AdvancedObjectPassed.freq3);
    NSLog(@"R1 = %f", self.AdvancedObjectPassed.R1);
    NSLog(@"C1 = %f", self.AdvancedObjectPassed.C1);
    NSLog(@"R2 = %f", self.AdvancedObjectPassed.R2);
    NSLog(@"C2 = %f", self.AdvancedObjectPassed.C2);
    NSLog(@"R3 = %f", self.AdvancedObjectPassed.R3);
    NSLog(@"C3 = %f", self.AdvancedObjectPassed.C3);
    
    NSLog(@"Poles = %i", self.AdvancedObjectPassed.poles);
    NSLog(@"Char = %i", self.AdvancedObjectPassed.characteristics);
    NSLog(@"Type = %i", self.AdvancedObjectPassed.type);
    NSLog(@"Ripple = %i", self.AdvancedObjectPassed.ripple);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
