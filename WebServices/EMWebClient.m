//
//  EMWebClient.m
//  Kin
//
//  Created by Hasintha on 1/24/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMWebClient.h"

#define kWSHost @"http://kin.elegantsandbox.com/kin-webservice-doc/json/"

@implementation EMWebClient

static EMWebClient *sharedInstance = nil;

+(EMWebClient *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
}

-(void) startMethodLoading:(EMApiMethod *) method
{
    if (!loadingMethods)
        loadingMethods = [NSMutableArray new];
    
    [loadingMethods addObject:method];
    
    [self performJsonOperation:method processBlock:^(AFHTTPRequestOperation *operation,NSError *error,id JSON){
        
        if (error  == nil) {
            [method processResponse:JSON];
        }
        else
            [method processError:error];
    }];

    
}

-(void)performJsonOperation:(EMApiMethod *)method  processBlock:(void (^)(AFHTTPRequestOperation *operation,  NSError *error, id JSON)) process{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([[method httpMethod].uppercaseString isEqualToString:@"GET"]) {
        
        [manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            process(operation,nil,responseObject);
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            process(operation,error,nil);
            NSLog(@"Error: %@", error);
        }];
        
    }else if([[method httpMethod].uppercaseString isEqualToString:@"POST"]){
       
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"foo": @"bar"};
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        NSString *url = [NSString stringWithFormat:@"%@%@",kWSHost,method.serviceName];
        
        [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            process(operation,nil,responseObject);
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            process(operation,error,nil);
            NSLog(@"Error: %@", error);
        }];
    }
    
}



@end
