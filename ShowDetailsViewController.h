//
//  ShowDetailsViewController.h
//  WeatherCast
//
//  Created by Prashant Ugale on 22/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import "ViewController.h"
#import "WeatherDetail.h"

@interface ShowDetailsViewController : ViewController

@property(nonatomic, retain)WeatherDetail *dayDetails;
@property (weak, nonatomic) IBOutlet UILabel *dayLable;
@property (weak, nonatomic) IBOutlet UILabel *eveningLable;
@property (weak, nonatomic) IBOutlet UILabel *maxLable;
@property (weak, nonatomic) IBOutlet UILabel *minLable;
@property (weak, nonatomic) IBOutlet UILabel *morningLable;
@property (weak, nonatomic) IBOutlet UILabel *nightLable;
@property (weak, nonatomic) IBOutlet UILabel *cloudsLable;
@property (weak, nonatomic) IBOutlet UILabel *humidityLable;
@property (weak, nonatomic) IBOutlet UILabel *speedLable;
@property (weak, nonatomic) IBOutlet UILabel *degreeLable;
@property (weak, nonatomic) IBOutlet UILabel *pressureLable;
@property (weak, nonatomic) IBOutlet UILabel *dtLable;
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempImage;

@property (weak, nonatomic) IBOutlet UILabel *mainTemp;
@property (weak, nonatomic) IBOutlet UILabel *mainWeather;
@property (weak, nonatomic) IBOutlet UILabel *lable1;
@property (weak, nonatomic) IBOutlet UILabel *lable2;
@property (weak, nonatomic) IBOutlet UILabel *lable3;
@property (weak, nonatomic) IBOutlet UILabel *lable4;
@property (weak, nonatomic) IBOutlet UILabel *lable5;
@property (weak, nonatomic) IBOutlet UILabel *lable6;
@property (weak, nonatomic) IBOutlet UILabel *lable7;
@property (weak, nonatomic) IBOutlet UILabel *lable8;
@property (weak, nonatomic) IBOutlet UILabel *lable9;
@property (weak, nonatomic) IBOutlet UILabel *lable10;
@property (weak, nonatomic) IBOutlet UILabel *lable11;
@property (weak, nonatomic) IBOutlet UILabel *lable12;
@property (weak, nonatomic) IBOutlet UIImageView *MainBackImage;

@end
