//
//  BellScene.h
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BellScene : CCLayer {
    
    //是否摇晃
    bool shake_once;
    
    
    CCSprite *bell;
    
    //设备类型（是否Iphone5)
    int deviceType;
}
+(CCScene*)scene;
@end
