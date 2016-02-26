//
//  LoginView.m
//  MSW2
//
//  Created by simon on 22/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "LoginView.h"
#import "SSKeychain.h"
#import "SSKeychainQuery.h"


@implementation LoginView

@synthesize identifiant;
@synthesize password;

- (void)viewDidLoad {
    [super viewDidLoad];
    Id_global = @"0";
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"deconnection"];
        self.switch1.on = FALSE;
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"deconnection"]) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        ApiMethod *api = [[ApiMethod alloc] init];
        NSDictionary *dict = [api postMethodWithIdentifier:[user objectForKey:@"login"] Password:[SSKeychain passwordForService:@"MSW" account:[user objectForKey:@"login"]]];
        if (code_global == 200){
            self.id = [dict objectForKey:(@"id")];
            Id_global = self.id;
            [self performSegueWithIdentifier:@"nextView" sender:self];
        }
        else{
            [api popup:dict];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"switch1"] != NULL ){
        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"deconnection"])
            _switch1.on = [user boolForKey:@"switch1"];
        else
            self.switch1.on = FALSE;
    }
    if ([_switch1 isOn] == true){
        identifiant.text = [user objectForKey:@"login"];
        password.text = [SSKeychain passwordForService:@"MSW" account:[user objectForKey:@"login"]];
    }
}

-(IBAction)login{
    ApiMethod *api = [[ApiMethod alloc] init];
    NSDictionary *dict = [api postMethodWithIdentifier:identifiant.text Password:password.text];
    if (code_global == 200)
    {
        _label.text = @"Vous êtes connecté.";
        self.id = [dict objectForKey:(@"id")];
        Id_global = self.id;
        if ([_switch1 isOn] == true){
            [[NSUserDefaults standardUserDefaults]setObject:identifiant.text forKey:@"login"];
            [SSKeychain setPassword:password.text forService:@"MSW" account:identifiant.text];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"deconnection"];
        }
        [[NSUserDefaults standardUserDefaults] setBool:[_switch1 isOn] forKey:@"switch1"];
        [self performSegueWithIdentifier:@"nextView" sender:self];
    }
    else{
        [api popup:dict];
    }
}

-(IBAction)Guest{
    [self performSegueWithIdentifier:@"nextView" sender:self];
}

@end
