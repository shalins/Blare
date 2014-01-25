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
- (IBAction)oushH:(id)sender {
    
    [self performSegueWithIdentifier:@"pushHost" sender:self];
}


- (void)viewDidLoad
{
    NSString *imageBG = @"MainMenuBG.png";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:imageBG]]];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568.0f) {
        imageBG = [imageBG stringByReplacingOccurrencesOfString:@".png" withString:@"-568h.png"];
    }

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"NavBarBG.png"] forBarMetrics: UIBarMetricsDefault];


    //Set navBar image programatically    (NavBar.png replace with the image)

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImage *navBarImage = [UIImage imageNamed:@"NavBarBG.png"];
    [[UINavigationBar appearance]setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//use this code for changing views [self performSegueWithIdentifier:@"loadSettings" sender:self];

@end
