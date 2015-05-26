//
//  CityListViewController.m
//  WeatherCast
//
//  Created by Prashant Ugale on 20/05/15.
//  Copyright (c) 2015 Prashant. All rights reserved.
//

#import "CityListViewController.h"
#import "WeatherDaysViewController.h"
#import "CustomUI.h"
#define SIZE 16
#define CORNER_BUTTON 16
#define CITY_IMAGE @"city1.jpg"

@interface CityListViewController ()

@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCustomUI];
    
    cityList = [[NSMutableArray alloc]init];
    
    

}



-(void)setCustomUI{
    
    self.navigationItem.title = @"Weather Forcast";
    [[UINavigationBar appearance] setBarTintColor:[CustomUI mainBlueColor]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    
    //BACKGROUND TO TABLE VIEW
    UIView *patternView = [[UIView alloc] initWithFrame:self.cityTableView.frame];
    patternView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:CITY_IMAGE]];
    patternView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.cityTableView.backgroundView = patternView;
    
    self.cityNameTextField.font = [CustomUI ralewaySemiBold:SIZE];
    
    //CORNER BUTTON
    self.addCity.layer.cornerRadius = CORNER_BUTTON;
    self.addCity.clipsToBounds = YES;
    
}



#pragma mark – UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [cityList count];
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    
    //CELL CUSTOMIZATION
    cell.textLabel.text = [cityList objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [CustomUI ralewayBold:SIZE];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.cityTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WeatherDaysViewController *weatherDaysController = [[WeatherDaysViewController alloc]initWithNibName:@"WeatherDaysViewController" bundle:nil];
    
    weatherDaysController.cityName = [cityList objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:weatherDaysController animated:YES];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addCityButton:(id)sender {
    
    [cityList addObject:self.cityNameTextField.text];
    self.cityNameTextField.text = @"";
    
    //TO RELOAD TABLEVIEW
    [self.cityTableView reloadData];
    
}
@end
