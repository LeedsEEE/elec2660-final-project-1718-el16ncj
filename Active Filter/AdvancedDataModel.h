//
//  AdvancedDataModel.h
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvancedDataModel : NSObject

//Properties of the class

//To determine the type of filter (Low Pass, High Pass)
@property int type;

//To determine the filter characteristics (Butterworth, Chebyshev)
@property int characteristics;

//To determine the number of poles (2, 4, 6)
@property int poles;

//To determine the ripple of the filter (0.5 dB, 2 dB)
@property int ripple;

//To determine the resistor and capacitor multiplier

@property int R1M, R2M, R3M;
@property int C1M, C2M, C3M;

//To determine the UItextField intial frequency and the final frequency
@property float freq1, freq2, freq3;


//To determine the normalising factors
@property float nf1, nf2, nf3;

//To determine the gain setting and filtering component values
@property float R1T, R2T, R3T, R1, R2, R3, RA1, RB1, RA2, RB2, RA3, RB3;
@property float C1T, C2T, C3T, C1, C2, C3;

//To determine the gain of the filter
@property float g1, g2, g3;

//Methods of the class

//Method to determine the gain required for a specific circuit
-(void) det_g;

//Method to determine the normalising factor for a specific circuit
-(void) det_cn;

//Method to calculate the final frequency
-(void) calc_freq;

//Method to determine the final calculated values
-(void) calc_Res_Cap_val;
-(void) calc_gain_Res_val;

@end
