//
//  WeatherDaysViewController.h
//  WeatherCast
//
//  Created by Prashant Ugale on 21/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WeatherDaysViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate, MBProgressHUDDelegate>{
    
    //URL CONNECTION & RECIVE DATA
    NSMutableArray *weatherDaysList;
    NSMutableData *dataContainer;
    NSURLConnection * weatherConnection;
    
    //LOADING INDICATOR
    MBProgressHUD *HUD;
    

    
}

@property (weak, nonatomic) IBOutlet UITableView *weatherTableView;
@property (nonatomic)NSString *cityName;
@property (retain, nonatomic) NSMutableData *receivedData;

@end
