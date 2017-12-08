//
//  AdvancedResultsViewController.h
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvancedDataModel.h"


@interface AdvancedResultsViewController : UIViewController <UIScrollViewDelegate>

//Properties of the class

//Object declared of type AdvancedDataModel
@property (strong, nonatomic) AdvancedDataModel *AdvancedObjectPassed;

//UILabel for displaying the filter heading
@property (weak, nonatomic) IBOutlet UILabel *FilterLabel;

//UIScrollView to enable pan and zoom functionality for the circuit diagram
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

//UIImageView to display the circuit diagram
@property (weak, nonatomic) IBOutlet UIImageView *CircuitDiagram;

//UIImageView to display the characteristics response graph
@property (weak, nonatomic) IBOutlet UIImageView *ResponseDiagram;

//UIScrollView to enable pan and zoom functionality for the characteristics responses.
@property (weak, nonatomic) IBOutlet UIScrollView *ResponseScrollView;

//UILabels to display the gain setting and filtering component values for stage 1

@property (weak, nonatomic) IBOutlet UILabel *Stage1RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1FLabel;

//UILabels to display the gain setting and filtering component values for stage 2

@property (weak, nonatomic) IBOutlet UILabel *Stage2RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2FLabel;

//UILabels to display the gain setting and filtering component values for stage 3

@property (weak, nonatomic) IBOutlet UILabel *Stage3RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3FLabel;

//Methods of the class

//Button to show the user a pop-up info for panning and zooming into the circuit diagram
- (IBAction)PanAndZoomInfo:(UIButton *)sender;

//Function to display the correct filter type
-(void) setFilterLabelVal;

//Function to display the correct circuit diagram
-(void) displayCircuitDiagram;

//Function to display the correct calculated gain setting and filtering component values
-(void) setCalcLabelVal;

//Function to display the correct characteristics response graph
-(void) displayResponseDiagram;

@end
