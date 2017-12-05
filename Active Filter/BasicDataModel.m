//
//  BasicDataModel.m
//  Active Filter
//
//  Created by Noel Julian on 03/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "BasicDataModel.h"

@implementation BasicDataModel

//Calculate the frequency provided by the user.
-(void) calc_freq {
    if(self.freq2 == 0) {
        self.freqf = self.freq1;
    }
    else if(self.freq2 == 1) {
        self.freqf = self.freq1 * 1000.0;
    }
    else if(self.freq2 == 2) {
        self.freqf = self.freq1 * 1000000.0;
    }
    else if (self.freq2 == 3) {
        self.freqf = self.freq1 * 1000000000.0;
    }
    else {
        self.freqf = 0;
    }
};

//Determine the gain depending on different parameters
-(void) det_g {
    //Determine the value of gains for a Butterworth Filter
        //For 2 poles
    if(self.characteristics == 0) {
       
        if(self.poles == 0) {
            self.g1 = 1.586;
            self.g2 = 0;
            self.g3 = 0;
        }
        //For 4 poles
        else if (self.poles == 1) {
            self.g1 = 1.152;
            self.g2 = 2.325;
            self.g3 = 0;
        }
        //For 6 poles
        else if (self.poles == 2) {
            self.g1 = 1.068;
            self.g2 = 1.586;
            self.g3 = 2.483;
        }
    }
    
    else if(self.characteristics == 1 && self.ripple == 0) {
    //Determine the Values of gain for a Chebyshev (0.5 ripple)
        if(self.poles == 0) {
            self.g1 = 1.842;
            self.g2 = 0;
            self.g3 = 0;
        }
        else if (self.poles == 1) {
            self.g1 = 1.582;
            self.g2 = 2.660;
            self.g3 = 0;
        }
        else if (self.poles == 2) {
            self.g1 = 1.537;
            self.g2 = 2.448;
            self.g3 = 2.846;
        }
    }
    else if(self.characteristics == 1 && self.ripple == 1) {
        if(self.poles == 0) {
            self.g1 = 2.114;
            self.g2 = 0;
            self.g3 = 0;
        }
        else if (self.poles == 1) {
            self.g1 = 1.924;
            self.g2 = 2.782;
            self.g3 = 0;
        }
        else if (self.poles == 2) {
            self.g1 = 1.891;
            self.g2 = 2.648;
            self.g3 = 2.904;
        }
    }
};
    
-(void) det_cn {
    //Determine the normalising factor for low-pass Chebyshev (0.5 ripple)
    if(self.characteristics == 1 && self.ripple == 0) {
    
        if (self.type == 0 && self.poles == 0) {
            self.nf1 = 1.231;
            self.nf2 = 0;
            self.nf3 = 0;
        }
        else if(self.type == 0 && self.poles == 1) {
            self.nf1 = 0.597;
            self.nf2 = 1.031;
            self.nf3 = 0;
        }
        else if(self.type == 0 && self.poles == 2) {
            self.nf1 = 0.396;
            self.nf2 = 0.768;
            self.nf3 = 1.011;
        }
    
        else if(self.type == 1 && self.poles == 0) {
            self.nf1 = 0.812;
            self.nf2 = 0;
            self.nf3 = 0;
        }
        else if (self.type == 1 && self.poles == 1) {
            self.nf1 = 1.675;
            self.nf2 = 0.970;
            self.nf3 = 0;
        }
        else if(self.type == 1 && self.poles == 2) {
            self.nf1 = 2.525;
            self.nf2 = 1.302;
            self.nf3 = 0.989;
        }
    }
    //Determine the normalising factor for low-pass Chebyshev (2 ripple)
    else if (self.characteristics == 1 && self.ripple == 1) {
            
        if (self.type == 0 && self.poles == 0) {
            self.nf1 = 0.907;
            self.nf2 = 0;
            self.nf3 = 0;
        }
        else if(self.type == 0 && self.poles == 1) {
            self.nf1 = 0.471;
            self.nf2 = 0.964;
            self.nf3 = 0;
        }
        else if(self.type == 0 && self.poles == 2) {
            self.nf1 = 0.316;
            self.nf2 = 0.730;
            self.nf3 = 0.983;
        }
        
        else if(self.type == 1 && self.poles == 0) {
            self.nf1 = 1.103;
            self.nf2 = 0;;
            self.nf3 = 0;
        }
        else if (self.type == 1 && self.poles == 1) {
            self.nf1 = 2.123;
            self.nf2 = 1.037;
            self.nf3 = 0;
        }
        else if(self.type == 1 && self.poles == 2) {
            self.nf1 = 3.165;
            self.nf2 = 1.370;
            self.nf3 = 1.107;
        }
    }

    else {
    
        self.nf1 = 1;
        self.nf2 = 1;
        self.nf3 = 1;
        
    }
    
};

-(void) calc_values {
 
    self.R1 = 1.0/(2.0 * 3.14 * self.freqf * self.C1 * self.nf1);
    self.R2 = 1.0/(2.0 * 3.14 * self.freqf * self.C2 * self.nf2);
    self.R3 = 1.0/(2.0 * 3.14 * self.freqf * self.C3 * self.nf3);
    
    self.RA1 = self.RB1 * (self.g1 - 1);
    self.RA2 = self.RB2* (self.g2 - 1);
    self.RA3 = self.RB3 * (self.g3 - 1);
    
};

@end
