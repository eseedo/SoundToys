//
//  RattleDrum.h
//  NimaMonkey
//
//  Created by Ricky on 2/3/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface RattleDrum : CCLayer {
    
    
    //是否摇晃
    bool shake_once;
    
    
    CCSprite *drum;
    
    //设备类型（是否Iphone5)
    int deviceType;
    
}
+(CCScene*)scene;

@end
