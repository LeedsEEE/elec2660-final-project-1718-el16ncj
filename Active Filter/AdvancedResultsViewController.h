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

-(void) setFilterLabelVal;
-(void) displayCircuitDiagram;

@end
