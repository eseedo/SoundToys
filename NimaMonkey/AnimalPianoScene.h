//
//  BirdPianoScene.h
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface AnimalPianoScene : CCLayer {
    
    int deviceType;
    int pianoType;
    int touchLocation;

}
+(CCScene*)scene;
@end
