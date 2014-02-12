//
//  EMApiMethods.m
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiMethod.h"

@implementation EMApiMethod

-(NSDictionary*) queryParameters
{
    return [@{} mutableCopy];
}

-(NSString*) httpMethod
{
    return @"POST";
}

-(NSString*) methodName
{
    NSAssert(false, @"This method shoul be implemented");
    return nil;
}

-(void) start
{
    [[EMWebClient sharedInstance] startMethodLoading:self];
}

-(void)start:(void (^)(BOOL))onComplete
{
    self->onSuccess = onComplete;
    [self start];
}
-(WebServiceType)webServiceType{
    return KWSNoramal;
}

-(void)processResponse:(id)JSON{
    
    if (onSuccess) onSuccess(YES);
}

-(void)processError:(NSError *)error{
    
     if (onSuccess) onSuccess(NO);
}
@end
