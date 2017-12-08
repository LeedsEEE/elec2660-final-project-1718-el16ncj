//
//  AdvancedDataModel.m
//  Active Filter
//
//  Created by Noel Julian on 05/12/2017.
//  Copyright © 2017 Noel Julian. All rights reserved.
//

#import "AdvancedDataModel.h"

@implementation AdvancedDataModel

//Determine the gain depending on different parameters
-(void) det_g {
    //Determine the value of gains for a Butterworth Filter
    
    if(self.characteristics == 0) {
    
        //For 2 poles
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
    
     //Determine the Values of gain for a Chebyshev (0.5 ripple)
    else if(self.characteristics == 1 && self.ripple == 0) {
       
        //For 2 Poles
        if(self.poles == 0) {
            self.g1 = 1.842;
            self.g2 = 0;
            self.g3 = 0;
        }
        
        //For 4 Poles
        else if (self.poles == 1) {
            self.g1 = 1.582;
            self.g2 = 2.660;
            self.g3 = 0;
        }
        
        //For 6 Poles
        else if (self.poles == 2) {
            self.g1 = 1.537;
            self.g2 = 2.448;
            self.g3 = 2.846;
        }
    }
    
    //Determine the Values of gain for a Chebyshev (2 ripple)
    else if(self.characteristics == 1 && self.ripple == 1) {
        
        //For 2 Poles
        if(self.poles == 0) {
            self.g1 = 2.114;
            self.g2 = 0;
            self.g3 = 0;
        }
        
        //For 4 Poles
        else if (self.poles == 1) {
            self.g1 = 1.924;
            self.g2 = 2.782;
            self.g3 = 0;
        }
        
        //For 6 Poles
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
    
    
      //Determine the normalising factor for Butterworth
    else {
        
        self.nf1 = 1;
        self.nf2 = 1;
        self.nf3 = 1;
        
    }
    
};

//Calculate gain resistor values;
-(void) calc_gain_Res_val {
    
    self.RA1 = self.RB1 * (self.g1 - 1);
    self.RA2 = self.RB2* (self.g2 - 1);
    self.RA3 = self.RB3 * (self.g3 - 1);
    
};

-(void) calc_Res_Cap_val {
    
    //Stage 1 resistor value
    
    if (self.R1M == 2) {
        self.R1 = self.R1T * 1e6;
    }
    
    else if (self.R1M == 1) {
        self.R1 = self.R1T * 1e3;
    }
    
    else {
        self.R1 = self.R1T;
    }

    //Stage 2 resistor value
    
    if (self.R2M == 2) {
        self.R2 = self.R2T * 1e6;
    }
    
    else if (self.R2M == 1) {
        self.R2 = self.R2T * 1e3;
    }
    
    else {
        self.R2 = self.R2T;
    }

    //Stage 3 resistor value
    
    if (self.R3M == 2) {
        self.R3 = self.R3T * 1e6;
    }
    
    else if (self.R3M == 1) {
        self.R3 = self.R3T * 1e3;
    }
    
    else {
        self.R3 = self.R3T;
    }

    //Stage 1 capacitor value

    if (self.C1M == 2) {
        self.C1 = self.C1T * 1e-12;
    }
    else if (self.C1M == 1) {
        self.C1 = self.C1T * 1e-9;
    }
    else {
        self.C1 = self.C1T * 1e-6;
    }
    
    //Stage 2 capacitor value
    
    if (self.C2M == 2) {
        self.C2 = self.C2T * 1e-12;
    }
    else if (self.C2M == 1) {
        self.C2 = self.C2T * 1e-9;
    }
    else {
        self.C2 = self.C2T * 1e-6;
    }
    
    //Stage 3 capacitor value
    
    if (self.C3M == 2) {
        self.C3 = self.C3T * 1e-12;
    }
    else if (self.C3M == 1) {
        self.C3 = self.C3T * 1e-9;
    }
    else {
        self.C3 = self.C3T * 1e-6;
    }
};

//Method fo calculating correct gain value
-(void) calc_freq {
    
    self.freq1 = 1.0/(2.0 * 3.14 * self.R1 * self.C1);
    self.freq2 = 1.0/(2.0 * 3.14 * self.R2 * self.C2);
    self.freq3 = 1.0/(2.0 * 3.14 * self.R3 * self.C3);
    
};


@end
