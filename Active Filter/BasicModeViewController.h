//
//  BasicModeViewController.h
//  Active Filter
//
//  Created by Noel Julian on 02/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicDataModel.h"
#import "BasicResultsViewController.h"

@interface BasicModeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *FilterType;
@property (weak, nonatomic) IBOutlet UIPickerView *FilterCharacteristics;
@property (weak, nonatomic) IBOutlet UIPickerView *Ripple;
@property (weak, nonatomic) IBOutlet UIPickerView *Poles;
@property (weak, nonatomic) IBOutlet UITextField *CutOff;
@property (weak, nonatomic) IBOutlet UIPickerView *Frequency;

@property (strong, nonatomic) BasicDataModel *BasicObject;

- (IBAction)CalcButton:(UIButton *)sender;

- (IBAction)HideKeyboard:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
