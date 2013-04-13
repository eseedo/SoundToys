//
//  ChapterSelection.h
//  CrazyMonk
//
//  Created by eseedo on 7/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChapterSelection : CCLayer {
  
  //各菜单选项的位置
  
  CGPoint backButtonLocation;
  
  CGPoint storeButtonLocation;
  
  //场景文字描述的位置
  CGPoint textLocation;
  
  //章节的位置
  CGPoint chapterLocation;
  
  //背景图片的位置
  CGPoint bgLocation;
  
  //屏幕大小
  CGSize size;
    
//所选场景
    int selectedToy;
    
    //设备类型（是否Iphone5)
     int deviceType;
    
    int scrollLayerOffset;
  
}

+(CCScene *) scene;

@end
