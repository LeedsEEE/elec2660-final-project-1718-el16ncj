//
//  BasicModeViewController.m
//  Active Filter
//
//  Created by Noel Julian on 02/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "BasicModeViewController.h"

@interface BasicModeViewController ()

@end

@implementation BasicModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.BasicObject = [[BasicDataModel alloc] init];
    
    self.FilterType.dataSource = self;
    self.FilterType.delegate = self;
    
    self.FilterCharacteristics.dataSource = self;
    self.FilterCharacteristics.delegate = self;
    
    self.Ripple.dataSource = self;
    self.Ripple.delegate = self;
    
    self.Poles.dataSource = self;
    self.Poles.delegate = self;
    
    self.Frequency.dataSource = self;
    self.Frequency.delegate = self;
    
    self.CutOff.delegate = self;
    
    [self.Ripple setUserInteractionEnabled:NO];
    [self.Ripple setAlpha:0.6];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
};

- (NSInteger)pickerView:(UIPickerView *)pickerView
            numberOfRowsInComponent:(NSInteger)component {
    
    if([pickerView isEqual:self.FilterType] || [pickerView isEqual:self.FilterCharacteristics] || [pickerView isEqual:self.Ripple]) {
        
        return 2;
    }
    
    else if([pickerView isEqual:self.Poles]) {
        
        return 3;
    }
    
    else if ([pickerView isEqual:self.Frequency]) {
        
        return 4;
    }

    else {
        
        return 0;
    }
};

#pragma mark = Delegate

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
            forComponent:(NSInteger)component
           reusingView:(UIView *)view {

    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        pickerLabel.textColor = [UIColor whiteColor];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    if([pickerView isEqual:self.FilterType]) {
        
        if(row == 0) {
            pickerLabel.text = @"Low-Pass Filter";
        }
        else {
            
            pickerLabel.text = @"High-Pass Filter";
        }
    }
    
    else if([pickerView isEqual:self.FilterCharacteristics]) {
        
        if(row == 0) {
            pickerLabel.text = @"Butterworth";
        }
        else {
            pickerLabel.text = @"Chebyshev";
        }
    }
    
    else if([pickerView isEqual:self.Ripple]) {
        
        if(row == 0) {
            pickerLabel.text = @"0.5dB";
        }
        else {
            pickerLabel.text = @"2dB";
        }
    }
    
    else if ([pickerView isEqual:self.Poles]) {
        
        if(row == 0) {
            pickerLabel.text = @"2 Poles";
        }
        else if (row == 1) {
            pickerLabel.text = @"4 Poles";
        }
        else {
            pickerLabel.text = @"6 Poles";
        }
    }

    else if ([pickerView isEqual:self.Frequency]) {
        
        if(row == 0) {
            pickerLabel.text = @"Hz";
        }
        else if (row == 1) {
            pickerLabel.text = @"kHz";
        }
        else if (row == 2) {
            pickerLabel.text = @"MHz";
        }
        else {
            pickerLabel.text = @"GHz";
        }

    }
    return pickerLabel;
};

- (void)pickerView:(UIPickerView *)pickerView
                    didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    self.BasicObject.type = (int)[self.FilterType selectedRowInComponent:0];
    self.BasicObject.characteristics = (int)[self.FilterCharacteristics selectedRowInComponent:0];
    self.BasicObject.ripple = (int)[self.Ripple selectedRowInComponent:0];
    self.BasicObject.poles = (int)[self.Poles selectedRowInComponent:0];
    self.BasicObject.freq2 = (int)[self.Frequency selectedRowInComponent:0];

    if([self.FilterCharacteristics selectedRowInComponent:0] == 0) {
        [self.Ripple setUserInteractionEnabled:NO];
        [self.Ripple setAlpha:0.6];
        }
    
    else {
        [self.Ripple setUserInteractionEnabled:YES];
        [self.Ripple setAlpha:1];
        }

};

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if([[segue identifier] isEqualToString:@"BasicCalc"]) {
        
        BasicResultsViewController *destinationViewController = [segue destinationViewController];
        
        destinationViewController.BasicObjectPassed = self.BasicObject;
    }
}


- (IBAction)CalcButton:(UIButton *)sender {
    
    self.BasicObject.freq1 = [self.CutOff.text floatValue];
    (void)self.BasicObject.det_g;
    (void)self.BasicObject.det_cn;
    (void)self.BasicObject.calc_freq;
    (void)self.BasicObject.calc_values;
};

@end
