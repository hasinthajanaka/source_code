//
//  EMApiForgotPassword.h
//  Kin
//
//  Created by Hasintha on 1/28/14.
//  Copyright (c) 2014 Hasintha. All rights reserved.
//

#import "EMApiMethod.h"

@interface EMApiForgotPassword : EMApiMethod{
    
    void(^completeBlock)(int);
    
}


@end
