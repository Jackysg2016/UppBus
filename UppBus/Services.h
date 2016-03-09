//
//  Created by David Ortega on 17/10/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"


#define BASE_URL @"https://mighty-plateau-9627.herokuapp.com/"

//URLS
#define LOGIN @"%@login"
#define SITES @"%@sites/%@"
#define RESOURCES @"%@resources/%@/%@"
#define FILE @"%@file/%@/%@?path=%@&name=%@"
#define ACCOUNT @"%@account/%@"
#define HANDSHAKE @"%@handshake"
#define PROFESORES @"%@profesores/%@"
#define NOTAS @"%@notas/%@"

typedef NS_ENUM(NSInteger, VUEnumServiceMethod) {
    VUServiceMethodPOST = 0,
    VUServiceMethodGET = 1,
    VUServiceMethodPUT = 2,
    VUServiceMethodDELETE = 3
} ;

@protocol ServicesDelegate <NSObject>

-(void) serviceDidFinishWithDictionary: (NSDictionary*) response;

@end

@interface Services : NSObject

@property (nonatomic, strong) id<ServicesDelegate> delegate;

- (void) callServiceURL: (NSString*) serviceURL withParams: (id) params
                 method: (VUEnumServiceMethod) method successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failureBlock: (void (^)(AFHTTPRequestOperation *operation, NSError *error))failure timeout: (CGFloat) timeout;

-(void) getImage: (NSString*) url successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failureBlock: (void (^)(AFHTTPRequestOperation *operation, NSError *error))failure timeout: (CGFloat) timeout;
@end

