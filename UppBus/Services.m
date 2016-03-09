//
//  Created by David Ortega on 17/10/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "Services.h"
#import "AFNetworkActivityIndicatorManager.h"



@implementation Services

-(void) getImage: (NSString*) url successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failureBlock: (void (^)(AFHTTPRequestOperation *operation, NSError *error))failure timeout: (CGFloat) timeout {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer = [AFImageResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        failure(operation, error);
    }];

    
}
- (void) callServiceURL: (NSString*) serviceURL withParams: (id) params
                 method: (VUEnumServiceMethod) method successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failureBlock: (void (^)(AFHTTPRequestOperation *operation, NSError *error))failure timeout: (CGFloat) timeout {
    
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/javascript", @"application/hal+json", @"application/javascript",  nil];
    
    
   // [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
   // [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer.timeoutInterval = timeout;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;


    
    if (method==VUServiceMethodGET)
        [manager GET:serviceURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            success(operation, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            failure(operation, error);
        }];
    else if (method==VUServiceMethodPOST) {
        [manager POST:serviceURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            success(operation, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            failure(operation, error);
        }];
    } else if (method==VUServiceMethodPUT)
        [manager PUT:serviceURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            success(operation, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            failure(operation, error);
        }];
    else if (method==VUServiceMethodDELETE)
        [manager DELETE:serviceURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            success(operation, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
            [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
            failure(operation, error);
        }];

}

@end
