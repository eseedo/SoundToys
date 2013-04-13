//
//  ToyBellScene.h
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ToyBellScene : CCLayer {
    
    //是否摇晃
    bool shake_once;
    
    //设备类型（是否Iphone5)
    int deviceType;
    
    CCSprite *bell;
}
+(CCScene*)scene;
@end
