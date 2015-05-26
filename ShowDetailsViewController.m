//
//  ShowDetailsViewController.m
//  WeatherCast
//
//  Created by Prashant Ugale on 22/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import "ShowDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomUI.h"
#define MAXSIZE 16
#define MINSIZE 14
#define MAINTITLE 18
#define SUN_IMAGE @"clear_sun.jpeg"
#define CLOUDE_IMAGE @"clouds.jpg"
#define CORNER_RADIUS 15

@interface ShowDetailsViewController ()

@end

@implementation ShowDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
    [self setValues];
    [self setFonts];
    self.navigationItem.title = self.dayDetails.weatherDescription;
    self.navigationController.navigationBar.tintColor = [CustomUI mainBlueColor];
    NSLog(@"%@",self.dayDetails.weatherDescription);
    
    self.tempImage.layer.masksToBounds = YES;
    self.tempImage.layer.cornerRadius = CORNER_RADIUS;
    self.tempImage.alpha = 0.4;
    
    self.typeImage.layer.masksToBounds = YES;
    self.typeImage.layer.cornerRadius = CORNER_RADIUS;
    self.typeImage.alpha = 0.4;
}


-(void)setFonts{
    
    self.mainTemp.font = [CustomUI ralewayBold:MAINTITLE];
    self.mainWeather.font = [CustomUI ralewayBold:MAINTITLE];
    self.mainTemp.textColor = [UIColor whiteColor];
    self.mainWeather.textColor = [UIColor whiteColor];
    
    self.dayLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.eveningLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.maxLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.minLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.morningLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.nightLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    
    self.cloudsLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.degreeLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.dtLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.humidityLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.pressureLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    self.speedLable.font = [CustomUI ralewaySemiBold:MINSIZE];
    
    self.lable1.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable2.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable3.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable4.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable5.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable6.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable7.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable8.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable9.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable10.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable11.font = [CustomUI ralewayBold:MAXSIZE];
    self.lable12.font = [CustomUI ralewayBold:MAXSIZE];
}


-(void)setValues{
    
    self.dayLable.text = [NSString stringWithFormat:@"%@", self.dayDetails.day];
    self.eveningLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.evening];
    self.maxLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.max];
    self.minLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.min];
    self.morningLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.morning];
    self.nightLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.night];
    
    self.cloudsLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.clouds];
    self.degreeLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.deg];
    self.dtLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.dt];
    self.humidityLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.humidity];
    self.pressureLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.pressure];
    self.speedLable.text = [NSString stringWithFormat:@"%@",self.dayDetails.speed];

}


//CHANGE IMAGE WITH RESPECT TO TEMP
-(void)setImage{
    NSString *type = self.dayDetails.weatherMain;
    if ([type isEqualToString:@"Clear"]) {
        self.MainBackImage.image = [UIImage imageNamed:SUN_IMAGE];
    }
    else{
        self.MainBackImage.image = [UIImage imageNamed:CLOUDE_IMAGE];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
