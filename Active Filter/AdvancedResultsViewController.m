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

@end
