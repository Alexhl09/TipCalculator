//
//  ViewController.m
//  TipCalculator
//
//  Created by alexhl09 on 6/25/19.
//  Copyright © 2019 alexhl09. All rights reserved.
//

#import "ViewController.h"
#import "cellPercentage.h"
@import SkyFloatingLabelTextField;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextFieldWithIcon *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@end

@implementation ViewController
@synthesize billAmount,tipLabel;


float percentages[10] = {0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50};

- (void)viewDidLoad {
    [super viewDidLoad];
    [self styleButtons];
    [tipLabel setTextColor:UIColor.whiteColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void)dismissKeyboard
{
    [billAmount resignFirstResponder];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    double amount = 0;
    NSLog(@"Hello");
    float total = 0;
    
    @try {
        amount = [billAmount.text integerValue];
    } @catch (NSException *exception) {
      
    } @finally {
      
    }
    
    total = [self calculateTip:amount :percentages[indexPath.row]];
    

    tipLabel.text = [NSString stringWithFormat:@"%0.2f", total];
}

/// Give some style to textbox billAmount
///

-(void) styleButtons{

    [billAmount setPlaceholder:@"Insert bill"];
    [billAmount setTitle:@"Bill"];
    [billAmount setIconColor:UIColor.blueColor];
    [billAmount setLineColor:[UIColor colorWithRed:0.67 green:0.92 blue:1 alpha:1]];
    [billAmount setLineColor:[UIColor colorWithRed:0.39 green:0.71 blue:0.96 alpha:1]];
    [billAmount setFont:[UIFont fontWithName:@"Helvetica" size:30 ]];
    [billAmount setTextAlignment:NSTextAlignmentRight];
    [billAmount setTitleFont:[UIFont fontWithName:@"Helvetica" size:30 ]];
    [billAmount setTitleColor:[UIColor colorWithRed:0.67 green:0.92 blue:1 alpha:1]];
    [billAmount setTextColor:UIColor.whiteColor];
}


/**
 Return the amount of money that you have to leave depending on the bill account.
 
 - Parameters:
    - amount: Amount of money
 
    - percentage: Percentage that you want to leave as tip
 
 
 
 - Returns: Amount of money to leave including the tip
 */

-(double) calculateTip : (double)  amount :(float) percentage{
    return (amount * (1 + percentage));
}








- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *celldentifier = @"cell";
    
    cellPercentage *myCell = [tableView dequeueReusableCellWithIdentifier:celldentifier];
    if (!myCell) {
        myCell = [[cellPercentage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celldentifier];
    }
  
    myCell.percentageText.text = [NSString stringWithFormat:@"%0.0f%%",percentages[indexPath.row] * 100];
    
    return myCell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Percentage";
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    
    return CGSizeMake(parentSize.width, 90);
}


- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}


- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return NO;
}

- (void)updateFocusIfNeeded {

}




@end
