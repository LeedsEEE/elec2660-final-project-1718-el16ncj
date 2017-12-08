//
//  AdvancedModeViewController.h
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvancedDataModel.h" //Advanced object data model header file
#import "AdvancedResultsViewController.h" //Importing Advanced results view controller to pass information from the current view to the results view

@interface AdvancedModeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>

//Properties of the class

//Object declared of the type AdvancedDataModel
@property (strong, nonatomic) AdvancedDataModel *AdvancedObject;

//PickerView for selecting the filter type (Low pass filter, high pass filter
@property (weak, nonatomic) IBOutlet UIPickerView *FilterType;

//PickerView for selecting the filter characteristics (Butterworth, Chebyshev)
@property (weak, nonatomic) IBOutlet UIPickerView *FilterCharacteristics;

//PickerView for selecting the ripple (0.5dB, 2 dB)
@property (weak, nonatomic) IBOutlet UIPickerView *Ripple;

 //PickerView for selecting the number of poles (2, 4, 6)
@property (weak, nonatomic) IBOutlet UIPickerView *Poles;

//TextField for entering the first filtering resistor value
@property (weak, nonatomic) IBOutlet UITextField *Stage1R;

//PickerView for selecting the first filtering resistor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage1RMultiplier;

//TextField for entering the first filtering capacitor value
@property (weak, nonatomic) IBOutlet UITextField *Stage1C;

//PickerView for selecting the first filtering capacitor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage1CMultiplier;

//TextField for entering the second the filtering resistor value
@property (weak, nonatomic) IBOutlet UITextField *Stage2R;

//PickerView for selecting the second filtering resistor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage2RMultiplier;

//TextField for entering the second filtering capacitoe value
@property (weak, nonatomic) IBOutlet UITextField *Stage2C;

//PickerView for selecting the second filtering capacitor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage2CMultiplier;

//TextField for entering the third filtering resistor value
@property (weak, nonatomic) IBOutlet UITextField *Stage3R;

//PickerView for selecting the third filtering resistor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage3RMultiplier;

//TextField for entering the third filtering capacitor value
@property (weak, nonatomic) IBOutlet UITextField *Stage3C;

//PickerView for selecting the third filtering capacitor multiplier
@property (weak, nonatomic) IBOutlet UIPickerView *Stage3CMultiplier;

//Scrolll view to display all the contents and to move the textfield up when the keyboard is active
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//Methods of the class

//Button to run the calculation functions of the object. Also acts as a segue link to the next view.
- (IBAction)CalcButton:(UIButton *)sender;

//Button to hide the keyboard once done editing the text field. Note: This button is in the background.
- (IBAction)HideKeyboard:(UIButton *)sender;

//Function to display warnings
-(void) displayWarning;

//Function to control when the warning is being displayed
-(void) warningControl;
@end
