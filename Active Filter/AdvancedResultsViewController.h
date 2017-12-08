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

@property (strong, nonatomic) AdvancedDataModel *AdvancedObjectPassed;

@property (weak, nonatomic) IBOutlet UILabel *FilterLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *CircuitDiagram;
@property (weak, nonatomic) IBOutlet UIImageView *ResponseDiagram;
@property (weak, nonatomic) IBOutlet UIScrollView *ResponseScrollView;

@property (weak, nonatomic) IBOutlet UILabel *Stage1RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage1FLabel;

@property (weak, nonatomic) IBOutlet UILabel *Stage2RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage2FLabel;

@property (weak, nonatomic) IBOutlet UILabel *Stage3RLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3CLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3RALabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3RBLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stage3FLabel;

- (IBAction)PanAndZoomInfo:(UIButton *)sender;

-(void) setFilterLabelVal;
-(void) displayCircuitDiagram;
-(void) setCalcLabelVal;
@end
