//
//  About.m
//  AngryPanda
//
//  Created by Ricky Wang on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "About.h"
#import "GameSounds.h"
#import "SceneManager.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"
#import "Constants.h"



@implementation About



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	About *layer = [About node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


//获取设备类型
-(void)getDeviceType{
    
    if([GameData sharedData].isDeviceIphone5 == NO){
        deviceType = kDeviceTypeNotIphone5;
    }else{
        deviceType = kDeviceTypeIphone5OrNewTouch;
    }
}

//返回游戏开始界面
-(void)backToStart{
  
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [SceneManager goStartGame];
  
}
//添加返回按钮
-(void)addBackItem{
  CGSize screenSize =[CCDirector sharedDirector].winSize;
  
  CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
  
  CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
  menuButton.position = ccp(screenSize.width*0.85,screenSize.height*0.85);
  [self addChild:menuButton z:1];
  
}

//添加背景图片
-(void)addBackground{
    
    
   CGSize  size = [CCDirector sharedDirector].winSize;
    
    if(deviceType == kDeviceTypeNotIphone5){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_common.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_common-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
}


//添加字幕
-(void)addTextLabel{
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //游戏标题
////    CCSprite *gameTitle = [CCSprite spriteWithFile:@"title_iphone.png"];
//        CCLabelTTF *gameTitle = [CCLabelTTF labelWithString:@"Sound Toys"  fontName:@"ChalkboardSE-Bold" fontSize:30];
//    gameTitle.position = ccp(screenSize.width/2,screenSize.height*-0.1);
//    gameTitle.color =ccc3(16,174,231);
//    
//    id titleAction = [CCSequence actions:[CCMoveTo actionWithDuration:6.0f  position:ccp(screenSize.width/2,screenSize.height*0.65)], nil];
//    
//    [gameTitle runAction:titleAction];
//    [self addChild:gameTitle];
//    
    
    //第一行 工作室
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"@Copyright Happy Bubsy 2013"  fontName:@"ChalkboardSE-Bold" fontSize:18];
    
    label1.position =ccp(screenSize.width/2,0);
    label1.color =ccc3(16,174,231);
    
    id moveAction1 = [CCSequence actions:[CCMoveTo actionWithDuration:6.0f  position:ccp(screenSize.width/2,screenSize.height*0.75)], nil];
    
    [label1 runAction:moveAction1];
    [self addChild:label1];
    
    //第二行 主策划
    
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"Designed by Bubsy Brother"  fontName:@"ChalkboardSE-Bold" fontSize:18];
    
    label2.position =ccp(screenSize.width/2,screenSize.height*-0.1);
      label2.color =ccc3(16,174,231);
    
    id moveAction2 = [CCSequence actions:[CCMoveTo actionWithDuration:6.0f  position:ccp(screenSize.width/2,screenSize.height*0.65)],nil];
    
    [label2 runAction:moveAction2];
    
    [self addChild:label2];
    
    //第三行 主美
    
    CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"Arts by Bubsy Sister" fontName:@"ChalkboardSE-Bold" fontSize:18];
    label3.position =ccp(screenSize.width/2,screenSize.height*-0.2);
      label3.color =ccc3(16,174,231);
    id moveAction3 = [CCSequence actions:[CCMoveTo actionWithDuration:6.0f  position:ccp(screenSize.width/2,screenSize.height*0.55)], nil];
    
    [label3 runAction:moveAction3];
    [self addChild:label3];
    

    
    
}


#pragma mark share

-(void)addShareButton{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    //创建分享按钮
    CCMenuItem *shareButton = [CCMenuItemSprite  itemWithNormalSprite:[CCSprite spriteWithFile:@"button_share.png"]   selectedSprite:nil target:self selector:@selector(shareButtonTouched)];
    shareButton.position = ccp(size.width*0.5,size.height*-0.6);
    
    CCMenu *menu = [CCMenu menuWithItems:shareButton, nil];
    menu.position = ccp(0,0);
 [self addChild:menu z:3];
    
    id action = [CCMoveTo actionWithDuration:6.0 position:ccp(size.width*0.5,size.height*0.3)];
    [shareButton runAction:action];
    
    

    
}


-(void)shareButtonTouched{
    
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(shareToSocialNetwork)] ,nil]];
    [[SimpleAudioEngine sharedEngine]playEffect:@"share.wav"];
}

-(void)shareToSocialNetwork{
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    BOOL isSystemVersionAfter6 = NO;
    if([systemVersion isEqualToString:@"6.0"] || [systemVersion isEqualToString:@"6.0.1"] || [systemVersion isEqualToString:@"6.1"]|| [systemVersion isEqualToString:@"6.1.1"]|| [systemVersion isEqualToString:@"6.1.2"]|| [systemVersion isEqualToString:@"6.1.3"])  {
        isSystemVersionAfter6 = YES;
    }
    
    NSLog(@"systemversion is:%@",systemVersion);
    
    if(isSystemVersionAfter6){
        
        NSString *initialText = [NSString stringWithFormat:@"I found a great app for lovely kids,enjoy it:) @ihappybubsy"];
        
        UIActivityViewController *activityViewController =
        [[UIActivityViewController alloc] initWithActivityItems:@[initialText] applicationActivities:nil];
        [[[CCDirector sharedDirector]parentViewController]  presentViewController:activityViewController animated:YES completion:nil];
    }
    else{
        NSURL *url = [NSURL URLWithString:@"mailto://eseedo@gmail.com"];
        [[UIApplication sharedApplication]openURL:url];
    }
}


#pragma mark title



//访问作者的新浪微博链接（非微博sdk分享）
-(void)visitMySinaMicroBlog{
  
  NSURL *url = [NSURL URLWithString:@"http://weibo.com/eseedo"];
  [[UIApplication sharedApplication]openURL:url];
  
}


//给作者写邮件
-(void)mailToMe{
  NSURL *url = [NSURL URLWithString:@"mailto://eseedo@gmail.com"];
  [[UIApplication sharedApplication] openURL:url];
}


//music


-(void)updateMusic:(ccTime)time{
  
  int soundChoice = (arc4random()%5);
  
  switch (soundChoice)
  {
    case 0:
       [[SimpleAudioEngine sharedEngine]playEffect:@"saveme.mp3"];
      break;
    case 1:
      [[SimpleAudioEngine sharedEngine]playEffect:@"magic3.mp3"];
    case 2:
      [[SimpleAudioEngine sharedEngine]playEffect:@"magic2.mp3"];
      
    case 3:
      [[SimpleAudioEngine sharedEngine]playEffect:@"attack-add2.mp3"];
      
    case 4:
         [[SimpleAudioEngine sharedEngine]playEffect:@"magic1-2.mp3"];
      
    default:
      [[SimpleAudioEngine sharedEngine]playEffect:@"saveme.mp3"];
      break;
    
  }
}


//背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
  
  GameData *data = [GameData sharedData];
  if ( data.backgroundMusicMuted == NO ) {
    
    if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
    {
      
      [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_cartoon.mp3" loop:YES];
    }
    
  }
  
  
}

//场景初始化


-(id)init{
  if((self = [super init])){
      
      [self getDeviceType];
      
    [self addBackground];
    [self addBackItem];
    
    [self addTextLabel];
      
      [self addShareButton];
    [self playBackgroundMusic];
    
//    [self schedule:@selector(updateMusic:) interval:6.0f];
    
  }
  return self;
  
}



@end
