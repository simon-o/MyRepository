//
//  LogTest.m
//  MSW2
//
//  Created by simon on 24/10/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "LogTest.h"
#import "SubscriptionViewController.h"

@implementation LogTest

-(void)test00LogFail
{
    [tester enterText:@"lol2" intoViewWithAccessibilityLabel:@"identifiant login"];
    [tester enterText:@"bbbbbbbbbbbbb" intoViewWithAccessibilityLabel:@"mot de passe login"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"connecter"];
    [tester tapViewWithAccessibilityLabel:@"connecter"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Fermer"];
    [tester tapViewWithAccessibilityLabel:@"Fermer"];
}

-(void)test01PasswordForgotten{
    [tester waitForTappableViewWithAccessibilityLabel:@"mot de passe oublie"];
    [tester tapViewWithAccessibilityLabel:@"mot de passe oublie"];
    
    [tester enterText:@"toinoue31@hotmail.fr" intoViewWithAccessibilityLabel:@"email perdu"];
    
    [tester tapViewWithAccessibilityLabel:@"envoyer un email"];
}

-(void)test02Enroll{
    [tester waitForTappableViewWithAccessibilityLabel:@"creer un compte"];
    [tester tapViewWithAccessibilityLabel:@"creer un compte"];
    
    [tester enterText:@"test" intoViewWithAccessibilityLabel:@"pseudo inscription"];
    [tester enterText:@"ça peut pas" intoViewWithAccessibilityLabel:@"nom inscription"];
    [tester enterText:@"marcher" intoViewWithAccessibilityLabel:@"prenom inscription"];
    [tester enterText:@"lol2" intoViewWithAccessibilityLabel:@"mot de passe inscription"];
    [tester enterText:@"jemaime@msw.winner" intoViewWithAccessibilityLabel:@"email inscription"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"valider incription"];
    [tester tapViewWithAccessibilityLabel:@"valider incription"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Fermer"];
    [tester tapViewWithAccessibilityLabel:@"Fermer"];
}

-(void)test03Log
{
    [tester enterText:@"\b\b\b" intoViewWithAccessibilityLabel:@"identifiant login"];
    
    [tester enterText:@"lol2" intoViewWithAccessibilityLabel:@"identifiant login"];
    [tester enterText:@"qwerty123" intoViewWithAccessibilityLabel:@"mot de passe login"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"connecter"];
    [tester tapViewWithAccessibilityLabel:@"connecter"];
}

-(void)test04Deconnection{
    [tester waitForTappableViewWithAccessibilityLabel:@"information mon compte"];
    [tester tapViewWithAccessibilityLabel:@"information mon compte"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Deconnexion"];
    [tester tapViewWithAccessibilityLabel:@"Deconnexion"];
    
    [tester enterText:@"lol2" intoViewWithAccessibilityLabel:@"identifiant login"];
    [tester enterText:@"qwerty123" intoViewWithAccessibilityLabel:@"mot de passe login"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"connecter"];
    [tester tapViewWithAccessibilityLabel:@"connecter"];
}

-(void)test05ChangerPassword{
    [tester waitForTappableViewWithAccessibilityLabel:@"information mon compte"];
    [tester tapViewWithAccessibilityLabel:@"information mon compte"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Changer de mot de passe"];
    [tester tapViewWithAccessibilityLabel:@"Changer de mot de passe"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"ancien mot de passe"];
    [tester enterText:@"qwerty123" intoViewWithAccessibilityLabel:@"ancien mot de passe"];
    [tester enterText:@"qwerty1234" intoViewWithAccessibilityLabel:@"nouveau mot de passe"];
    
    [tester tapViewWithAccessibilityLabel:@"Validez"];
    
    //remise du bon mot de passe
    [tester waitForTappableViewWithAccessibilityLabel:@"information mon compte"];
    [tester tapViewWithAccessibilityLabel:@"information mon compte"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Changer de mot de passe"];
    [tester tapViewWithAccessibilityLabel:@"Changer de mot de passe"];

    [tester waitForTappableViewWithAccessibilityLabel:@"ancien mot de passe"];
    [tester enterText:@"qwerty1234" intoViewWithAccessibilityLabel:@"ancien mot de passe"];
    [tester enterText:@"qwerty123" intoViewWithAccessibilityLabel:@"nouveau mot de passe"];
    
    [tester tapViewWithAccessibilityLabel:@"Validez"];
    
}

-(void)test06ChangeFirstname{
    [tester waitForTappableViewWithAccessibilityLabel:@"prenom mon compte"];
    [tester enterText:@"\b\b\b\b" intoViewWithAccessibilityLabel:@"prenom mon compte"];
    [tester enterText:@"test" intoViewWithAccessibilityLabel:@"prenom mon compte"];
    
    [tester tapViewWithAccessibilityLabel:@"valider mon compte"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Fermer"];
    [tester tapViewWithAccessibilityLabel:@"Fermer"];
}

-(void)test07Menu{
    [tester tapViewWithAccessibilityLabel:@"menu"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"mon compte menu"];
    [tester tapViewWithAccessibilityLabel:@"mon compte menu"];
    
    [tester tapViewWithAccessibilityLabel:@"menu"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"mes partitions menu"];
    [tester tapViewWithAccessibilityLabel:@"mes partitions menu"];
    
    [tester tapViewWithAccessibilityLabel:@"menu"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"abon menu"];
    [tester tapViewWithAccessibilityLabel:@"abon menu"];
}

-(void)test08Swipe{
    [tester waitForTappableViewWithAccessibilityLabel:@"Abonnements"];
    [tester tapViewWithAccessibilityLabel:@"Abonnements"];

    [tester waitForViewWithAccessibilityLabel:@"tableview"];
    
    [tester swipeViewWithAccessibilityLabel:@"test" inDirection:KIFSwipeDirectionLeft];
    [tester waitForTappableViewWithAccessibilityLabel:@"Delete"];
    [tester tapViewWithAccessibilityLabel:@"Delete"];
    
    [tester tapViewWithAccessibilityLabel:@"menu"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"mon compte menu"];
    [tester tapViewWithAccessibilityLabel:@"mon compte menu"];
}

-(void)test09SwipeMenu
{
    [tester waitForTappableViewWithAccessibilityLabel:@"vue mon compte"];
    [tester swipeViewWithAccessibilityLabel:@"vue mon compte" inDirection:KIFSwipeDirectionRight];
    [tester waitForTappableViewWithAccessibilityLabel:@"mon compte menu"];
    [tester tapViewWithAccessibilityLabel:@"mon compte menu"];
}

-(void)test10Add{
    [tester waitForTappableViewWithAccessibilityLabel:@"search"];
    [tester tapViewWithAccessibilityLabel:@"search"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"Utilisateurs"];
    [tester tapViewWithAccessibilityLabel:@"Utilisateurs"];
    
    [tester tapViewWithAccessibilityLabel:@"ligne"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"follow"];
    [tester tapViewWithAccessibilityLabel:@"follow"];
}

-(void)test11{
    /*//test
     [tester enterText:@"bob" intoViewWithAccessibilityLabel:@"identifiant login"];
     [tester enterText:@"b" intoViewWithAccessibilityLabel:@"mot de passe login"];
     [tester waitForTappableViewWithAccessibilityLabel:@"connecter"];
     [tester tapViewWithAccessibilityLabel:@"connecter"];
     //test*/
}

@end
