//
//  ResultsViewController.m
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "BasicResultsViewController.h"

@interface BasicResultsViewController ()

@end

@implementation BasicResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Freq1 = %f", self.BasicObjectPassed.freqf);
    NSLog(@"R1 = %f", self.BasicObjectPassed.R1);
    NSLog(@"C1 = %f", self.BasicObjectPassed.C1);
    NSLog(@"R2 = %f", self.BasicObjectPassed.R2);
    NSLog(@"C2 = %f", self.BasicObjectPassed.C2);
    NSLog(@"R3 = %f", self.BasicObjectPassed.R3);
    NSLog(@"C3 = %f", self.BasicObjectPassed.C3);
    
    NSLog(@"Poles = %i", self.BasicObjectPassed.poles);
    NSLog(@"Char = %i", self.BasicObjectPassed.characteristics);
    NSLog(@"Type = %i", self.BasicObjectPassed.type);
    NSLog(@"Ripple = %i", self.BasicObjectPassed.ripple);
    
    
    (void)self.setFilterLabelVal;
    
    self.ScrollView.minimumZoomScale = 1.0;
    self.ScrollView.maximumZoomScale = 6.0;
    self.ScrollView.contentSize = self.CircuitDiagram.frame.size;
    self.ScrollView.delegate = self;
    
    self.ResponseScrollView.minimumZoomScale = 1.0;
    self.ResponseScrollView.maximumZoomScale = 6.0;
    self.ResponseScrollView.contentSize = self.ResponseDiagram.frame.size;
    self.ResponseScrollView.delegate = self;

    
    (void)self.displayCircuitDiagram;
    (void)self.setCalcLabelVal;
    (void)self.displayResponseDiagram;
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


-(void) setFilterLabelVal {
    
    if(self.BasicObjectPassed.poles == 0) {
        if(self.BasicObjectPassed.characteristics == 0) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 2-Pole Low-Pass Filter"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 2-Pole High-Pass Filter"];
            }
        }
        else if(self.BasicObjectPassed.characteristics == 1 && self.BasicObjectPassed.ripple == 0) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole Low-Pass Filter (0.5dB)"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole High-Pass Filter (0.5dB)"];
            }
        }
        
        else if(self.BasicObjectPassed.characteristics == 1 && self. BasicObjectPassed.ripple == 1) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole Low-Pass Filter (2dB)"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole   High-Pass Filter (2dB)"];
            }
        }
    }
    
    else if(self.BasicObjectPassed.poles == 1) {
        
        if(self.BasicObjectPassed.characteristics == 0) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 4-Pole Low-Pass Filter"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 4-Pole High-Pass Filter"];
            }
        }
        else if(self.BasicObjectPassed.characteristics == 1 && self.BasicObjectPassed.ripple == 0) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole Low-Pass Filter (0.5dB)"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole High-Pass Filter (0.5dB)"];
            }
        }
        
        else if(self.BasicObjectPassed.characteristics == 1 && self. BasicObjectPassed.ripple == 1) {
            if(self.BasicObjectPassed.type == 0) {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole Low-Pass Filter (2dB)"];
            }
            else {
                self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole High-Pass Filter (2dB)"];
            }
        }
    }
        
        else if(self.BasicObjectPassed.poles == 2) {
            
            if(self.BasicObjectPassed.characteristics == 0) {
                if(self.BasicObjectPassed.type == 0) {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 6-Pole Low-Pass Filter"];
                }
                else {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Butterworth 6-Pole High-Pass Filter"];
                }
            }
            else if(self.BasicObjectPassed.characteristics == 1 && self.BasicObjectPassed.ripple == 0) {
                if(self.BasicObjectPassed.type == 0) {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole Low-Pass Filter (0.5dB)"];
                }
                else {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole High-Pass Filter (0.5dB)"];
                }
            }
            
            else if(self.BasicObjectPassed.characteristics == 1 && self. BasicObjectPassed.ripple == 1) {
                if(self.BasicObjectPassed.type == 0) {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole Low-Pass Filter (2dB)"];
                }
                else {
                    self.FilterTypeLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole   High-Pass Filter (2dB)"];
                
            }
        }
    }
};


- (void) setCalcLabelVal {
    
    [self.Stage1RLabel.layer setCornerRadius:0.5];
    [self.Stage1CLabel.layer setCornerRadius:0.5];
    [self.Stage2RLabel.layer setCornerRadius:0.5];
    [self.Stage2CLabel.layer setCornerRadius:0.5];
    [self.Stage3RLabel.layer setCornerRadius:0.5];
    [self.Stage3CLabel.layer setCornerRadius:0.5];
    [self.Stage1RALabel.layer setCornerRadius:0.5];
    [self.Stage1RBLabel.layer setCornerRadius:0.5];
    [self.Stage2RALabel.layer setCornerRadius:0.5];
    [self.Stage2RBLabel.layer setCornerRadius:0.5];
    [self.Stage3RALabel.layer setCornerRadius:0.5];
    [self.Stage3RBLabel.layer setCornerRadius:0.5];
    
    if (self.BasicObjectPassed.poles == 2) {
        
        //For Stage 1 R
        if(self.BasicObjectPassed.R1 >= 1e9) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R1/1e9)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e6) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R1/1e6)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e3) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R1/1e3)];
        }
        
        else {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R1)];
        }
        
        // For Stage 2 R
        
        if(self.BasicObjectPassed.R2 >= 1e9) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R2/1e9)];
        }
        
        else if(self.BasicObjectPassed.R2 >= 1e6) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R2/1e6)];
        }
        
        else if(self.BasicObjectPassed.R2 >= 1e3) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R2/1e3)];
        }
        
        else {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R2)];
        }
        
        
        // For Stage 3 R
        
        if(self.BasicObjectPassed.R3 >= 1e9) {
            
            self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R3/1e9)];
        }
        
        else if(self.BasicObjectPassed.R3 >= 1e6) {
            
            self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R3/1e6)];
        }
        
        else if(self.BasicObjectPassed.R3 >= 1e3) {
            
            self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R3/1e3)];
        }
        
        else {
            
            self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R3)];
        }
        
        // For Stage 1 RA
        
        if(self.BasicObjectPassed.RA1 >= 1e9) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e6) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e3) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA1/1e3)];
        }
        
        else {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA1)];
        }
        
        // For Stage 2 RA
        
        if(self.BasicObjectPassed.RA2 >= 1e9) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA2/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA2 >= 1e6) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA2/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA2 >= 1e3) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA2/1e3)];
        }
        
        else {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA2)];
        }
        
        
        // For Stage 3 RA
        
        if(self.BasicObjectPassed.RA3 >= 1e9) {
            
            self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA3/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA3 >= 1e6) {
            
            self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA3/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA3 >= 1e3) {
            
            self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA3/1e3)];
        }
        
        else {
            
            self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA3)];
        }
        
        // For Stage 1 RB
        
        if(self.BasicObjectPassed.RB1 >= 1e9) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e6) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e3) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB1/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB1)];
        }
        
        // For Stage 2 RB
        
        if(self.BasicObjectPassed.RB2 >= 1e9) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB2/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB2 >= 1e6) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB2/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB2 >= 1e3) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB2/1e3)];
        }
        
        else {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB2)];
        }
        
        // For Stage 3 RB
        
        if(self.BasicObjectPassed.RB3 >= 1e9) {
            
            self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB3/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB3 >= 1e6) {
            
            self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB3/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB3 >= 1e3) {
            
            self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB3/1e3)];
        }
        
        else {
            
            self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB3)];
        }
        
        // For Stage 1 C
        
        if(self.BasicObjectPassed.C1 >= 1e-6) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C1/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C1 >= 1e-9) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C1/1e-9)];
        }
        
        else {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C1/1e-12)];
        }
        
        // For Stage 2 C
        
        if(self.BasicObjectPassed.C2 >= 1e-6) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C2/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C2 >= 1e-9) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C2/1e-9)];
        }
        
        else {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C2/1e-12)];
        }
        
        
        // For Stage 3 C
        
        if(self.BasicObjectPassed.C3 >= 1e-6) {
            
            self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C3/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C3 >= 1e-9) {
            
            self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C3/1e-9)];
        }
        
        else {
            
            self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C3/1e-12)];
        }
    }
    
    //FOr Poles - 4
    
    else if (self.BasicObjectPassed.poles == 1) {
        
        //For Stage 1 R
        if(self.BasicObjectPassed.R1 >= 1e9) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R1/1e9)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e6) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R1/1e6)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e3) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R1/1e3)];
        }
        
        else {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R1)];
        }
        
        // For Stage 2 R
        
        if(self.BasicObjectPassed.R2 >= 1e9) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R2/1e9)];
        }
        
        else if(self.BasicObjectPassed.R2 >= 1e6) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R2/1e6)];
        }
        
        else if(self.BasicObjectPassed.R2 >= 1e3) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R2/1e3)];
        }
        
        else {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R2)];
        }
        
        
        // For Stage 3 R
        
        self.Stage3RLabel.text = @"N/A";
        [self.Stage3RLabel setAlpha:0.6];
        
        
        // For Stage 1 RA
        
        if(self.BasicObjectPassed.RA1 >= 1e9) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e6) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e3) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA1/1e3)];
        }
        
        else {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA1)];
        }
        
        // For Stage 2 RA
        
        if(self.BasicObjectPassed.RA2 >= 1e9) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA2/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA2 >= 1e6) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA2/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA2 >= 1e3) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA2/1e3)];
        }
        
        else {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA2)];
        }
        
        
        // For Stage 3 RA
        
        self.Stage3RALabel.text = @"N/A";
        [self.Stage3RALabel setAlpha:0.6];
        
        
        // For Stage 1 RB
        
        if(self.BasicObjectPassed.RB1 >= 1e9) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e6) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e3) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB1/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB1)];
        }
        
        // For Stage 2 RB
        
        if(self.BasicObjectPassed.RB2 >= 1e9) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB2/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB2 >= 1e6) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB2/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB2 >= 1e3) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB2/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB2)];
        }
        
        // For Stage 3 RB
        
        self.Stage3RBLabel.text = @"N/A";
        [self.Stage3RBLabel setAlpha:0.6];
        
        
        // For Stage 1 C
        
        if(self.BasicObjectPassed.C1 >= 1e-6) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C1/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C1 >= 1e-9) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C1/1e-9)];
        }
        
        else {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C1/1e-12)];
        }
        
        // For Stage 2 C
        
        if(self.BasicObjectPassed.C2 >= 1e-6) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C2/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C2 >= 1e-9) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C2/1e-9)];
        }
        
        else {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C2/1e-12)];
        }
        
        
        // For Stage 3 C
        
        self.Stage3CLabel.text = @"N/A";
        [self.Stage3CLabel setAlpha:0.6];
        
        
    }
    
    //For Poles - 2
    
    else {
        
        //For Stage 1 R
        if(self.BasicObjectPassed.R1 >= 1e9) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.BasicObjectPassed.R1/1e9)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e6) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.BasicObjectPassed.R1/1e6)];
        }
        
        else if(self.BasicObjectPassed.R1 >= 1e3) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.BasicObjectPassed.R1/1e3)];
        }
        
        else {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.BasicObjectPassed.R1)];
        }
        
        // For Stage 2 R
        
        self.Stage2RLabel.text =@"N/A";
        [self.Stage2RLabel setAlpha:0.6];
        
        
        // For Stage 3 R
        
        self.Stage3RLabel.text = @"N/A";
        [self.Stage3RLabel setAlpha:0.6];
        
        
        // For Stage 1 RA
        
        if(self.BasicObjectPassed.RA1 >= 1e9) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.BasicObjectPassed.RA1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e6) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.BasicObjectPassed.RA1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RA1 >= 1e3) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.BasicObjectPassed.RA1/1e3)];
        }
        
        else {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.BasicObjectPassed.RA1)];
        }
        
        // For Stage 2 RA
        
        self.Stage2RALabel.text = @"N/A";
        [self.Stage2RALabel setAlpha:0.6];
        
        // For Stage 3 RA
        
        self.Stage3RALabel.text = @"N/A";
        [self.Stage3RALabel setAlpha:0.6];
        
        
        // For Stage 1 RB
        
        if(self.BasicObjectPassed.RB1 >= 1e9) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.BasicObjectPassed.RB1/1e9)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e6) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.BasicObjectPassed.RB1/1e6)];
        }
        
        else if(self.BasicObjectPassed.RB1 >= 1e3) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.BasicObjectPassed.RB1/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.BasicObjectPassed.RB1)];
        }
        
        // For Stage 2 RB
        
        self.Stage2RBLabel.text = @"N/A";
        [self.Stage2RBLabel setAlpha:0.6];
        // For Stage 3 RB
        
        self.Stage3RBLabel.text = @"N/A";
        [self.Stage3RBLabel setAlpha:0.6];
        
        
        // For Stage 1 C
        
        if(self.BasicObjectPassed.C1 >= 1e-6) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.BasicObjectPassed.C1/1e-6)];
        }
        
        else if(self.BasicObjectPassed.C1 >= 1e-9) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.BasicObjectPassed.C1/1e-9)];
        }
        
        else {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.BasicObjectPassed.C1/1e-12)];
        }
        
        // For Stage 2 C
        
        self.Stage2CLabel.text = @"N/A";
        [self.Stage2CLabel setAlpha:0.6];
        
        // For Stage 3 C
        
        self.Stage3CLabel.text = @"N/A";
        [self.Stage3CLabel setAlpha:0.6];
        
    }
};


-(void) displayCircuitDiagram {
    
    [self.ScrollView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.ScrollView.layer setCornerRadius:5.0];
    [self.ScrollView.layer setBorderWidth: 4.0];
    
    if (self.BasicObjectPassed.type == 0) {
        
        if(self.BasicObjectPassed.poles == 0) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 2 pole.png"];
        }
        
        else if(self.BasicObjectPassed.poles == 1) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 4 pole.png"];
        }
        
        else if(self.BasicObjectPassed.poles == 2) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 6 pole.png"];
        }
    }
    
    else if(self.BasicObjectPassed.type == 1) {
        
        
        if(self.BasicObjectPassed.poles == 0) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 2 pole.png"];
        }
        
        else if(self.BasicObjectPassed.poles == 1) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 4 pole.png"];
        }
        
        else if(self.BasicObjectPassed.poles == 2) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 6 pole.png"];
        }
    }
};

-(void) displayResponseDiagram {
  
    [self.ResponseScrollView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.ResponseScrollView.layer setCornerRadius:5.0];
    [self.ResponseScrollView.layer setBorderWidth: 4.0];
    
    
    if(self.BasicObjectPassed.type == 0) {
        
        if(self.BasicObjectPassed.characteristics == 0) {
            self.ResponseDiagram.image = [UIImage imageNamed:@"butterworth low pass.png"];
        }
        else if(self.BasicObjectPassed.characteristics == 1) {
            self.ResponseDiagram.image = [UIImage imageNamed:@"chebyshev low pass.png"];
        }
    }
    
    else if(self.BasicObjectPassed.type == 1) {
        
        if(self.BasicObjectPassed.characteristics == 0) {
            self.ResponseDiagram.image = [UIImage imageNamed:@"butterworth high pass.png"];
        }
        else if (self.BasicObjectPassed.characteristics == 1) {
            self.ResponseDiagram.image = [UIImage imageNamed:@"chebyshev high pass.png"];
        }
    }
};

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.CircuitDiagram;
    return self.ResponseDiagram;
    
};

- (IBAction)PanAndZoomInfo:(UIButton *)sender {
    
    UIAlertController *textFieldLimitAlert = [UIAlertController alertControllerWithTitle:@"Pan & Zoom" message:@"The user can use the 'Pinch To Zoom' gesture to zoom into the circuit diagram and use a single touch to pan around the circuit diagram." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [textFieldLimitAlert addAction:ok];
    
    [self presentViewController:textFieldLimitAlert animated:YES completion:nil];
}


@end
