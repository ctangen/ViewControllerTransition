//
//  MyCustomViewController.h
//  ViewControllerTransition
//
//  Created by Tangen, Cameron on 5/28/13.
//  Copyright (c) 2013 Tangen, Cameron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *pageContent;
@property (nonatomic, strong) IBOutlet UISegmentedControl *animationSwitch;
@property (nonatomic) int currentPage;
@end
