//
//  ApiMethod.h
//  MSW2
//
//  Created by simon on 29/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "AFNetworking.h"

NSString *Id_global;
long      code_global;

@interface ApiMethod : NSObject

@property (nonatomic, strong) id posts;

- (void) popup:(NSDictionary *) dict;

-(NSDictionary *)ApiMethodPostAfnetworkingAt:(NSString *)url Data:(NSMutableDictionary *)parametersDictionary;
-(NSDictionary *)ApiMethodGetAfnetworkingAt:(NSString *)url;
-(NSDictionary *)ApiMethodDeleteAfnetworkingAt:(NSString *)url;
-(NSDictionary *)ApiMethodPutAfnetworkingAt:(NSString *)url Data:(NSMutableDictionary *)parametersDictionary;
-(NSDictionary *)UploadPhotoData:(NSData *)data url:(NSString *)url param:(NSDictionary *)param path:(NSURL *)path;
@end
