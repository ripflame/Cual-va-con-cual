//
//  PropinasFlipsideViewController.h
//  Propinas
//
//  Created by Gilberto Leon on 11/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PropinasFlipsideViewController;

@protocol PropinasFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PropinasFlipsideViewController *)controller;
@end

@interface PropinasFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <PropinasFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
