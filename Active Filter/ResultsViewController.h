//
//  ResultsViewController.h
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ResultsViewController : UIViewController

@property (strong, nonatomic) DataModel *BasicObjectPassed;

@property (weak, nonatomic) IBOutlet UILabel *FilterTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ResValLabel;
@property (weak, nonatomic) IBOutlet UILabel *CapValLabel;
@property (weak, nonatomic) IBOutlet UILabel *GainResValLabel;

-(void) setLabel;
@end
