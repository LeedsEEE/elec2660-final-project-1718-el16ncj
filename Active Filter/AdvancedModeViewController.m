//
//  AdvancedModeViewController.m
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "AdvancedModeViewController.h"

@interface AdvancedModeViewController ()

@end

@implementation AdvancedModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.AdvancedObject = [[AdvancedDataModel alloc] init];
    
    self.AdvancedObject.RB1 = 10e3;
    self.AdvancedObject.RB2 = 10e3;
    self.AdvancedObject.RB3 = 10e3;
    
    self.FilterType.dataSource = self;
    self.FilterType.delegate = self;
    
    self.FilterCharacteristics.dataSource = self;
    self.FilterCharacteristics.delegate = self;
    
    self.Ripple.dataSource = self;
    self.Ripple.delegate = self;
    
    self.Poles.dataSource = self;
    self.Poles.delegate = self;
    
    self.Stage1RMultiplier.dataSource = self;
    self.Stage1RMultiplier.delegate = self;
    
    self.Stage1CMultiplier.dataSource = self;
    self.Stage1CMultiplier.delegate = self;
    
    self.Stage2RMultiplier.dataSource = self;
    self.Stage2RMultiplier.delegate = self;
    
    self.Stage2CMultiplier.dataSource = self;
    self.Stage2CMultiplier.delegate = self;
    
    self.Stage3RMultiplier.dataSource = self;
    self.Stage3RMultiplier.delegate = self;
    
    self.Stage3CMultiplier.dataSource = self;
    self.Stage3CMultiplier.delegate = self;
    
    self.Stage1R.delegate = self;
    self.Stage1C.delegate = self;
    self.Stage2R.delegate = self;
    self.Stage2C.delegate = self;
    self.Stage3R.delegate = self;
    self.Stage3C.delegate = self;

    [self.Ripple setUserInteractionEnabled:NO];
    [self.Ripple setAlpha:0.6];
    
    [self.Stage2R setUserInteractionEnabled:NO];
    [self.Stage2R setAlpha:0.6];
    [self.Stage2RMultiplier setUserInteractionEnabled:NO];
    [self.Stage2RMultiplier setAlpha:0.6];
    [self.Stage3R setUserInteractionEnabled:NO];
    [self.Stage3R setAlpha:0.6];
    [self.Stage3RMultiplier setUserInteractionEnabled:NO];
    [self.Stage3RMultiplier setAlpha:0.6];
    
    [self.Stage2C setUserInteractionEnabled:NO];
    [self.Stage2C setAlpha:0.6];
    [self.Stage2CMultiplier setUserInteractionEnabled:NO];
    [self.Stage2CMultiplier setAlpha:0.6];
    [self.Stage3C setUserInteractionEnabled:NO];
    [self.Stage3C setAlpha:0.6];
    [self.Stage3CMultiplier setUserInteractionEnabled:NO];
    [self.Stage3CMultiplier setAlpha:0.6];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
};

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    if([pickerView isEqual:self.FilterType]||[pickerView isEqual:self.FilterCharacteristics]||[pickerView isEqual:self.Ripple]) {
        
        return 2;
    }
    
    else if([pickerView isEqual:self.Poles]) {
        
        return 3;
    }
    
    else if([pickerView isEqual:self.Stage1RMultiplier] ||[pickerView isEqual:self.Stage2RMultiplier] ||[pickerView isEqual:self.Stage3RMultiplier]) {
        
        return 4;
    }
    
    else if([pickerView isEqual:self.Stage1CMultiplier] ||[pickerView isEqual:self.Stage2CMultiplier] ||[pickerView isEqual:self.Stage3CMultiplier]) {
        
        return 3;
    }
    
    else {
        
        return 0;
    }
};

#pragma mark - Delegate

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
    
    else if ([pickerView isEqual:self.Stage1RMultiplier]||[pickerView isEqual:self.Stage2RMultiplier]||[pickerView isEqual:self.Stage3RMultiplier]) {
        
        if(row == 0) {
            pickerLabel.text = @"Ω";
        }
        else if(row == 1) {
            pickerLabel.text = @"kΩ";
        }
        else if(row == 2) {
            pickerLabel.text = @"MΩ";
        }
         else {
            pickerLabel.text = @"GΩ";
        }
    }
    
    else if ([pickerView isEqual:self.Stage1CMultiplier]||[pickerView isEqual:self.Stage2CMultiplier]||[pickerView isEqual:self.Stage3CMultiplier]) {
        
        if(row == 0) {
            pickerLabel.text = @"µF";
        }
        else if(row == 1) {
            pickerLabel.text = @"nF";
        }
        else {
            pickerLabel.text = @"pF";
        }
    }

    return pickerLabel;
};

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if([self.FilterCharacteristics selectedRowInComponent:0] == 0) {
        
        [self.Ripple setUserInteractionEnabled:NO];
        [self.Ripple setAlpha:0.6];
        
    }
    
    else {
        
        [self.Ripple setUserInteractionEnabled:YES];
        [self.Ripple setAlpha:1];

        
    }
    
    if([self.Poles selectedRowInComponent:0] == 0) {
        
        [self.Stage2R setUserInteractionEnabled:NO];
        [self.Stage2R setAlpha:0.6];
        [self.Stage2RMultiplier setUserInteractionEnabled:NO];
        [self.Stage2RMultiplier setAlpha:0.6];
        [self.Stage3R setUserInteractionEnabled:NO];
        [self.Stage3R setAlpha:0.6];
        [self.Stage3RMultiplier setUserInteractionEnabled:NO];
        [self.Stage3RMultiplier setAlpha:0.6];

        [self.Stage2C setUserInteractionEnabled:NO];
        [self.Stage2C setAlpha:0.6];
        [self.Stage2CMultiplier setUserInteractionEnabled:NO];
        [self.Stage2CMultiplier setAlpha:0.6];
        [self.Stage3C setUserInteractionEnabled:NO];
        [self.Stage3C setAlpha:0.6];
        [self.Stage3CMultiplier setUserInteractionEnabled:NO];
        [self.Stage3CMultiplier setAlpha:0.6];
    }
    
    else if([self.Poles selectedRowInComponent:0] == 1) {
        
        [self.Stage2R setUserInteractionEnabled:YES];
        [self.Stage2R setAlpha:1.0];
        [self.Stage2RMultiplier setUserInteractionEnabled:YES];
        [self.Stage2RMultiplier setAlpha:1.0];
        [self.Stage3R setUserInteractionEnabled:NO];
        [self.Stage3R setAlpha:0.6];
        [self.Stage3RMultiplier setUserInteractionEnabled:NO];
        [self.Stage3RMultiplier setAlpha:0.6];
        
        [self.Stage2C setUserInteractionEnabled:YES];
        [self.Stage2C setAlpha:1.0];
        [self.Stage2CMultiplier setUserInteractionEnabled:YES];
        [self.Stage2CMultiplier setAlpha:1.0];
        [self.Stage3C setUserInteractionEnabled:NO];
        [self.Stage3C setAlpha:0.6];
        [self.Stage3CMultiplier setUserInteractionEnabled:NO];
        [self.Stage3CMultiplier setAlpha:0.6];
    }
    
    else if([self.Poles selectedRowInComponent:0] == 2) {
        
        [self.Stage2R setUserInteractionEnabled:YES];
        [self.Stage2R setAlpha:1.0];
        [self.Stage2RMultiplier setUserInteractionEnabled:YES];
        [self.Stage2RMultiplier setAlpha:1.0];
        [self.Stage3R setUserInteractionEnabled:YES];
        [self.Stage3R setAlpha:1.0];
        [self.Stage3RMultiplier setUserInteractionEnabled:YES];
        [self.Stage3RMultiplier setAlpha:1.0];
        
        [self.Stage2C setUserInteractionEnabled:YES];
        [self.Stage2C setAlpha:1.0];
        [self.Stage2CMultiplier setUserInteractionEnabled:YES];
        [self.Stage2CMultiplier setAlpha:1.0];
        [self.Stage3C setUserInteractionEnabled:YES];
        [self.Stage3C setAlpha:1.0];
        [self.Stage3CMultiplier setUserInteractionEnabled:YES];
        [self.Stage3CMultiplier setAlpha:1.0];
    }

    
    self.AdvancedObject.type = (int)[self.FilterType selectedRowInComponent:0];
    self.AdvancedObject.characteristics = (int)[self.FilterCharacteristics selectedRowInComponent:0];
    self.AdvancedObject.ripple = (int)[self.Ripple selectedRowInComponent:0];
    self.AdvancedObject.poles = (int)[self.Poles selectedRowInComponent:0];
    
    self.AdvancedObject.R1M = (int)[self.Stage1RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C1M = (int)[self.Stage1CMultiplier selectedRowInComponent:0];
    self.AdvancedObject.R2M = (int)[self.Stage2RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C2M = (int)[self.Stage2CMultiplier selectedRowInComponent:0];
    self.AdvancedObject.R3M = (int)[self.Stage3RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C3M = (int)[self.Stage3CMultiplier selectedRowInComponent:0];
};


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"AdvancedCalc"]) {
        
        AdvancedResultsViewController *destinationViewController = [segue destinationViewController];
        
        destinationViewController.AdvancedObjectPassed = self.AdvancedObject;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)CalcButton:(UIButton *)sender {
    
    self.AdvancedObject.R1T = [self.Stage1R.text floatValue];
    self.AdvancedObject.C1T = [self.Stage1C.text floatValue];
    self.AdvancedObject.R2T = [self.Stage2R.text floatValue];
    self.AdvancedObject.C2T = [self.Stage2C.text floatValue];
    self.AdvancedObject.R3T = [self.Stage3R.text floatValue];
    self.AdvancedObject.C3T = [self.Stage3C.text floatValue];
    
    (void)self.AdvancedObject.det_g;
    (void)self.AdvancedObject.det_cn;
    (void)self.AdvancedObject.calc_gain_Res_val;
    (void)self.AdvancedObject.calc_Res_Cap_val;
    (void)self.AdvancedObject.calc_freq;
};


@end
