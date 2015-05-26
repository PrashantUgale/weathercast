//
//  weatherDetail.h
//  WeatherCast
//
//  Created by Prashant Ugale on 21/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WeatherDetail : NSObject

//CITY
@property (nonatomic, retain) NSString *clouds;
@property (nonatomic, retain) NSString *deg;
@property (nonatomic, retain) NSString *dt;
@property (nonatomic, retain) NSString *humidity;
@property (nonatomic, retain) NSString *pressure;
@property (nonatomic, retain) NSString *rain;
@property (nonatomic, retain) NSString *speed;


//TEMP
@property (nonatomic, retain) NSString *day;
@property (nonatomic, retain) NSString *evening;
@property (nonatomic, retain) NSString *max;
@property (nonatomic, retain) NSString *min;
@property (nonatomic, retain) NSString *morning;
@property (nonatomic, retain) NSString *night;

//WEATHER
@property (nonatomic, retain) NSString *weatherDescription;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSString *valueId;
@property (nonatomic, retain) NSString *weatherMain;

@end
