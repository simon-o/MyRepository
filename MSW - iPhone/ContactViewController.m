//
//  ContactViewController.m
//  MSW
//
//  Created by simon on 09/12/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "SWRevealViewController.h"
#import "ContactViewController.h"
#import "ApiMethod.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(id)sender {
    ApiMethod *api = [[ApiMethod alloc]init];
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parametersDictionary setValue:_email.text forKey:@"email"];
    [parametersDictionary setValue:_object.text forKey:@"subject"];
    [parametersDictionary setValue:_message.text forKey:@"message"];
    NSDictionary *dict1 = [api ApiMethodPostAfnetworkingAt:@"https://musicsheetwriter.tk/api/contact" Data:parametersDictionary];

    if (code_global != 201){
        [api popup:dict1];
        return;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le message a bien été envoyé." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alert show];
    }
}
@end
