//
//  BasicDataModel.h
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicDataModel : NSObject

@property int type;
@property int characteristics;
@property int poles;
@property int ripple;
@property int freq2;
@property float freq1, freqf;
@property float nf1, nf2, nf3;

@property float R1, R2, R3, RA1, RB1, RA2, RB2, RA3, RB3;
@property float C1, C2, C3;

@property float g1, g2, g3;

-(void) calc_freq;
-(void) det_g;
-(void) det_cn;
-(void) calc_values;

@end
