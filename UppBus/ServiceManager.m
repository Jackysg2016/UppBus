//
//  ServiceManager.m
//
//  Created by Pablo García-Nieto Rodríguez  on 3/7/15.
//

#import "ServiceManager.h"
#import "Services.h"
#import "NNLoginManager.h"

@implementation ServiceManager

- (void) LoginWithDNI:(NSString*)dni andClau:(NSString*)clau succesBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = LOGIN;;
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:@{@"dni":dni, @"clau":clau} method:VUServiceMethodPOST successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}

- (void) HandshakeWithTDp:(NSString*)TDp andJSESSIONID:(NSString*)JSESSIONID succesBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = HANDSHAKE;
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:@{@"TDp":TDp, @"JSESSIONID":JSESSIONID} method:VUServiceMethodPOST successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}

- (void) GetSites:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = SITES;
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL, [[[NNLoginManager sharedInstance] loggedInUser] objectForKey:@"token"]];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:nil method:VUServiceMethodGET successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}

- (void) GetResourcesForSite:(NSString*)site andPath:(NSString*)path_ successBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = RESOURCES;
    NSString *decodedPath = [self stringByDecodingURLFormat:path_];

    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL, [[[NNLoginManager sharedInstance] loggedInUser] objectForKey:@"token"], site];
    Services* services = [[Services alloc] init];

    [services callServiceURL:finalURL withParams:@{@"path":decodedPath} method:VUServiceMethodGET successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}
- (void) GetAccount:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = ACCOUNT;
    
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL, [[[NNLoginManager sharedInstance] loggedInUser] objectForKey:@"token"]];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:nil method:VUServiceMethodGET successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}
- (void) GetProfesores:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = PROFESORES;
    
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL, [[[NNLoginManager sharedInstance] loggedInUser] objectForKey:@"token"]];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:nil method:VUServiceMethodGET successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}
- (void) GetNotas:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock{
    NSString* path = NOTAS;
    
    NSString* finalURL = [NSString stringWithFormat:path, BASE_URL, [[[NNLoginManager sharedInstance] loggedInUser] objectForKey:@"token"]];
    Services* services = [[Services alloc] init];
    
    [services callServiceURL:finalURL withParams:nil method:VUServiceMethodGET successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(@YES);
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error);
    } timeout:20.0];
}
- (NSString *)stringByDecodingURLFormat:(NSString*)s
{
    NSString *result = [s stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByRemovingPercentEncoding];
    return result;
}

+ (instancetype)sharedInstance
{
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ServiceManager alloc] init];
    });
    return sharedInstance;
}
@end
