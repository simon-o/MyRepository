//
//  AccountTableViewController.m
//  MSW
//
//  Created by simon on 05/02/2016.
//  Copyright (c) 2016 Score Lab. All rights reserved.
//

#import "AccountTableViewController.h"
#import "ApiMethod.h"
#import "GuestMode.h"

@interface AccountTableViewController ()

@end


@implementation AccountTableViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //check if it is a guest mode
    GuestMode *guest = [[GuestMode alloc] init];
    if ([guest CheckIfTheUserIsAGuest] == true) {
        return;
    }
    [self refresh];
}

-(void) refresh{
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api getMethodWithId:(Id_global)];
    
    if (code_global != 200)
    {
        [api popup:dict1];
        return;
    }
    
    NSDictionary *dict2;
    dict2 = [dict1 valueForKeyPath:@"personal_data"];
    
    if ([dict2 objectForKey:(@"firstname")] != [NSNull null])
        self.Name.text = [dict2 objectForKey:(@"firstname")];
    
    if ([dict2 objectForKey:(@"lastname")] != [NSNull null])
        self.Surname.text = [dict2 objectForKey:(@"lastname")];
    
    if ([dict2 objectForKey:(@"email")] != [NSNull null])
        self.Email.text = [dict2 objectForKey:(@"email")];
    
    if ([dict2 objectForKey:(@"username")] != [NSNull null])
        self.Pseudo.text = [dict2 objectForKey:@"username"];
    
    if ([dict2 objectForKey:(@"message")] != [NSNull null])
        self.Message.text = [dict2 objectForKey:@"message"];
}

-(IBAction)validez{
    NSString *tmp_name = self.Name.text;
    NSString *tmp_surname = self.Surname.text;
    NSString *tmp_email = self.Email.text;
    NSString *tmp_message = self.Message.text;
    
    NSString * post =[NSString stringWithFormat:@"{\"firstname\":\"%@\",\"lastname\":\"%@\",\"email\":\"%@\",\"message\":\"%@\"}", tmp_name, tmp_surname, tmp_email, tmp_message];
    NSString * post2 =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/personal_data", Id_global];
    
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api putMethodWithString:post At:post2];
    
    if (code_global != 200){
        [api popup:dict1];
        return;
    }
    if ([tmp_email rangeOfString:@"@"].location == NSNotFound) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Votre adresse mail n'est pas correct." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alert show];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Les modifications ont bien étè prisent en compte." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)logout{
    //change the profil picture
    UIAlertController * view=   [UIAlertController
                                 alertControllerWithTitle:@"Mon compte"
                                 message:@"Que desirez vous faire ?"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* butt1 = [UIAlertAction
                            actionWithTitle:@"Deconnexion"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action)
                            {
                                ApiMethod *api = [[ApiMethod alloc]init];
                                [api getMethodWithString:@"http://163.5.84.253/api/logout"];
                                [view dismissViewControllerAnimated:YES completion:nil];
                                [self performSegueWithIdentifier:@"backLogin3" sender:self];
                                
                            }];
    UIAlertAction* butt2 = [UIAlertAction
                            actionWithTitle:@"Supprimer mon compte"
                            style:UIAlertActionStyleDestructive
                            handler:^(UIAlertAction * action)
                            {
                                NSLog(@"detruit !!!");
                                [view dismissViewControllerAnimated:YES completion:nil];
                                
                            }];
    UIAlertAction* butt3 = [UIAlertAction
                            actionWithTitle:@"Changer de mot de passe"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action)
                            {
                                //--------------------------------
                                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Changer de mot de passe." preferredStyle:UIAlertControllerStyleAlert]; // 7
                                
                                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Validez" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                    
                                    UITextField *test1 = alert.textFields[0];
                                    UITextField *test2 = alert.textFields[1];
                                    ApiMethod *api = [[ApiMethod alloc]init];
                                    
                                    NSString * post =[NSString stringWithFormat:@"{\"current_password\":\"%@\",\"new_password\":\"%@\"}", test1.text, test2.text];
                                    NSString * post2 =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@", Id_global];
                                    NSDictionary *dict1 = [api optionsMethodWithString:post At:post2];
                                    if (code_global != 204)
                                    {
                                        NSLog(@"%@", dict1);
                                        [api popup:dict1];
                                        return;
                                    }
                                    else{
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Les modifications ont bien étè prisent en compte." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
                                        [alert show];
                                    }
                                }];
                                
                                [alert addAction:defaultAction];
                                
                                [alert addTextFieldWithConfigurationHandler:^(UITextField *textField1) {
                                    textField1.placeholder = @"Ancien mot de passe";
                                    textField1.accessibilityLabel = @"ancien mot de passe";
                                }];
                                [alert addTextFieldWithConfigurationHandler:^(UITextField *textField2) {
                                    textField2.placeholder = @"Nouveau mot de passe";
                                    textField2.accessibilityLabel = @"nouveau mot de passe";
                                }];
                                
                                
                                UIAlertAction* cancel1 = [UIAlertAction
                                                          actionWithTitle:@"Fermer"
                                                          style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action)
                                                          {
                                                              [view dismissViewControllerAnimated:YES completion:nil];
                                                              
                                                          }];
                                [alert addAction:cancel1];
                                
                                [self presentViewController:alert animated:YES completion:nil];
                                //--------------------------------
                                
                                [view dismissViewControllerAnimated:YES completion:nil];
                                
                            }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Fermer"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action)
                             {
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [view addAction:butt1];
    [view addAction:butt3];
    [view addAction:butt2];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
}

@end
