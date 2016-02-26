//
//  SuscribeViewController.m
//  MSW2
//
//  Created by simon on 29/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "SuscribeViewController.h"
#import "SWRevealViewController.h"

@interface SuscribeViewController ()

@end

@implementation SuscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valideSuscribe {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"Veuillez patienter\n\n"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [alert.view addSubview:spinner];
    [self presentViewController:alert animated:NO completion:^{
        
    ApiMethod *api = [[ApiMethod alloc]init];
    NSString * post1 =[NSString stringWithFormat:@"{\"username\":\"%@\",\"email\":\"%@\",\"password\":\"%@\"}", _pseudo.text, _email.text, _password.text];
    NSDictionary *dict1 = [api postMethodWithString:post1 At:@"http://163.5.84.253/api/users"];//change the null by the url
    NSString *post;
    if (dict1 == NULL || code_global != 200)
    {
        [api popup:dict1];
    }
    else
    {
        post = @"Votre compte a été crée. Veuillez validez votre compte sur le mail que vous venez de recevoir.";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:post delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        alert.accessibilityLabel = @"fermer inscription";
        [alert show];
    }
    }];
    [alert dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"backLogin" sender:self];
    }];
}

@end
