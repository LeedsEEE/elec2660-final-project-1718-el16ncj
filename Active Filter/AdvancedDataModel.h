//
//  AdvancedDataModel.h
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvancedDataModel : NSObject

@property int type;
@property int characteristics;
@property int poles;
@property int ripple;
@property int R1M, R2M, R3M;
@property int C1M, C2M, C3M;

@property float freq1, freq2, freq3;
@property float nf1, nf2, nf3;
@property float R1T, R2T, R3T, R1, R2, R3, RA1, RB1, RA2, RB2, RA3, RB3;
@property float C1T, C2T, C3T, C1, C2, C3;
@property float g1, g2, g3;

-(void) det_g;
-(void) det_cn;
-(void) calc_freq;
-(void) calc_Res_Cap_val;
-(void) calc_gain_Res_val;

@end
