//
//  Settings.m
//  TipCalculator
//
//  Created by alexhl09 on 6/25/19.
//  Copyright © 2019 alexhl09. All rights reserved.
//

#import "Settings.h"
#import "ViewController.h"

@interface Settings ()

@end

@implementation Settings
@synthesize numberPeople;
- (void)viewDidLoad {
    [super viewDidLoad];
    numberPeople.text = [NSString stringWithFormat:@"%i",[ViewController numberOfPeople]];
    
    // Do any additional setup after loading the view.
}
- (IBAction)changeValueNumberPeople:(UIStepper *)sender {
    
    [ViewController changeNumberOfPeople:[sender value]];
    numberPeople.text = [NSString stringWithFormat:@"%i",[ViewController numberOfPeople]];

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
