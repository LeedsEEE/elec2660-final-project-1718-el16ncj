//
//  AdvancedModeViewController.h
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvancedDataModel.h"

@interface AdvancedModeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) AdvancedDataModel *AdvancedObject;

@property (weak, nonatomic) IBOutlet UIPickerView *FilterType;
@property (weak, nonatomic) IBOutlet UIPickerView *FilterCharacteristics;
@property (weak, nonatomic) IBOutlet UIPickerView *Ripple;
@property (weak, nonatomic) IBOutlet UIPickerView *Poles;

@property (weak, nonatomic) IBOutlet UITextField *Stage1R;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage1RMultiplier;
@property (weak, nonatomic) IBOutlet UITextField *Stage1C;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage1CMultiplier;
@property (weak, nonatomic) IBOutlet UITextField *Stage2R;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage2RMultiplier;
@property (weak, nonatomic) IBOutlet UITextField *Stage2C;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage2CMultiplier;
@property (weak, nonatomic) IBOutlet UITextField *Stage3R;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage3RMultiplier;
@property (weak, nonatomic) IBOutlet UITextField *Stage3C;
@property (weak, nonatomic) IBOutlet UIPickerView *Stage3CMultiplier;

- (IBAction)CalcButton:(UIButton *)sender;


@end
