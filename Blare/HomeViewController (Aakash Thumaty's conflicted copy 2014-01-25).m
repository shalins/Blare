//
//  HomeViewController.m
//  Blare
//
//  Created by Spencer Yen on 1/24/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)host:(id)sender {
    
    [self performSegueWithIdentifier:@"pushHost" sender:self];
}


- (void)viewDidLoad
{
    
    //Set navBar image programatically    (NavBar.png replace with the image)
    UIImage *navBarImage = [UIImage imageNamed:@"NavBar.png"];
    [[UINavigationBar appearance]setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//use this code for changing views [self performSegueWithIdentifier:@"loadSettings" sender:self];

@end
