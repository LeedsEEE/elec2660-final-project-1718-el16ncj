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
    
    //Initialising the Advanced Object
    self.AdvancedObject = [[AdvancedDataModel alloc] init];
    
    //Assigning default values for one of the gain resistors in each stage of the object
    self.AdvancedObject.RB1 = 10e3;
    self.AdvancedObject.RB2 = 10e3;
    self.AdvancedObject.RB3 = 10e3;
    
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
    
    //Setting the data source and delegate as the view controller for the picker Stage1RMultiplier
    self.Stage1RMultiplier.dataSource = self;
    self.Stage1RMultiplier.delegate = self;

    //Setting the data source and delegate as the view controller for the picker Stage1CMultiplier
    self.Stage1CMultiplier.dataSource = self;
    self.Stage1CMultiplier.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Stage2RMultiplier
    self.Stage2RMultiplier.dataSource = self;
    self.Stage2RMultiplier.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Stage2CMultiplier
    self.Stage2CMultiplier.dataSource = self;
    self.Stage2CMultiplier.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Stage3RMultiplier
    self.Stage3RMultiplier.dataSource = self;
    self.Stage3RMultiplier.delegate = self;
    
    //Setting the data source and delegate as the view controller for the picker Stage3CMultiplier
    self.Stage3CMultiplier.dataSource = self;
    self.Stage3CMultiplier.delegate = self;
    
    //Setting delegate as the view controller for the scrollView
    self.scrollView.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage1R
    self.Stage1R.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage1C
    self.Stage1C.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage2R
    self.Stage2R.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage2C
    self.Stage2C.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage3R
    self.Stage3R.delegate = self;
    
    //Setting the delegate as the view controller for the text Stage3C
    self.Stage3C.delegate = self;

    
    //*****************************************************************************************
    //source: https://stackoverflow.com/questions/2377692/disable-uipickerview
    
    //Disabling user interaction for the picker Ripple on load up.
    [self.Ripple setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Ripple setAlpha:0.6];
    
    
    //Disabling user interaction for the textfield Stage2R on load up.
    [self.Stage2R setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the textfield Stage2R on load up.
    [self.Stage2R setAlpha:0.6];
    
    //Disabling user interaction for the picker Stage2RMultiplier on load up.
    [self.Stage2RMultiplier setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Stage2RMultiplier setAlpha:0.6];
    
    //Disabling user interaction for the textfield Stage3R on load up.
    [self.Stage3R setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the textfield Stage3R on load up.
    [self.Stage3R setAlpha:0.6];
    
    //Disabling user interaction for the picker Stage3RMultiplier on load up.
    [self.Stage3RMultiplier setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Stage3RMultiplier setAlpha:0.6];
    
    
    //Disabling user interaction for the textfield Stage2C on load up.
    [self.Stage2C setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the textfield Stage2C on load up.
    [self.Stage2C setAlpha:0.6];
    
    //Disabling user interaction for the picker Stage2CMultiplier on load up.
    [self.Stage2CMultiplier setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Stage2CMultiplier setAlpha:0.6];
    
    //Disabling user interaction for the textfield Stage3C on load up.
    [self.Stage3C setUserInteractionEnabled:NO];

    //Decreasing opacity for the textfield Stage3C on load up.
    [self.Stage3C setAlpha:0.6];
    
    //Disabling user interaction for the picker Stage3CMultiplier on load up.
    [self.Stage3CMultiplier setUserInteractionEnabled:NO];
    
    //Decreasing opacity for the picker Ripple on load up.
    [self.Stage3CMultiplier setAlpha:0.6];
    
    //*****************************************************************************************
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*********************************************************************************************
//Source: Apple Documentation and API Reference


#pragma mark - DataSource

//Data source method to determine the number of columns in the picker view.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
};

//Data source method to determine the number of rows in the picker.

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    //Returning appropriate number of rows according to the picker selected.
    if([pickerView isEqual:self.FilterType]||[pickerView isEqual:self.FilterCharacteristics]||[pickerView isEqual:self.Ripple]) {
        
        return 2;
    }
    
    else if([pickerView isEqual:self.Poles]) {
        
        return 3;
    }
    
    else if([pickerView isEqual:self.Stage1RMultiplier] ||[pickerView isEqual:self.Stage2RMultiplier] ||[pickerView isEqual:self.Stage3RMultiplier]) {
        
        return 3;
    }
    
    else if([pickerView isEqual:self.Stage1CMultiplier] ||[pickerView isEqual:self.Stage2CMultiplier] ||[pickerView isEqual:self.Stage3CMultiplier]) {
        
        return 3;
    }
    
    else {
        
        return 0;
    }
};

#pragma mark - Delegate

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
        
        //Setiing the label text alignment
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
    
    else if ([pickerView isEqual:self.Stage1RMultiplier]||[pickerView isEqual:self.Stage2RMultiplier]||[pickerView isEqual:self.Stage3RMultiplier]) {
        
        if(row == 0) {
            pickerLabel.text = @"Ω";
        }
        else if(row == 1) {
            pickerLabel.text = @"kΩ";
        }
        else {
            pickerLabel.text = @"MΩ";
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
    
    //Returns the label value to the delegate function
    return pickerLabel;
};

//Delegate method to perform an action when the user interacts with the pickers
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
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
    
    //if number of poles is 2
    if([self.Poles selectedRowInComponent:0] == 0) {
        
        //Disable user interaction for textfield Stage2R
        [self.Stage2R setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage2R
        [self.Stage2R setAlpha:0.6];
        
        //Disable user interaction for the picker Stage2RMultiplier
        [self.Stage2RMultiplier setUserInteractionEnabled:NO];
        
        //Reduce the opacity of the picker Stage2RMultiplier
        [self.Stage2RMultiplier setAlpha:0.6];
        
        //Disable user interaction for the textfield Stage3R
        [self.Stage3R setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage3R
        [self.Stage3R setAlpha:0.6];
        
        //Disable user interaction of picker Stage3RMultiplier
        [self.Stage3RMultiplier setUserInteractionEnabled:NO];
        
        //Reduce opacity of the picker Stage3RMultiplier
        [self.Stage3RMultiplier setAlpha:0.6];

        //Disable user interaction of the textfield Stage2C
        [self.Stage2C setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage2C
        [self.Stage2C setAlpha:0.6];
        
        //Disable user interaction of the picker Stage2CMultiplier
        [self.Stage2CMultiplier setUserInteractionEnabled:NO];
        
        //Reduce opacity of the picker Stage2CMultiplier
        [self.Stage2CMultiplier setAlpha:0.6];
        
        //Disable user interaction of the textfield Stage3C
        [self.Stage3C setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage 3C
        [self.Stage3C setAlpha:0.6];
        
        //Disable user interaction of the picker Stage3CMultiplier
        [self.Stage3CMultiplier setUserInteractionEnabled:NO];
        
        //Reduce opacity of the the picker Stage3CMultiplier
        [self.Stage3CMultiplier setAlpha:0.6];
    }
    
    //if number of poles is 4
    else if([self.Poles selectedRowInComponent:0] == 1) {
        
        //Enable user interaction for textfield Stage2R
        [self.Stage2R setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage2R
        [self.Stage2R setAlpha:1.0];
        
        //Enable user interaction for the picker Stage2RMultiplier
        [self.Stage2RMultiplier setUserInteractionEnabled:YES];
        
        //Increase the opacity of the picker Stage2RMultiplier
        [self.Stage2RMultiplier setAlpha:1.0];
        
        //Disable user interaction for the textfield Stage3R
        [self.Stage3R setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage3R
        [self.Stage3R setAlpha:0.6];
        
        //Disable user interaction of picker Stage3RMultiplier
        [self.Stage3RMultiplier setUserInteractionEnabled:NO];
       
        //Reduce opacity of the picker Stage3RMultiplier
        [self.Stage3RMultiplier setAlpha:0.6];
        
        //Enable user interaction for the textfield Stage2C
        [self.Stage2C setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage2C
        [self.Stage2C setAlpha:1.0];
        
        //Enable user interaction for the picker Stage2CMultiplier
        [self.Stage2CMultiplier setUserInteractionEnabled:YES];
        
        //Increase opacity of the picker Stage2CMultiplier
        [self.Stage2CMultiplier setAlpha:1.0];
        
        //Disable user interaction of the textfield Stage3C
        [self.Stage3C setUserInteractionEnabled:NO];
        
        //Reduce opacity of the textfield Stage3C
        [self.Stage3C setAlpha:0.6];
        
        //Disable user interaction for the picker Stage3CMultiplier
        [self.Stage3CMultiplier setUserInteractionEnabled:NO];
        
        //Reduce opacity of the picker Stage3CMultiplier
        [self.Stage3CMultiplier setAlpha:0.6];
    }
    
    else if([self.Poles selectedRowInComponent:0] == 2) {
        
        //Enable user interaction for textfield Stage2R
        [self.Stage2R setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage2R
        [self.Stage2R setAlpha:1.0];
        
        //Enable user interaction for the picker Stage2RMultiplier
        [self.Stage2RMultiplier setUserInteractionEnabled:YES];
        
        //Increase the opacity of the picker Stage2RMultiplier
        [self.Stage2RMultiplier setAlpha:1.0];
        
        //Enable user interaction for the textfield Stage3R
        [self.Stage3R setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage3R
        [self.Stage3R setAlpha:1.0];
        
         //Enable user interaction of picker Stage3RMultiplier
        [self.Stage3RMultiplier setUserInteractionEnabled:YES];
        
        //Increase opacity of the picker Stage3RMultiplier
        [self.Stage3RMultiplier setAlpha:1.0];
        
        //Enable user interaction for the textfield Stage2C
        [self.Stage2C setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage2C
        [self.Stage2C setAlpha:1.0];
        
        //Enable user interaction for the picker Stage2CMultiplier
        [self.Stage2CMultiplier setUserInteractionEnabled:YES];
        
        //Increase opacity of the picker Stage2CMultiplier
        [self.Stage2CMultiplier setAlpha:1.0];
        
        //Enable user interaction of the textfield Stage3C
        [self.Stage3C setUserInteractionEnabled:YES];
        
        //Increase opacity of the textfield Stage3C
        [self.Stage3C setAlpha:1.0];
        
        //Enable user interaction for the picker Stage3CMultiplier
        [self.Stage3CMultiplier setUserInteractionEnabled:YES];
        
         //Increase opacity of the picker Stage3CMultiplier
        [self.Stage3CMultiplier setAlpha:1.0];
    }
    //************************************************************************************
    
    
    //Assigns the row number of the picker Filter Type to Advanced Object's type property
    self.AdvancedObject.type = (int)[self.FilterType selectedRowInComponent:0];
    
    
    //Assigns the row number of the picker Filter Characteristics to Advanced Object's characteristics property
    self.AdvancedObject.characteristics = (int)[self.FilterCharacteristics selectedRowInComponent:0];
    
    //Assigns the row number of the picker Ripple to Advanced Object's ripple property
    self.AdvancedObject.ripple = (int)[self.Ripple selectedRowInComponent:0];
    
    
    //Assigns the row number of the picker Poles to Advanced Object's poles property
    self.AdvancedObject.poles = (int)[self.Poles selectedRowInComponent:0];
    
    //Assign the row number of the respective multiplier poles to the Advanced Object's properties of multipliers
    self.AdvancedObject.R1M = (int)[self.Stage1RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C1M = (int)[self.Stage1CMultiplier selectedRowInComponent:0];
    self.AdvancedObject.R2M = (int)[self.Stage2RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C2M = (int)[self.Stage2CMultiplier selectedRowInComponent:0];
    self.AdvancedObject.R3M = (int)[self.Stage3RMultiplier selectedRowInComponent:0];
    self.AdvancedObject.C3M = (int)[self.Stage3CMultiplier selectedRowInComponent:0];
};


#pragma mark - Navigation

//prepareForSegue method allows passing of data from one view to another


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Checking if the selected segue is the right one
    if([[segue identifier] isEqualToString:@"AdvancedCalc"]) {
        
        //Setting the Advanced Result View and the destination where the information needs to be passed to
        AdvancedResultsViewController *destinationViewController = [segue destinationViewController];
        
         //Assigning values of the local advanced object to the advanced object present in the destination view controller
        destinationViewController.AdvancedObjectPassed = self.AdvancedObject;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Keyboard Notifications

//*********************************************************************************************
//Source 1: Apple Documentation and API reference
//Source 2: https://www.youtube.com/watch?v=VuiPGJOEBH4&t=252s

//The function detects when the text field is being edited
-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
    if(self.Stage1R == textField || self.Stage1C == textField) {
        
        //Create a CG point
        CGPoint scrollPoint = CGPointMake(0,450);
        
        //Set the sroll view offest to the CG point declared above
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
    
    else if(self.Stage2R == textField || self.Stage2C == textField) {
        
        //Create a CG point
        CGPoint scrollPoint = CGPointMake(0,550);
        
        //Set the sroll view offest to the CG point declared above
      [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
    
    else if(self.Stage3R == textField || self.Stage3C == textField) {
        
        //Create a CG point
        CGPoint scrollPoint = CGPointMake(0,650);
        
        //Set the sroll view offest to the CG point declared above
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
    else {
        
        //Create a CG point
        CGPoint scrollPoint = CGPointMake(0,0);
        
        //Set the sroll view offest to the CG point declared above
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

//The function detects when the text field is finished being edited
-(void) textFieldDidEndEditing:(UITextField *)textField {
    
    
    //Create a CG Point
    CGPoint scrollPoint = CGPointMake(0,435);
    
    //Set the scroll view offset to the CG point declared above
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

//This button hides the keyboard when pressed on. Note: The button is hidden in the background so the user can press it anywhere outside the keyboard.
- (IBAction)HideKeyboard:(UIButton *)sender {
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage1R.isFirstResponder) {
        [[self Stage1R] resignFirstResponder];
    }
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage2R.isFirstResponder) {
        [[self Stage2R] resignFirstResponder];
    }
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage3R.isFirstResponder) {
        [[self Stage3R] resignFirstResponder];
    }
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage1C.isFirstResponder) {
        [[self Stage1C] resignFirstResponder];
    }
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage2C.isFirstResponder) {
        [[self Stage2C] resignFirstResponder];
    }
    
    //Resign the textfield from being the firstResonder if it is the firstResponder
    if(self.Stage3C.isFirstResponder) {
        [[self Stage3C] resignFirstResponder];
    }
};


//This button runs the calculation methods for the basic object and also acts as a segue action to move to the next view

- (IBAction)CalcButton:(UIButton *)sender {
    
    //*********************************************************************************
    //Source: https://stackoverflow.com/questions/14249055/uitextfield-to-float
    
    //Converts the UITextField value into a float
    self.AdvancedObject.R1T = [self.Stage1R.text floatValue];
   
    //Converts the UITextField value into a float
    self.AdvancedObject.C1T = [self.Stage1C.text floatValue];
    
    //Converts the UITextField value into a float
    self.AdvancedObject.R2T = [self.Stage2R.text floatValue];
    
    //Converts the UITextField value into a float
    self.AdvancedObject.C2T = [self.Stage2C.text floatValue];
    
    //Converts the UITextField value into a float
    self.AdvancedObject.R3T = [self.Stage3R.text floatValue];
    
    //Converts the UITextField value into a float
    self.AdvancedObject.C3T = [self.Stage3C.text floatValue];

    //*********************************************************************************
    
    //Advanced object method called to calculate the gains
    (void)self.AdvancedObject.det_g;
    
    //Advanced object method called to calculate the normalising factors
    (void)self.AdvancedObject.det_cn;
    
    //Advanced object method called to calculate the gain component values
    (void)self.AdvancedObject.calc_gain_Res_val;
    
    //Advanced object method called to calculate the filtering component values
    (void)self.AdvancedObject.calc_Res_Cap_val;
    
    //Advanced object method called to calculate the final cut off frequency values
    (void)self.AdvancedObject.calc_freq;
    
    //Method called to display appropriate warnings
    (void)self.warningControl;
};



#pragma mark - Warnings and Limitations


//*********************************************************************************************
//Source: http://nshipster.com/uialertcontroller/

//Method to display a warning pop-up if the text field is left blank or a 0 has been entered


-(void) displayWarning {
    
    UIAlertController *textFieldLimitAlert = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"Entering '0' or leaving any one of the resistor or capacitor fields blank (unless disabled) is an invalid input!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [textFieldLimitAlert addAction:ok];
    
    [self presentViewController:textFieldLimitAlert animated:YES completion:nil];
}

//*********************************************************************************************


//Method to control the warnings according to situation
-(void) warningControl {
    
    //For 2 poles
    if(self.AdvancedObject.poles == 0) {
        if(self.AdvancedObject.R1T == 0||self.AdvancedObject.C1T==0) {
            (void)self.displayWarning;
        }
    }
    
    //For 4 poles
    else if(self.AdvancedObject.poles == 1) {
        if(self.AdvancedObject.R1T == 0||self.AdvancedObject.C1T==0||self.AdvancedObject.R2T == 0||self.AdvancedObject.C2T==0) {
            (void)self.displayWarning;
        }
    }
    
    //For 6 poles
    else if(self.AdvancedObject.R1T == 0||self.AdvancedObject.C1T==0||self.AdvancedObject.R2T == 0||self.AdvancedObject.C2T==0||self.AdvancedObject.R3T == 0||self.AdvancedObject.C3T==0) {
        (void)self.displayWarning;
    }
}


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
