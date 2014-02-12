//
//  EMApiLogin.m
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiLogin.h"

#define kLoginName @"edit_password.json"

@implementation EMApiLogin

-(id) initWithLogin:(NSString*) userName withPassword:(NSString *)password
{
    self = [super init];
    if (self)
    {
        self.serviceName = kLoginName;
    }
    return self;
}


-(void)start:(void (^)(int returnCode))cBlock
{
   
    self->completeBlock = cBlock;
    [self start];
}

-(NSDictionary *)queryParameters{
    
    return nil;
}

-(void)processResponse:(id)JSON{
    
    NSDictionary *jsonResult = JSON;
    NSString *status = [jsonResult objectForKey:@"status"];
    
    if ([status isEqualToString:@"successful"])
        completeBlock(YES);
    else
        completeBlock(NO);
}

-(void)processError:(NSError *)error{
    
    
}
@end
