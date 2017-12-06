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
    
    (void)self.setFilterLabelVal;
    
    self.ScrollView.minimumZoomScale = 1.0;
    self.ScrollView.maximumZoomScale = 6.0;
    self.ScrollView.contentSize = self.CircuitDiagram.frame.size;
    self.ScrollView.delegate = self;

    (void)self.displayCircuitDiagram;
    (void)self.setCalcLabelVal;
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
    
    if(self.AdvancedObjectPassed.poles == 0) {
        if(self.AdvancedObjectPassed.characteristics == 0) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 2-Pole Low-Pass Filter"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 2-Pole High-Pass Filter"];
            }
        }
        else if(self.AdvancedObjectPassed.characteristics == 1 && self.AdvancedObjectPassed.ripple == 0) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole Low-Pass Filter (0.5dB)"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole High-Pass Filter (0.5dB)"];
            }
        }
    
        else if(self.AdvancedObjectPassed.characteristics == 1 && self. AdvancedObjectPassed.ripple == 1) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole Low-Pass Filter (2dB)"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 2-Pole   High-Pass Filter (2dB)"];
            }
        }
    }
    
    else if(self.AdvancedObjectPassed.poles == 1) {
        
        if(self.AdvancedObjectPassed.characteristics == 0) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 4-Pole Low-Pass Filter"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 4-Pole High-Pass Filter"];
            }
        }
        else if(self.AdvancedObjectPassed.characteristics == 1 && self.AdvancedObjectPassed.ripple == 0) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole Low-Pass Filter (0.5dB)"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole High-Pass Filter (0.5dB)"];
            }
        }
        
        else if(self.AdvancedObjectPassed.characteristics == 1 && self. AdvancedObjectPassed.ripple == 1) {
            if(self.AdvancedObjectPassed.type == 0) {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole Low-Pass Filter (2dB)"];
            }
            else {
                self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 4-Pole   High-Pass Filter (2dB)"];
            }
        }

        else if(self.AdvancedObjectPassed.poles == 2) {
            
            if(self.AdvancedObjectPassed.characteristics == 0) {
                if(self.AdvancedObjectPassed.type == 0) {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 6-Pole Low-Pass Filter"];
                }
                else {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Butterworth 6-Pole High-Pass Filter"];
                }
            }
            else if(self.AdvancedObjectPassed.characteristics == 1 && self.AdvancedObjectPassed.ripple == 0) {
                if(self.AdvancedObjectPassed.type == 0) {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole Low-Pass Filter (0.5dB)"];
                }
                else {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole High-Pass Filter (0.5dB)"];
                }
            }
            
            else if(self.AdvancedObjectPassed.characteristics == 1 && self. AdvancedObjectPassed.ripple == 1) {
                if(self.AdvancedObjectPassed.type == 0) {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole Low-Pass Filter (2dB)"];
                }
                else {
                    self.FilterLabel.text = [NSString stringWithFormat:@"Chebyshev 6-Pole   High-Pass Filter (2dB)"];
                }
            }
        }
    }
}

-(void) displayCircuitDiagram {
    
    [self.ScrollView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.ScrollView.layer setCornerRadius:5.0];
    [self.ScrollView.layer setBorderWidth: 4.0];
    
    if (self.AdvancedObjectPassed.type == 0) {
        
        if(self.AdvancedObjectPassed.poles == 0) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 2 pole.png"];
        }
        
        else if(self.AdvancedObjectPassed.poles == 1) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 4 pole.png"];
        }
        
        else if(self.AdvancedObjectPassed.poles == 2) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"low-pass 6 pole.png"];
        }
    }
    
    else if(self.AdvancedObjectPassed.type == 1) {
        
        
        if(self.AdvancedObjectPassed.poles == 0) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 2 pole.png"];
        }
        
        else if(self.AdvancedObjectPassed.poles == 1) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 4 pole.png"];
        }
        
        else if(self.AdvancedObjectPassed.poles == 2) {
            self.CircuitDiagram.image = [UIImage imageNamed:@"high-pass 6 pole.png"];
        }
    }
};

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.CircuitDiagram;
    
};

- (void) setCalcLabelVal {
    
    if (self.AdvancedObjectPassed.poles == 2) {
        
    //For Stage 1 R
    if(self.AdvancedObjectPassed.R1 >= 1e9) {
        
        self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R1/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.R1 >= 1e6) {
        
         self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R1/1e6)];
    }
   
    else if(self.AdvancedObjectPassed.R1 >= 1e3) {
        
        self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R1/1e3)];
    }

    else {
        
        self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R1)];
    }
    
    // For Stage 2 R
    
    if(self.AdvancedObjectPassed.R2 >= 1e9) {
        
        self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R2/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.R2 >= 1e6) {
        
        self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R2/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.R2 >= 1e3) {
        
        self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R2/1e3)];
    }
    
    else {
        
        self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R2)];
    }

    
    // For Stage 3 R
    
    if(self.AdvancedObjectPassed.R3 >= 1e9) {
        
        self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R3/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.R3 >= 1e6) {
        
        self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R3/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.R3 >= 1e3) {
        
        self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R3/1e3)];
    }
    
    else {
        
        self.Stage3RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R3)];
    }

   // For Stage 1 RA
    
    if(self.AdvancedObjectPassed.RA1 >= 1e9) {
        
        self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA1/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RA1 >= 1e6) {
        
        self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA1/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RA1 >= 1e3) {
        
        self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA1/1e3)];
    }
    
    else {
        
        self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA1)];
    }

    // For Stage 2 RA
    
    if(self.AdvancedObjectPassed.RA2 >= 1e9) {
        
        self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA2/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RA2 >= 1e6) {
        
        self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA2/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RA2 >= 1e3) {
        
        self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA2/1e3)];
    }
    
    else {
        
        self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA2)];
    }

    
    // For Stage 3 RA
    
    if(self.AdvancedObjectPassed.RA3 >= 1e9) {
        
        self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA3/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RA3 >= 1e6) {
        
        self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA3/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RA3 >= 1e3) {
        
        self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA3/1e3)];
    }
    
    else {
        
        self.Stage3RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA3)];
    }

    // For Stage 1 RB
    
    if(self.AdvancedObjectPassed.RB1 >= 1e9) {
        
        self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB1/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RB1 >= 1e6) {
        
        self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB1/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RB1 >= 1e3) {
        
        self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB1/1e3)];
    }
    
    else {
        
        self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB1)];
    }
    
    // For Stage 2 RB
    
    if(self.AdvancedObjectPassed.RB2 >= 1e9) {
        
        self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB2/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RB2 >= 1e6) {
        
        self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB2/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RB2 >= 1e3) {
        
        self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB2/1e3)];
    }
    
    else {
        
        self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB2)];
    }
    
    // For Stage 3 RB
    
    if(self.AdvancedObjectPassed.RB3 >= 1e9) {
        
        self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB3/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.RB3 >= 1e6) {
        
        self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB3/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.RB3 >= 1e3) {
        
        self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB3/1e3)];
    }
    
    else {
        
        self.Stage3RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB3)];
    }

    // For Stage 1 C
    
    if(self.AdvancedObjectPassed.C1 >= 1e-6) {
        
        self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C1/1e-6)];
    }
    
    else if(self.AdvancedObjectPassed.C1 >= 1e-9) {
        
        self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C1/1e-9)];
    }
    
    else {
        
        self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C1/1e-12)];
    }

    // For Stage 2 C
    
    if(self.AdvancedObjectPassed.C2 >= 1e-6) {
        
        self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C2/1e-6)];
    }
    
    else if(self.AdvancedObjectPassed.C2 >= 1e-9) {
        
        self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C2/1e-9)];
    }
    
    else {
        
        self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C2/1e-12)];
    }

    
    // For Stage 3 C
    
    if(self.AdvancedObjectPassed.C3 >= 1e-6) {
        
        self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C3/1e-6)];
    }
    
    else if(self.AdvancedObjectPassed.C3 >= 1e-9) {
        
        self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C3/1e-9)];
    }
    
    else {
        
        self.Stage3CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C3/1e-12)];
    }

    // For Stage 1 F
    
    if(self.AdvancedObjectPassed.freq1 >= 1e9) {
        
        self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq1/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.freq1 >= 1e6) {
        
        self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq1/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.freq1 >= 1e3) {
        
        self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq1/1e3)];
    }
    
    else {
        
        self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq1)];
    }

    // For Stage 2 F
    
    if(self.AdvancedObjectPassed.freq2 >= 1e9) {
        
        self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq2/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.freq2 >= 1e6) {
        
        self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq2/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.freq2 >= 1e3) {
        
        self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq2/1e3)];
    }
    
    else {
        
        self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq2)];
    }

    // For Stage 3 F
    
    if(self.AdvancedObjectPassed.freq3 >= 1e9) {
        
        self.Stage3FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq3/1e9)];
    }
    
    else if(self.AdvancedObjectPassed.freq3 >= 1e6) {
        
        self.Stage3FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq3/1e6)];
    }
    
    else if(self.AdvancedObjectPassed.freq3 >= 1e3) {
        
        self.Stage3FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq3/1e3)];
    }
    
    else {
        
        self.Stage3FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq3)];
    }
    }
    
    //FOr Poles - 4
    
    else if (self.AdvancedObjectPassed.poles == 1) {
        
        //For Stage 1 R
        if(self.AdvancedObjectPassed.R1 >= 1e9) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.R1 >= 1e6) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.R1 >= 1e3) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R1/1e3)];
        }
        
        else {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R1)];
        }
        
        // For Stage 2 R
        
        if(self.AdvancedObjectPassed.R2 >= 1e9) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R2/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.R2 >= 1e6) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R2/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.R2 >= 1e3) {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R2/1e3)];
        }
        
        else {
            
            self.Stage2RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R2)];
        }
        
        
        // For Stage 3 R
            
        self.Stage3RLabel.text = @"N/A";
        [self.Stage3RLabel setAlpha:0.6];

        
        // For Stage 1 RA
        
        if(self.AdvancedObjectPassed.RA1 >= 1e9) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RA1 >= 1e6) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RA1 >= 1e3) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA1/1e3)];
        }
        
        else {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA1)];
        }
        
        // For Stage 2 RA
        
        if(self.AdvancedObjectPassed.RA2 >= 1e9) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA2/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RA2 >= 1e6) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA2/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RA2 >= 1e3) {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA2/1e3)];
        }
        
        else {
            
            self.Stage2RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA2)];
        }
        
        
        // For Stage 3 RA
        
        self.Stage3RALabel.text = @"N/A";
        [self.Stage3RALabel setAlpha:0.6];

        
        // For Stage 1 RB
        
        if(self.AdvancedObjectPassed.RB1 >= 1e9) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RB1 >= 1e6) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RB1 >= 1e3) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB1/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB1)];
        }
        
        // For Stage 2 RB
        
        if(self.AdvancedObjectPassed.RB2 >= 1e9) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB2/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RB2 >= 1e6) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB2/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RB2 >= 1e3) {
            
            self.Stage2RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB2/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB2)];
        }
        
        // For Stage 3 RB
            
            self.Stage3RBLabel.text = @"N/A";
            [self.Stage3RBLabel setAlpha:0.6];

        
        // For Stage 1 C
        
        if(self.AdvancedObjectPassed.C1 >= 1e-6) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C1/1e-6)];
        }
        
        else if(self.AdvancedObjectPassed.C1 >= 1e-9) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C1/1e-9)];
        }
        
        else {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C1/1e-12)];
        }
        
        // For Stage 2 C
        
        if(self.AdvancedObjectPassed.C2 >= 1e-6) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C2/1e-6)];
        }
        
        else if(self.AdvancedObjectPassed.C2 >= 1e-9) {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C2/1e-9)];
        }
        
        else {
            
            self.Stage2CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C2/1e-12)];
        }
        
        
        // For Stage 3 C
        
            self.Stage3CLabel.text = @"N/A";
            [self.Stage3CLabel setAlpha:0.6];

        
        // For Stage 1 F
        
        if(self.AdvancedObjectPassed.freq1 >= 1e9) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.freq1 >= 1e6) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.freq1 >= 1e3) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq1/1e3)];
        }
        
        else {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq1)];
        }
        
        // For Stage 2 F
        
        if(self.AdvancedObjectPassed.freq2 >= 1e9) {
            
            self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq2/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.freq2 >= 1e6) {
            
            self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq2/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.freq2 >= 1e3) {
            
            self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq2/1e3)];
        }
        
        else {
            
            self.Stage2FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq2)];
        }
        
        // For Stage 3 F
        
            self.Stage3FLabel.text = @"N/A";
            [self.Stage3FLabel setAlpha:0.6];
    }
    
    //For Poles - 2
    
    else {
        
        //For Stage 1 R
        if(self.AdvancedObjectPassed.R1 >= 1e9) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f GΩ", (self.AdvancedObjectPassed.R1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.R1 >= 1e6) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f MΩ", (self.AdvancedObjectPassed.R1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.R1 >= 1e3) {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f kΩ", (self.AdvancedObjectPassed.R1/1e3)];
        }
        
        else {
            
            self.Stage1RLabel.text = [NSString stringWithFormat:@"R = %.2f Ω", (self.AdvancedObjectPassed.R1)];
        }
        
        // For Stage 2 R
        
            self.Stage2RLabel.text =@"N/A";
            [self.Stage2RLabel setAlpha:0.6];
        
        
        // For Stage 3 R
        
            self.Stage3RLabel.text = @"N/A";
            [self.Stage3RLabel setAlpha:0.6];
        
        
        // For Stage 1 RA
        
        if(self.AdvancedObjectPassed.RA1 >= 1e9) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f GΩ", (self.AdvancedObjectPassed.RA1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RA1 >= 1e6) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f MΩ", (self.AdvancedObjectPassed.RA1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RA1 >= 1e3) {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f kΩ", (self.AdvancedObjectPassed.RA1/1e3)];
        }
        
        else {
            
            self.Stage1RALabel.text = [NSString stringWithFormat:@"RA = %.2f Ω", (self.AdvancedObjectPassed.RA1)];
        }
        
        // For Stage 2 RA
        
            self.Stage2RALabel.text = @"N/A";
            [self.Stage2RALabel setAlpha:0.6];
        
        // For Stage 3 RA
        
            self.Stage3RALabel.text = @"N/A";
            [self.Stage3RALabel setAlpha:0.6];
        
        
        // For Stage 1 RB
        
        if(self.AdvancedObjectPassed.RB1 >= 1e9) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f GΩ", (self.AdvancedObjectPassed.RB1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.RB1 >= 1e6) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f MΩ", (self.AdvancedObjectPassed.RB1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.RB1 >= 1e3) {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f kΩ", (self.AdvancedObjectPassed.RB1/1e3)];
        }
        
        else {
            
            self.Stage1RBLabel.text = [NSString stringWithFormat:@"RB = %.2f Ω", (self.AdvancedObjectPassed.RB1)];
        }
        
        // For Stage 2 RB

        self.Stage2RBLabel.text = @"N/A";
        [self.Stage2RBLabel setAlpha:0.6];
        // For Stage 3 RB
        
        self.Stage3RBLabel.text = @"N/A";
        [self.Stage3RBLabel setAlpha:0.6];
        
        
        // For Stage 1 C
        
        if(self.AdvancedObjectPassed.C1 >= 1e-6) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f µF", (self.AdvancedObjectPassed.C1/1e-6)];
        }
        
        else if(self.AdvancedObjectPassed.C1 >= 1e-9) {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f nF", (self.AdvancedObjectPassed.C1/1e-9)];
        }
        
        else {
            
            self.Stage1CLabel.text = [NSString stringWithFormat:@"C = %.2f pF", (self.AdvancedObjectPassed.C1/1e-12)];
        }
        
        // For Stage 2 C
        
        self.Stage2CLabel.text = @"N/A";
        [self.Stage2CLabel setAlpha:0.6];
        
        // For Stage 3 C
        
        self.Stage3CLabel.text = @"N/A";
        [self.Stage3CLabel setAlpha:0.6];
        
        
        // For Stage 1 F
        
        if(self.AdvancedObjectPassed.freq1 >= 1e9) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f GHz", (self.AdvancedObjectPassed.freq1/1e9)];
        }
        
        else if(self.AdvancedObjectPassed.freq1 >= 1e6) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f MHz", (self.AdvancedObjectPassed.freq1/1e6)];
        }
        
        else if(self.AdvancedObjectPassed.freq1 >= 1e3) {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f kHz", (self.AdvancedObjectPassed.freq1/1e3)];
        }
        
        else {
            
            self.Stage1FLabel.text = [NSString stringWithFormat:@"Fc = %.2f Hz", (self.AdvancedObjectPassed.freq1)];
        }
        
        // For Stage 2 F

        self.Stage2FLabel.text = @"N/A";
        [self.Stage2FLabel setAlpha:0.6];
        
        // For Stage 3 F
        
        self.Stage3FLabel.text = @"N/A";
        [self.Stage3FLabel setAlpha:0.6];
    }
};

@end
