//
//  login.m
//  MSW
//
//  Created by Antoine Simon on 02/04/2016.
//  Copyright © 2016 Score Lab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ApiMethod.h"

@interface login : XCTestCase

@end

@implementation login

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testConnection{
    ApiMethod *api = [[ApiMethod alloc] init];
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parametersDictionary setValue:@"ios2" forKey:@"login"];
    [parametersDictionary setValue:@"azerty123" forKey:@"password"];
    NSDictionary *dict = [api ApiMethodPostAfnetworkingAt:@"https://musicsheetwriter.tk/api/login" Data:parametersDictionary];
    NSLog(@"/////////////////%ld", code_global);
    XCTAssertNotNil(dict, @"l'objet retourné a la connexion n'est NULL, ce n'est pas normal. test: log (bob - mot de passe mauvais)");
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

-(void)testGet{
    ApiMethod *api = [[ApiMethod alloc] init];
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    NSDictionary *dict = [api ApiMethodGetAfnetworkingAt:@"https://musicsheetwriter.tk/api/users/74"];
    
    NSLog(@"/////////////////%ld", code_global);
    XCTAssertNotNil(dict, @"l'objet retourné a la connexion n'est NULL, ce n'est pas normal. test: log (bob - mot de passe mauvais)");
}

-(void)testPut{
    ApiMethod *api = [[ApiMethod alloc] init];
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parametersDictionary setValue:@"yolo" forKey:@"firstname"];
    
    NSDictionary *dict = [api ApiMethodPutAfnetworkingAt:@"https://musicsheetwriter.tk/api/users/74/personal_data" Data:parametersDictionary];
    
    NSLog(@"/////////////////%ld", code_global);
    XCTAssertNotNil(dict, @"l'objet retourné a la connexion n'est NULL, ce n'est pas normal. test: log (bob - mot de passe mauvais)");
}

@end
