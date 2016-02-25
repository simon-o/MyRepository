//
//  MonCompteViewController.m
//  MSW2
//
//  Created by simon on 07/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "AccountViewController.h"
#import "SWRevealViewController.h"
#import "AccountTableViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Permet d'avoir l'icone menu, a copier coller dans les fichier de class de chaque vu, si jamais je créer une classe par vue
     Si jamais une vue est lié a une class sans ce morceau de code, on ne pourrap lus revenir en arriere.
     */
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 2.0f;
    self.profileImageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    //check if it is a guest mode
    GuestMode *guest = [[GuestMode alloc] init];
    if ([guest CheckIfTheUserIsAGuest] == true) {
        return;
    }
    
    [self refresh];
    
}

-(void)TakePhoto{
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
    //[picker release];
}

-(void)ChooseExisting{
    picker2 = [[UIImagePickerController alloc]init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:YES completion:NULL];
    //[picker release];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_profileImageView setImage:image];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    //send photo
    
    NSData *imageData = UIImageJPEGRepresentation([_profileImageView image], 90);
    NSString * urlStr =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/photo", Id_global];
    NSString *urlString = urlStr;
    // setting up the request object now
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"PUT"];
    
    NSString *boundary = [[NSString alloc]init];
    NSString *contentType = [NSString stringWithFormat:@"image/jpeg; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[NSData dataWithData:imageData]];
    [request setHTTPBody:body];
    
    //Using Synchronous Request. You can also use asynchronous connection and get update in delegates
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) refresh{
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api getMethodWithId:(Id_global)];
    if (code_global != 200){
        [api popup:dict1];
        return;
    }
    
    NSDictionary *dict2;
    dict2 = [dict1 valueForKeyPath:@"personal_data"];
    if ([dict2 objectForKey:(@"photo")] != [NSNull null]){
        urlPhoto = [dict2 objectForKey:@"photo"];
    }
    if (urlPhoto != NULL){
        _profileImageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:urlPhoto]]];
    }
    if (code_global != 200){
        [api popup:dict1];
        return;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actionButton{
    //change the profil picture
    UIAlertController * view2=   [UIAlertController
                                  alertControllerWithTitle:@"Quelle action desirez vous faire ?"
                                  message:@"Que desirez vous faire ?"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* butt1 = [UIAlertAction
                            actionWithTitle:@"Prendre une photo"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action)
                            {
                                [self TakePhoto];
                            }];
    UIAlertAction* butt2 = [UIAlertAction
                            actionWithTitle:@"Mes images"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action)
                            {
                                [self ChooseExisting];
                            }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Fermer"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action)
                             {
                                 [view2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        [view2 addAction:butt1];
    [view2 addAction:butt2];
    [view2 addAction:cancel];
    [self presentViewController:view2 animated:YES completion:nil];
}

@end

