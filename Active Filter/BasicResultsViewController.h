//
//  BasicResultsViewController.h
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicDataModel.h"

@interface BasicResultsViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) BasicDataModel *BasicObjectPassed;

@property (weak, nonatomic) IBOutlet UILabel *FilterTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ResValLabel;
@property (weak, nonatomic) IBOutlet UILabel *CapValLabel;
@property (weak, nonatomic) IBOutlet UILabel *GainResValLabel;
@property (weak, nonatomic) IBOutlet UIImageView *CircuitDiagram;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;



-(void) setLabel;
-(void) displayCircuitDiagram;
@end
