//
//  EMApiRegister.m
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiRegister.h"

@implementation EMApiRegister

-(void)start:(void (^)(int returnCode))cBlock
{
    self->completeBlock = cBlock;
    [self start];
}

-(NSDictionary *)queryParameters{
    
    return nil;
}

-(void)processResponse:(id)JSON{
    
    
    completeBlock(YES);
}

-(void)processError:(NSError *)error{
    
    
}

@end