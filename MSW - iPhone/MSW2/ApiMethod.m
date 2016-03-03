//
//  ApiMethod.m
//  MSW2
//
//  Created by simon on 29/09/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "ApiMethod.h"

@implementation ApiMethod

- (void) popup:(NSDictionary *) dict{
    if ([dict objectForKey:(@"message")] != nil)
    {
        if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"LOG-BADCREDENTIALS")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Les identifiants de connexion sont incorrectes." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-MISSING")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Il manque des paramètres dans le corps de la requête. " delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-BADFIELD")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le format de certains paramètres sont incorrects. " delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-UNAUTHORIZED")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Vous n'avez pas les permissions requises pour effectuer cette action. " delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-RESNFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"URl de la requete incorrect." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-USERNFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Votre ID utilisateur est introuvable." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-SCORENOTFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L'ID de la partition est introuvable." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-SUBNOTFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L'ID de l'abonnement est introuvable." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-FAVNOTFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L'ID de la partition favorite est introuvable." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-METHNALLOW")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L’URI est correct mais la méthode HTTP associée n’est pas autorisée." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-BADJSON")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"JSON incorrect." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-DBSERERR")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"La base de données en repond pas." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"GLO-DBSCHERR")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Une anomalie dans le schéma de la base de données est survenue." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"LOG-ACCNOTACTIVE")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le compte n’a pas été validé via le mail de confirmation d’inscription." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"LOG-CLOSEDACC")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le compte a été clôturé." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"FOR-EMAILNOTFOUND")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L’adresse email n’appartient à aucun compte." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"FOR-TOKENNOTFOUND")])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le jeton de réinitialisation de mot de passe est introuvable." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"REG-EALRUSED")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le nom d’utilisateur et/ou l’adresse email appartiennent déjà à un autre utilisateur." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"USR-WRONGPASS")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le mot de passe n'est pas valide." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"CLO-USERALRCLO")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le compte est deja cloturé." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"UPL-BADCONTENTTYPE")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"header non accepté." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"SUB-BADUSERID")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"L’utilisateur identifié n’existe pas." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"FAV-BADSCOREID")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"La partition identifiée n’existe pas." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else if([[dict objectForKey:(@"shortcode")] isEqualToString:(@"PAS-INVALIDEPASSWORD")]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Le mot de passe actuel n'est pas correct." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Message d'erreur inconnu." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
            [alert show];
        }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Erreur inconnu." delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alert show];
    }
}


//AFNETWORKING ------------------------------------------
-(NSDictionary *)ApiMethodPostAfnetworkingAt:(NSString *)url Data:(NSMutableDictionary *)parametersDictionary{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        PopUpViewController *pop = [[PopUpViewController alloc] init];
        [pop popup];
    } else {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    /*NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parametersDictionary setValue:@"ios2" forKey:@"login"];
    [parametersDictionary setValue:@"qwerty123" forKey:@"password"];*/
    
    __block NSDictionary* response = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager POST:url parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
        code_global = r.statusCode;
        dispatch_semaphore_signal(semaphore);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return response;
    }
    return NULL;
}

-(NSDictionary *)ApiMethodGetAfnetworkingAt:(NSString *)url{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        PopUpViewController *pop = [[PopUpViewController alloc] init];
        [pop popup];
    } else {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    /*NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
     [parametersDictionary setValue:@"ios2" forKey:@"login"];
     [parametersDictionary setValue:@"qwerty123" forKey:@"password"];*/
    
    __block NSDictionary* response = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
        code_global = r.statusCode;
        dispatch_semaphore_signal(semaphore);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return response;
    }
    return NULL;
}

-(NSDictionary *)ApiMethodDeleteAfnetworkingAt:(NSString *)url{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        PopUpViewController *pop = [[PopUpViewController alloc] init];
        [pop popup];
    } else {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    /*NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
     [parametersDictionary setValue:@"ios2" forKey:@"login"];
     [parametersDictionary setValue:@"qwerty123" forKey:@"password"];*/
    
    __block NSDictionary* response = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager DELETE:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
        code_global = r.statusCode;
        dispatch_semaphore_signal(semaphore);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return response;
    }
    return NULL;
}

-(NSDictionary *)ApiMethodPutAfnetworkingAt:(NSString *)url Data:(NSMutableDictionary *)parametersDictionary{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        PopUpViewController *pop = [[PopUpViewController alloc] init];
        [pop popup];
    } else {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    /*NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
     [parametersDictionary setValue:@"ios2" forKey:@"login"];
     [parametersDictionary setValue:@"qwerty123" forKey:@"password"];*/
    
    __block NSDictionary* response = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager PUT:url parameters:parametersDictionary success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
        code_global = r.statusCode;
        dispatch_semaphore_signal(semaphore);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return response;
    }
    return NULL;
}

-(NSDictionary *) UploadPhotoData:(NSData *)data url:(NSString *)url param:(NSDictionary *)param path:(NSURL *)path
{
    /*Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        PopUpViewController *pop = [[PopUpViewController alloc] init];
        [pop popup];
    } else {
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        /*NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
         [parametersDictionary setValue:@"ios2" forKey:@"login"];
         [parametersDictionary setValue:@"qwerty123" forKey:@"password"];*/
        
        /*__block NSDictionary* response = nil;
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        
        [manager PUT:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            //do not put image inside parameters dictionary as I did, but append it!
            
            //[formData appendPartWithFormData:data name:@"image"];
            [formData appendPartWithFileData:data name:@"image.jpg" fileName:@"photo.jpg" mimeType:@"image/jpeg"];
            
            dispatch_semaphore_signal(semaphore);
            //[formData appendPartWithFileData:imageData name:paramNameForImage fileName:@"photo.jpg" mimeType:@"image/jpeg"];
        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            response = responseObject;
            NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
            code_global = r.statusCode;
            dispatch_semaphore_signal(semaphore);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error: %@", error);
            dispatch_semaphore_signal(semaphore);}];
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return response;
    }
    return NULL;*/

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURL *filePath = path;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@", responseObject);
        }
    }];
    [uploadTask resume];
    
    return NULL;
    
    /*NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:path name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:nil
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    
    [uploadTask resume];
    return NULL;
    
    
    /*NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    
    [uploadTask resume];
    return NULL;*/
    
}

@end

