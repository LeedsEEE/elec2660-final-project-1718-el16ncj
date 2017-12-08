            //
//  BasicDataModel.h
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicDataModel : NSObject

//Properties of the class

//To determine the type of filter (Low Pass, High Pass)
@property int type;

//To determine the filter characteristics (Butterworth, Chebyshev)
@property int characteristics;

//To determine the number of poles (2, 4, 6)
@property int poles;

//To determine the ripple of the filter (0.5 dB, 2 dB)
@property int ripple;

//To determine the frequency multiplier (Hz, kHz, MHz)
@property int freq2;

//To determine the UItextField intial frequency and the final frequency
@property float freq1, freqf;

//To determine the normalising factors
@property float nf1, nf2, nf3;

//To determine the gain setting and filtering component values
@property float R1, R2, R3, RA1, RB1, RA2, RB2, RA3, RB3;
@property float C1, C2, C3;

//To determine the gain of the filter
@property float g1, g2, g3;


//Methods of the class

//Method to calculate the final frequency
-(void) calc_freq;

//Method to determine the gain required for a specific circuit
-(void) det_g;

//Method to determine the normalising factor for a specific circuit
-(void) det_cn;

//Method to determine the final calculated values
-(void) calc_values;

@end
