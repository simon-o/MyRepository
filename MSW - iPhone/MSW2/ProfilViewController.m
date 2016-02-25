//
//  ProfilViewController.m
//  MSW2
//
//  Created by simon on 15/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "ProfilViewController.h"
#import "SWRevealViewController.h"
#import "AbonneesFromProfilTableViewController.h"
#import "GuestMode.h"
#import "ProfilTableViewController.h"

@interface ProfilViewController ()

@end

@implementation ProfilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _idProfil = _ProfilModal[1];
    idProfil_global = _idProfil;
    
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api getMethodWithId:(_idProfil)];
    
    if (code_global != 200)
    {
        [api popup:dict1];
        return;
    }
    //-------------------------------------------------------------------------------------------------------------------------------------------------------------
    // number of subscriptions
    NSString * post =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/subscriptions", idProfil_global];
    NSDictionary *dict3 = [api getMethodWithString:post];
    
    if (code_global != 200)
    {
        [api popup:dict3];
        return;
    }
    _pseudo2 = [[NSMutableArray alloc] initWithCapacity:0];
    for(NSDictionary *item in dict3) {
        [_pseudo2 addObject:[item valueForKey:@"username"]];
    }
    _abonnements.text = [NSString stringWithFormat:@"%d", _pseudo2.count];
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    // number of subscribers
    post =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/subscribers", idProfil_global];
    NSDictionary *dict4 = [api getMethodWithString:post];
    
    if (code_global != 200)
    {
        [api popup:dict4];
        return;
    }
    _pseudo3 = [[NSMutableArray alloc] initWithCapacity:0];
    for(NSDictionary *item in dict4) {
        [_pseudo3 addObject:[item valueForKey:@"username"]];
    }
    _abonnes.text = [NSString stringWithFormat:@"%d", _pseudo3.count];
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    //upload photo
    NSDictionary *dict2;
    dict2 = [dict1 valueForKeyPath:@"personal_data"];
    if ([dict2 objectForKey:(@"photo")] != [NSNull null]){
        urlPhoto = [dict2 objectForKey:@"photo"];
    }
    if (code_global != 200){
        [api popup:dict1];
        return;
    }
    if (urlPhoto != NULL){
        _profileImageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:urlPhoto]]];
    }
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapAbonnes:)];
    [self.abonnes setUserInteractionEnabled:YES];
    [self.abonnes addGestureRecognizer:gesture];
    
    UITapGestureRecognizer* gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapAbonnements:)];
    [self.abonnements setUserInteractionEnabled:YES];
    [self.abonnements addGestureRecognizer:gesture2];
    
    [self refreshStateButton];
}

-(BOOL) checkUserInTheList{
    int i = 0;
    
    NSString * post =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/subscriptions", Id_global];
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api getMethodWithString:post];
    if (code_global != 200)
    {
        [api popup:dict1];
        return FALSE;
    }
    
    _pseudoCounter = [[NSMutableArray alloc] initWithCapacity:0];
    _idRowCounter = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(NSDictionary *item in dict1) {
        [_idRowCounter addObject:[item valueForKey:@"id"]];
    }
    while (i < _idRowCounter.count)
    {
        if ([_idRowCounter[i] isEqualToString:_ProfilModal[1]])
        {
            return TRUE;
        }
        i = i + 1;
    }
    return FALSE;
}

-(void) refreshStateButton{
    
    GuestMode *guest = [[GuestMode alloc] init];
    if ([guest CheckIfTheUserIsAGuest] != true) {
        if (([_star imageForState:UIControlStateNormal] != [UIImage imageNamed:@"star-7 - copie.png"]) && ([self checkUserInTheList]))
        {
            [_star setImage:[UIImage imageNamed:@"star-7 - copie.png"] forState:UIControlStateNormal];
        }
        else{
            [_star setImage:[UIImage imageNamed:@"star-7.png"] forState:UIControlStateNormal];
        }
    }
    else
    {
        [_star setImage:[UIImage imageNamed:@"star-7.png"] forState:UIControlStateNormal];
    }
}

-(void) actionTapAbonnes:(UIGestureRecognizer*)gesture{
    [self performSegueWithIdentifier:@"showAbonnés" sender:self];
}

-(void) actionTapAbonnements:(UIGestureRecognizer*)gesture{
    [self performSegueWithIdentifier:@"showAbonnements" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowData"]){
        
        ProfilTableViewController *profil = [segue destinationViewController];
        profil.IdProfil = _ProfilModal[1];
    }
}

- (IBAction)star:(id)sender {
    
    if (![self checkUserInTheList]){
        NSString * post =[NSString stringWithFormat:@"{\"id\":\"%@\"}", _idProfil];
        NSString * post1 =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/subscriptions", Id_global];
        ApiMethod *api = [[ApiMethod alloc]init];
        NSDictionary *dict1 = [api postMethodWithString:post At:post1];
        if (code_global != 200){
            [api popup:dict1];
            return;
        }
        [self refreshStateButton];
        [self viewDidLoad];
    }
    else{
        NSString * post =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/subscriptions/%@",Id_global , _idProfil];
        ApiMethod *api = [[ApiMethod alloc]init];
        NSDictionary *dict1 = [api deleteMethodWithString:post];
        if (code_global != 204)
        {
            [api popup:dict1];
            return;
        }
        [self refreshStateButton];
        [self viewDidLoad];
    }
}
@end

