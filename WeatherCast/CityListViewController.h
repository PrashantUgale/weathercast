//
//  CityListViewController.h
//  WeatherCast
//
//  Created by Prashant Ugale on 20/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    NSMutableArray *cityList;
    
}
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
- (IBAction)addCityButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addCity;

@end
