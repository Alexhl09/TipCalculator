//
//  ViewController.h
//  TipCalculator
//
//  Created by alexhl09 on 6/25/19.
//  Copyright © 2019 alexhl09. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
+(int)numberOfPeople;
+(NSMutableArray *) myArray;
+(NSMutableArray *) myTotals;
+(NSMutableArray *) perPerson;

+(void)changeNumberOfPeople : (int) number;
-(void) styleButtons;
-(double) calculateTip:(double)  amount : (float) percentage;
@end

