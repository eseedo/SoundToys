//
//  StartGameScene.h
//  CrazyMonk
//
//  Created by Ricky Wang on 7/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/*
 
 该场景为游戏开始画面，在加载logo和默认画面后，玩家会看到此画面。
 
 通过此画面，玩家可以选择开始游戏、进入商城、查看开发者信息，并可以设置开启或关闭游戏中的音效。
 
 */

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UmengConfig.h"



@interface StartGameScene : CCLayer {
  
  //背景
  CCSprite *bgGameStart;
  
  //游戏标题
  CCSprite *gameTitle;
  
  //屏幕大小
  CGSize screenSize;
  
  //三个按钮
  
  
  //音效设置
  
  CCMenu* soundMenu;
  
  
  //位置信息
  
  CGPoint soundMenuLocation;
  
  
  CGPoint aboutMenuLocation;
  CGPoint storeMenuLocation;
  CGPoint playMenuLocation;
  
  CGPoint titleLocation;
  CGPoint bgLocation;
  
  CGPoint adsLocation;
  
    //设备类型
    int deviceType;
  
}

+(CCScene *) scene;



@end
