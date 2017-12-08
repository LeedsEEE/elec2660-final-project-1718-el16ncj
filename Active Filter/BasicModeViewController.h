//
//  BasicModeViewController.h
//  Active Filter
//
//  Created by Noel Julian on 02/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicDataModel.h" //Basic object data model header file
#import "BasicResultsViewController.h" //Importing Basic results view controller to pass information from the current view to the results view.

@interface BasicModeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>

//Properties of the class

//PickerView for selecting the filter type (Low pass filter, high pass filter)
@property (weak, nonatomic) IBOutlet UIPickerView *FilterType;

//PickerView for selecting the filter characteristics (Butterworth, Chebyshev)
@property (weak, nonatomic) IBOutlet UIPickerView *FilterCharacteristics;

//PickerView for selecting the ripple (0.5dB, 2 dB)
@property (weak, nonatomic) IBOutlet UIPickerView *Ripple;

 //PickerView for selecting the number of poles (2, 4, 6)
@property (weak, nonatomic) IBOutlet UIPickerView *Poles;

//TextField for inputting the frequency by using the decimal pad
@property (weak, nonatomic) IBOutlet UITextField *CutOff;

//PickerView for selecting the frequency multiplier (Hz, kHz, MHz)
@property (weak, nonatomic) IBOutlet UIPickerView *Frequency;

//Object declared of the type BasicDataModel
@property (strong, nonatomic) BasicDataModel *BasicObject;

//Scroll View to move the textfield up when keyboard is active.
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//Methods of the class

//Button to run the calculation functions of the object. Also acts as a segue link to the next view.
- (IBAction)CalcButton:(UIButton *)sender;

//Button to hide the keyboard once done editing the text field. Note: This button is in the background.
- (IBAction)HideKeyboard:(UIButton *)sender;



//Function to display warnings
-(void) displayWarning;

@end
