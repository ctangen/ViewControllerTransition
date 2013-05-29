//
//  MyCustomViewController.m
//  ViewControllerTransition
//
//  Created by Tangen, Cameron on 5/28/13.
//  Copyright (c) 2013 Tangen, Cameron. All rights reserved.
//

#import "MyCustomViewController.h"

// Preset the number of pages. Doesn't have to be a constant
#define kMaxPages 6

// Animation Segmented Control Options
#define kAnimationSwitchNormal          0
#define kAnimationSwitchCurlUp          1
#define kAnimationSwitchCurlDown        2
#define kAnimationSwitchFlipFromRight   3
#define kAnimationSwitchFlipFromLeft    4


@interface MyCustomViewController ()

@end

@implementation MyCustomViewController {
    
    // Hold a reference to the next view controller
    MyCustomViewController *_nextViewController;
}
@synthesize currentPage = _currentPage;
@synthesize pageContent = _pageContent;
@synthesize animationSwitch = _animationSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Determine if we are at the max number of pages. If not, create a bar button item to take us to the next page
    if (_currentPage < kMaxPages) {
        UIBarButtonItem *nextPage = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"Page %d", _currentPage + 1] style:UIBarButtonItemStyleBordered target:self action:@selector(nextPageClick:)];
        self.navigationItem.rightBarButtonItem = nextPage;
    }
    
    // Set the title
    self.title = [NSString stringWithFormat:@"Page %d", _currentPage];
    
    // Set the page content here
    _pageContent.text = [NSString stringWithFormat:@"Content for page %d goes here!", _currentPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark View Controller Actions

// User clicked the next page button
- (IBAction)nextPageClick:(id)sender {
    
    // Instantiate my next page
    _nextViewController = [[MyCustomViewController alloc] init];
    _nextViewController.currentPage = _currentPage + 1;
    
    // Display my next page
    if (_animationSwitch.selectedSegmentIndex != kAnimationSwitchNormal) {
        
        // Do a fancy animation!
        [UIView animateWithDuration:0.75 animations:^{
            
            // Prepare the animation
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            
            // Do the actual push 
            [self.navigationController pushViewController:_nextViewController animated:NO];
            
            // Determine what kind of fancy animation to do
            switch (_animationSwitch.selectedSegmentIndex) {
                case kAnimationSwitchCurlDown: {
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO];
                    break;
                }
                    
                case kAnimationSwitchCurlUp: {
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
                    break;
                }
                    
                case kAnimationSwitchFlipFromLeft: {
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                    break;
                }
            
                case kAnimationSwitchFlipFromRight: {
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                    break;
                }
            }
        }];
        
    } else {
        
        // Just do a normal transition
        [self.navigationController pushViewController:_nextViewController animated:YES];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
