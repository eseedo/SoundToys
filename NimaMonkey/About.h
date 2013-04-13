//
//  About.h
//  AngryPanda
//
//  Created by Ricky Wang on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface About : CCLayer {
  
  
  double curTime;
  double nextTime;
    
    //设备类型（是否Iphone5)
    int deviceType;
}
+(CCScene *) scene;



@end
