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
@property (weak, nonatomic) IBOutlet UILabel *defaultPercentage;



@end

@implementation Settings
@synthesize numberPeople,defaultPercentage;
- (void)viewDidLoad {
    [super viewDidLoad];
    numberPeople.text = [NSString stringWithFormat:@"%i",[ViewController numberOfPeople]];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_per"];
    
    defaultPercentage.text = [NSString stringWithFormat:@"%0.2f",doubleValue];    // Do any additional setup after loading the view.
}
- (IBAction)changeValueNumberPeople:(UIStepper *)sender {
    
    [ViewController changeNumberOfPeople:[sender value]];
    numberPeople.text = [NSString stringWithFormat:@"%i",[ViewController numberOfPeople]];

}
- (IBAction)stepperPercentage:(UIStepper *)sender {
    
     defaultPercentage.text = [NSString stringWithFormat:@"%0.2f",sender.value];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:sender.value forKey:@"default_tip_per"];
    [defaults synchronize];
    

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
