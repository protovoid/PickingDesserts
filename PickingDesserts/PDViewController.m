//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Chad on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UILabel *label;

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width, 50)];
    // label.text = @"Selected";
    [self.view addSubview:label];
    
    [self.view addSubview:pickerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Picker View Datasource

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[self data][component]count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [[self data] count];
}

#pragma mark - Picker View Delegate Methods

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // self.label.text = self.data[component][row].text;
    self.label.text = [NSString stringWithFormat:@"%@ %@ %@", [self data] [0] [[pickerView selectedRowInComponent:0]], [self data] [1] [[pickerView selectedRowInComponent:1]], [self data] [2] [[pickerView selectedRowInComponent:2]]];
    
 
    
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.data[component][row];
    
}

#pragma mark - Picker View Data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
