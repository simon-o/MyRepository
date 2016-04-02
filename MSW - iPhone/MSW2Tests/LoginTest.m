//
//  LoginTest.m
//  MSW2
//
//  Created by simon on 23/10/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LoginView.h"
#import "AccountViewController.h"

@interface LoginTest : XCTestCase

@property (strong, nonatomic) LoginView *controller;

@end

@implementation LoginTest

@synthesize controller = _controller;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.controller = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];*/
    
    //pour toujours etre connecté au moins une fois
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testConnectionFail{
    ApiMethod *api = [[ApiMethod alloc] init];
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parametersDictionary setValue:@"ios2" forKey:@"login"];
    [parametersDictionary setValue:@"azerty123456" forKey:@"password"];
    NSDictionary *dict = [api ApiMethodPostAfnetworkingAt:@"https://musicsheetwriter.tk/api/login" Data:parametersDictionary];
    NSLog(@"/////////////////%ld", code_global);
    XCTAssertNil(dict, @"l'objet retourné a la connexion n'est NULL, ce n'est pas normal. test: log (bob - mot de passe mauvais)");
}

@end
