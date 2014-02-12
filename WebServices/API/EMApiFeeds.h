//
//  EMApiFeeds.h
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiMethod.h"

@interface EMApiFeeds : EMApiMethod{
    
    void(^completeBlock)(int);
}

- (id)initWithUserID:(NSString *)userID;
-(void)start:(void (^)(int returnCode))cBlock;
@end
