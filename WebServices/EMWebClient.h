//
//  EMWebClient.h
//  Kin
//
//  Created by Hasintha on 1/24/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "EMApiMethod.h"

typedef void (^JSONResponseBlock)(NSDictionary* json);

@interface EMWebClient : NSObject {
    
    

    NSMutableArray *loadingMethods;

}

+(EMWebClient *)sharedInstance;
-(void) startMethodLoading:(id) method;
@end
