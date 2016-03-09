//
//
//
//  Created by Pablo García-Nieto Rodríguez  on 3/7/15.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject
- (void) LoginWithDNI:(NSString*)dni andClau:(NSString*)clau succesBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) GetSites:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) GetResourcesForSite:(NSString*)site andPath:(NSString*)path_ successBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) GetAccount:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) HandshakeWithTDp:(NSString*)TDp andJSESSIONID:(NSString*)JSESSIONID succesBlock:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) GetProfesores:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;
- (void) GetNotas:(void (^)(id responseObject))successBlock failureBlock:(void (^)(id responseObject))failureBlock;

+ (id)sharedInstance;
@end
