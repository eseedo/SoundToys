//
//  BubblePopping.h
//  NimaMonkey
//
//  Created by Ricky on 1/23/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BubblePopping : CCLayer {
    
    int deviceType;
    int pianoType;
    
    int touchedBubbleIndex;
    
    int numberOfBubbleTouched;
}

+(CCScene*)scene;
@end
