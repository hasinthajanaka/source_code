//
//  EMApiFeeds.m
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiFeeds.h"

@implementation EMApiFeeds

- (id)initWithUserID:(NSString *)userID
{
    self = [super init];
    if (self) {
        self.serviceName = @"get_news_feed.json";
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
    NSArray *feeds = [jsonResult objectForKey:@"result"];
    
    for (NSDictionary *val in feeds) {
        
        
    }
    completeBlock(YES);
}

-(void)processError:(NSError *)error{
    
    
}

@end
