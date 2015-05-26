//
//  CustomUI.m
//  WeatherCast
//
//  Created by Prashant Ugale on 23/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import "CustomUI.h"

@implementation CustomUI


#pragma mark – Color codes

+(UIColor *)orangeColor{
    
    UIColor *orange = [UIColor colorWithRed:(240/255.0) green:(82/255.0) blue:(35/255.0) alpha:1];
    return orange;
}

+(UIColor *)mainBlueColor{
    
    UIColor *mainBlue = [UIColor colorWithRed:(46/255.0) green:(154/255.0) blue:(254/255.0) alpha:1];
    return mainBlue;
}


#pragma mark – Font styles

+(UIFont *)ralewaySemiBold:(int)size{
    
    UIFont *semiBold = [UIFont fontWithName:@"Raleway-SemiBold" size:size];
    return semiBold;
}

+(UIFont *)ralewayBold:(int)size{
    
    UIFont *semiBold = [UIFont fontWithName:@"Raleway-Bold" size:size];
    return semiBold;
}

+(UIFont *)ralewayMedium:(int)size{
    
    UIFont *semiBold = [UIFont fontWithName:@"Raleway-Medium" size:size];
    return semiBold;
}

@end
