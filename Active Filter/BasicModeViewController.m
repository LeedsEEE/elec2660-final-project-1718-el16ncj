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
    
    //Initialising the Basic Object
    self.BasicObject = [[BasicDataModel alloc] init];
    
    //Setting the data source and delegate as the view controller for the picker FilterType
    self.FilterType.dataSource = self;
    self.FilterType.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker FilterCharacteristics
    self.FilterCharacteristics.dataSource = self;
    self.FilterCharacteristics.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Ripple
    self.Ripple.dataSource = self;
    self.Ripple.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Poles
    self.Poles.dataSource = self;
    self.Poles.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Frequency
    self.Frequency.dataSource = self;
    self.Frequency.delegate = self;
    
    //Setting the delegate as the view controller for the text field CutOff
    self.CutOff.delegate = self;
    
    //*****************************************************************************************
    //source: https://stackoverflow.com/questions/2377692/disable-uipickerview
    
    //Disabling user interaction for the picker Ripple on load up.
    [self.Ripple setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Ripple setAlpha:0.6];
    //*****************************************************************************************
    
    //Assigning default values for the capacitor values of the object
    self.BasicObject.C1 = 10e-9;
    self.BasicObject.C2 = 10e-9;
    self.BasicObject.C3 = 10e-9;
    
    //Assigning default values for one of the gain resistors in each stage of the object
    self.BasicObject.RB1 = 10e3;
    self.BasicObject.RB2 = 10e3;
    self.BasicObject.RB3 = 10e3;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*********************************************************************************************
//Source: Apple Documentation and API Reference

#pragma mark - Data Source

//Data source method to determine the number of columns in the picker view.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
};


//Data source method to determine the number of rows in the picker.

- (NSInteger)pickerView:(UIPickerView *)pickerView
            numberOfRowsInComponent:(NSInteger)component {
    
    //Returning appropriate number of rows according to the picker selected.
    if([pickerView isEqual:self.FilterType] || [pickerView isEqual:self.FilterCharacteristics] || [pickerView isEqual:self.Ripple]) {
        
        return 2;
    }
    
    else if([pickerView isEqual:self.Poles] || [pickerView isEqual:self.Frequency]) {
        
        return 3;
    }
    
    else {
        
        return 0;
    }
};

#pragma mark = Delegate

//Delegate method to determine what is being displayed in the picker views.

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
            forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    
    //************************************************************************************
    //Source: https://stackoverflow.com/questions/7185440/how-to-change-the-font-size-in-uipickerview
    
    //Label declared to be return to the delegate to display the appropriate data.
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        
        //Initialising the label
        pickerLabel = [[UILabel alloc] init];
        
        //Setting the label font and text size
        pickerLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        
        //Setting the label font colour
        pickerLabel.textColor = [UIColor whiteColor];
        
        //Setting the label text alignment
        pickerLabel.textAlignment = NSTextAlignmentCenter;
    }
    //************************************************************************************
    
    
    //The following if else statements determine what text to return to the label based on the picker selected.
    
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
        else {
            pickerLabel.text = @"MHz";
        }
    }
    
    //Returns the label value to the delegate function
    return pickerLabel;
};


//Delegate method to perform an action when the user interacts with the pickers
- (void)pickerView:(UIPickerView *)pickerView
                    didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    //Assigns the row number of the picker Filter Type to Basic Object's type property
    self.BasicObject.type = (int)[self.FilterType selectedRowInComponent:0];
    
    //Assigns the row number of the picker Filter Characteristics to Basic Object's characteristics property
    self.BasicObject.characteristics = (int)[self.FilterCharacteristics selectedRowInComponent:0];
    
    //Assigns the row number of the picker Ripple to Basic Object's ripple property
    self.BasicObject.ripple = (int)[self.Ripple selectedRowInComponent:0];
    
    //Assigns the row number of the picker Poles to Basic Object's poles property
    self.BasicObject.poles = (int)[self.Poles selectedRowInComponent:0];
    
    //Assigns the row number of the picker Frequency to Basic Object's freq2 property
    self.BasicObject.freq2 = (int)[self.Frequency selectedRowInComponent:0];

    //************************************************************************************
    //source: https://stackoverflow.com/questions/2377692/disable-uipickerview
    
    //The following if else statements enable/disable certain pickers based on previous picker inputs
    
    //if filter characteristics chosen is butterworth:
    if([self.FilterCharacteristics selectedRowInComponent:0] == 0) {
        
        //Disable user interaction for the picker Ripple
        [self.Ripple setUserInteractionEnabled:NO];
        
        //Reduce the opacity of the picker Ripple
        [self.Ripple setAlpha:0.6];
        }
    
    //if filter characteristics chosen is Chebyshev
    else {
        
        //Enable user interaction for the picker Ripple
        [self.Ripple setUserInteractionEnabled:YES];
        
        //Increase the opacity of the picker Ripple
        [self.Ripple setAlpha:1];
        }
    //************************************************************************************
};

//*********************************************************************************************

#pragma mark - Navigation

//prepareForSegue method allows passing of data from one view to another

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    //Checking if the selected segue is the right one
    if([[segue identifier] isEqualToString:@"BasicCalc"]) {
        
        //Setting the Basic Result View and the destination where the information needs to be passed to
        BasicResultsViewController *destinationViewController = [segue destinationViewController];
        
        //Assigning values of the local basic object to the basic object present in the destination view controller
        destinationViewController.BasicObjectPassed = self.BasicObject;
    }
}


#pragma mark - Keyboard hiding and offset

//*********************************************************************************************
//Source 1: Apple Documentation and API reference
//Source 2: https://www.youtube.com/watch?v=VuiPGJOEBH4&t=252s

//The function detects when the text field is being edited
-(void) textFieldDidBeginEditing:(UITextField *)textField {
  
    //Create a CG point
    CGPoint scrollPoint = CGPointMake(0,210);
    
    //Set the sroll view offest to the CG point declared above
    [self.scrollView setContentOffset:scrollPoint animated:YES];

};

//The function detects when the text field is finished being edited
-(void) textFieldDidEndEditing:(UITextField *)textField {
    
    //Create a CG Point
    CGPoint scrollPoint = CGPointMake(0,0);
    
    //Set the scroll view offset to the CG point declared above
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

//This button hides the keyboard when pressed on. Note: The button is hidden in the background so the user can press it anywhere outside the keyboard.
- (IBAction)HideKeyboard:(UIButton *)sender {
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.CutOff.isFirstResponder) {
        [[self CutOff] resignFirstResponder];
    }
}
//*********************************************************************************************


//This button runs the calculation methods for the basic object and also acts as a segue action to move to the next view
- (IBAction)CalcButton:(UIButton *)sender {
    
    //*********************************************************************************
    //Source: https://stackoverflow.com/questions/14249055/uitextfield-to-float
    
    //Converts the UITextField value into a float
    self.BasicObject.freq1 = [self.CutOff.text floatValue];
    //*********************************************************************************
    
    //Basic object method called to calculate the gains
    (void)self.BasicObject.det_g;
    
    //Basic object method called to calculate the normalising factors
    (void)self.BasicObject.det_cn;
    
    //Basic object method called to calculate the final value of the frequency input
    (void)self.BasicObject.calc_freq;
    
    //Basic object method called to calculate the filtering component values
    (void)self.BasicObject.calc_values;
    
    if(self.BasicObject.freq1 == 0) {
        
        //Method to display a warning pop-up if the text field is left blank or a 0 has been entered
        (void)self.displayWarning;
    }
};

#pragma mark - Warnings and Limitations

//*********************************************************************************************
//Source: http://nshipster.com/uialertcontroller/

//Method to display a warning pop-up if the text field is left blank or a 0 has been entered

-(void) displayWarning {
    
    UIAlertController *textFieldLimitAlert = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"Entering '0' or leaving the Cut-off Frequency field blank is an invalid input!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [textFieldLimitAlert addAction:ok];
    
    [self presentViewController:textFieldLimitAlert animated:YES completion:nil];
};
//*********************************************************************************************


//*********************************************************************************************
//Source: https://stackoverflow.com/questions/433337/set-the-maximum-character-length-of-a-uitextfield

//Method to display a warning pop-up if the number of characters in the textfield exceed the maximum limit.

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    int maxCharLength = 5;
    
    if (textField.text.length >= maxCharLength && range.length == 0)
    {
        
        //*********************************************************************************
        //Source: http://nshipster.com/uialertcontroller/
        
        UIAlertController *textFieldLimitAlert = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"Maximum character limit of 5 reached! Please use the picker to input higher values." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
        
        [textFieldLimitAlert addAction:ok];
        
        [self presentViewController:textFieldLimitAlert animated:YES completion:nil];
        //*********************************************************************************
        
        return NO; // return NO to not change text

        }
    
    else {
        
        return YES;
    }
}
//*********************************************************************************************

@end
