//
//  BasicModeViewController.h
//  Active Filter
//
//  Created by Noel Julian on 02/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicModeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *FilterType;
@property (weak, nonatomic) IBOutlet UIPickerView *FilterCharacteristics;
@property (weak, nonatomic) IBOutlet UIPickerView *Ripple;
@property (weak, nonatomic) IBOutlet UIPickerView *Poles;
@property (weak, nonatomic) IBOutlet UITextField *CutOff;
@property (weak, nonatomic) IBOutlet UIPickerView *Frequency;
@end
