//
//  EMApiMethods.h
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMWebClient.h"

typedef enum {
    KWSNoramal,
    kWSDownload,
    kWSUpload
    
}WebServiceType;


@interface EMApiMethod : NSObject{
    //EMWebClient *client;
    void(^onSuccess)(BOOL);
    
}

@property(nonatomic,retain) NSString* serviceName;

-(void) start;
-(NSDictionary*) queryParameters;
-(NSString*) httpMethod;
-(NSString*) methodName;
-(void)processResponse:(id)JSON;
-(void)processError:(NSError *)error;
-(WebServiceType)webServiceType;
@end
