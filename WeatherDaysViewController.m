//
//  WeatherDaysViewController.m
//  WeatherCast
//
//  Created by Prashant Ugale on 21/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import "WeatherDaysViewController.h"
#import "WeatherDetail.h"
#import "ShowDetailsViewController.h"
#import "CustomUI.h"
#define URL @"http://api.openweathermap.org/data/2.5/forecast/daily?"
#define WEATHER_ID @"a155e1898c96997770ba282308265e21"
#define SIZE 16
#define WATER_IMAGE @"water1.jpg"


@interface WeatherDaysViewController ()

@end

@implementation WeatherDaysViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setCustomUI];
    
    weatherDaysList = [[NSMutableArray alloc]init];
    
    [self getWeatherDetailsOfCity];
}

-(void)setCustomUI{
    
    self.navigationItem.title = self.cityName;
    self.navigationController.navigationBar.tintColor = [CustomUI mainBlueColor];
    
    //BACKGROUND TO TABLE VIEW
    UIView *patternView = [[UIView alloc] initWithFrame:self.weatherTableView.frame];
    patternView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:WATER_IMAGE]];
    patternView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.weatherTableView.backgroundView = patternView;
    
    //LOADING INDICATOR
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    
    HUD.labelText = @"Getting weather details...";
    
    [HUD show:YES];

    
}



-(void)getWeatherDetailsOfCity{

    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    //URL STRING
    NSString *strURL = [NSString stringWithFormat:@"%@q=%@&cnt=14&APPID=%@",URL,self.cityName,WEATHER_ID];
    
    //SET URL
    NSURL *url = [NSURL URLWithString:strURL];
    
    //SET CONNECTION WITH URL
    weatherConnection = [NSURLConnection connectionWithRequest:[NSMutableURLRequest requestWithURL:[url standardizedURL]] delegate:self];
    
    //START CONNECTION
    [weatherConnection start];
    
}

#pragma mark – NSURLConnectionDataDelegate

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    NSError *error;
    
    //RECIVE DATA FROM JSON SERIALIZATION
    NSDictionary *weatherObject = [NSJSONSerialization JSONObjectWithData:self.receivedData options: NSJSONReadingMutableContainers error:&error];
    [HUD hide:YES];
    

    // list OBJECTS
        NSArray *dayList = [weatherObject valueForKey:@"list"];
            
        for(NSDictionary *object in dayList){
            
            WeatherDetail *weatherDetail = [[WeatherDetail alloc]init];
            
            weatherDetail.clouds = [object valueForKey:@"clouds"];
            weatherDetail.deg = [object valueForKey:@"deg"];
            weatherDetail.dt = [object valueForKey:@"dt"];
            weatherDetail.humidity = [object valueForKey:@"humidity"];
            weatherDetail.pressure = [object valueForKey:@"pressure"];
            weatherDetail.speed = [object valueForKey:@"speed"];
            
        //temp OBJECT
            NSDictionary *temperature = [object valueForKey:@"temp"];
            
                weatherDetail.day = [temperature valueForKey:@"day"];
                weatherDetail.evening = [temperature valueForKey:@"eve"];
                weatherDetail.max = [temperature valueForKey:@"max"];
                weatherDetail.min = [temperature valueForKey:@"min"];
                weatherDetail.morning = [temperature valueForKey:@"morn"];
                weatherDetail.night = [temperature valueForKey:@"night"];

        //weather OBJECT
            NSArray *weather = [object valueForKey:@"weather"];
                
            for(NSDictionary *objectWeather in weather){
                    
                NSString *details = [objectWeather valueForKey:@"description"];
                weatherDetail.weatherDescription = details;
                weatherDetail.icon = [objectWeather valueForKey:@"icon"];
                weatherDetail.valueId = [objectWeather valueForKey:@"id"];
                weatherDetail.weatherMain = [objectWeather valueForKey:@"main"];
                
            }//CLOSE WEATHER OBJECT
            
            //ADD OBJECTS TO TABLE VIEW AND RELOAD
            [weatherDaysList addObject:weatherDetail];
            [self.weatherTableView reloadData];

            
            }// CLOSE DAYLIST OBJECT
    

}
    

#pragma mark – UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [weatherDaysList count];
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    WeatherDetail *detail = [weatherDaysList objectAtIndex:indexPath.row];
    
    //CELL CUSTOMIZATION
    cell.textLabel.text = detail.weatherDescription;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [CustomUI ralewayBold:SIZE];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.weatherTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ShowDetailsViewController *showDetailsController = [[ShowDetailsViewController alloc]initWithNibName:@"ShowDetailsViewController" bundle:nil];
    showDetailsController.dayDetails = [weatherDaysList objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:showDetailsController animated:YES];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
