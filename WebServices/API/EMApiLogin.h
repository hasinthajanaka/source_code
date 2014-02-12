//
//  EMApiLogin.h
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMApiMethod.h"

@interface EMApiLogin: EMApiMethod{
    
    void(^completeBlock)(int);

}
-(id) initWithLogin:(NSString*) userName withPassword:(NSString *)password;
-(void)start:(void (^)(int returnCode))cBlock;

@end
