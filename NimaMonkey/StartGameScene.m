//
//  StartGameScene.mm
//  CrazyMonk
//
//  Created by Ricky Wang on 7/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"

//#import "MyNotification.h"

enum{
  
  kTagStartBg = -100,
  kTagStartGameTitle = 1,
  kTagStartGameButton =2,
  kTagStartStoreButton =3,
  kTagStartAboutButton = 4,
  kTagStartSoundSettingButton =5,
  
}zOrderTag;

enum {
  //@notification
  kTagAlertForNotification = 2,
} AlertTag;


@implementation StartGameScene

#pragma mark 类方法

+(id)scene{
  
  CCScene *scene =[CCScene node];
  StartGameScene *layer = [StartGameScene node];
  [scene addChild:layer];
  return scene;
  
}


#pragma mark 获取屏幕大小
//获取屏幕大小

-(void)getScreenSize{
  
  screenSize = [CCDirector sharedDirector].winSize;
}


#pragma mark 添加菜单项
-(void)addStartMenu{
    
       CGSize size = [CCDirector sharedDirector].winSize;
    
    CCMenuItem *startItem = [CCMenuItemImage itemWithNormalImage:@"button_start.png" selectedImage:nil target:self selector:@selector(selectToyItemTouched)];
    startItem.position =ccp(size.width*0.45,size.height*0.6);
    
    CCMenu *menu = [CCMenu menuWithItems:startItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu z:2];
}

//添加游戏菜单项
-(void)addToysMenu{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    [CCMenuItemFont setFontName:@"ChalkboardSE-Bold"];
    [CCMenuItemFont setFontSize:20];
   

    
    CCMenuItemFont *item = [CCMenuItemFont itemWithString:@"Select a toy" target:self selector:@selector(selectToyItemTouched)];



    
    item.position = ccp(size.width*0.5,size.height*0.5);
    item.color = ccc3(16,174,231);
  

    
  CCMenu *menu =[CCMenu menuWithItems:item, nil];
  menu.position = CGPointZero;
  
  [self addChild:menu z:kTagStartGameButton];
  
}


-(void)selectToyItemTouched{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    
    [SceneManager goChapterSelect];
}



//添加about菜单项

-(void)addAboutItem{
  
  //创建菜单项
    

 CCMenuItem *aboutItem = [CCMenuItemImage itemWithNormalImage:@"button_about.png" selectedImage:nil target:self selector:@selector(about)];
  aboutItem.position =aboutMenuLocation;
  
  //创建菜单
  
  CCMenu *menu =[CCMenu menuWithItems:aboutItem, nil];
  menu.position = CGPointZero;
  [self addChild:menu z:kTagStartAboutButton];
  
}




//进入游戏介绍画面
-(void)about{
  [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
  [SceneManager goAboutScene];
  
}

#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addGameTitle{
  
  screenSize = [CCDirector sharedDirector].winSize;
  
  gameTitle = [CCLabelTTF labelWithString:@"Sound Toys" fontName:@"ChalkboardSE-Bold" fontSize:30];
//  gameTitle = [CCSprite spriteWithFile:@"title_iphone.png"];
  
  
    gameTitle.position =ccp(screenSize.width/2,screenSize.height*0.8);
    gameTitle.color = ccc3(16,174,231);
  
  [self addChild:gameTitle z:kTagStartGameTitle];
  
}

//添加背景图片
-(void)addBackground{
  
  [self getScreenSize];
    
    if(deviceType == kDeviceTypeIphone5OrNewTouch){
          bgGameStart = [CCSprite spriteWithFile:@"bg_main-iphone5.png"];
    }else if(deviceType == kDeviceTypeNotIphone5){
         bgGameStart = [CCSprite spriteWithFile:@"bg_main.png"];
    }
  

  bgGameStart.position = bgLocation;

  [self addChild:bgGameStart z:kTagStartBg];
  
}


#pragma mark 播放背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
  
    GameData *data = [GameData sharedData];
    if ( data.currentBackgroundMusicIndex != 0 ) {
        

            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"soft.mp3" loop:YES];
            data.currentBackgroundMusicIndex = 0;

        
    }else if(data.currentBackgroundMusicIndex ==0){
        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"soft.mp3" loop:YES];
            data.currentBackgroundMusicIndex = 0;
            
        }
    }
  
  
}

//stop
-(void)stopBackgroundMusic{
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
}

#pragma mark 设置菜单的位置

-(void)setMenuLocation{
  
  [self getScreenSize];
  
  soundMenuLocation = ccp( screenSize.width*0.92, screenSize.height*0.92);
  
  aboutMenuLocation = ccp(screenSize.width*0.75,screenSize.height*0.6);
  storeMenuLocation = ccp(screenSize.width*0.5,screenSize.height*0.3);
  playMenuLocation = ccp(screenSize.width*0.5,screenSize.height*0.4);
  
  titleLocation = ccp(screenSize.width*0.4,screenSize.height*0.65);
  bgLocation = ccp(screenSize.width*0.5,screenSize.height*0.5);
  
  adsLocation = ccp(0,screenSize.height);
  
}


//判断设备是否属于Iphone或最新ipod touch
-(void)judgeDeviceType{
    
    CGSize result = [[UIScreen mainScreen]bounds].size;
    if(result.height ==480){
        [GameData sharedData].isDeviceIphone5 = NO;
        deviceType = kDeviceTypeNotIphone5;
    }else if(result.height ==568){
        
        [GameData sharedData].isDeviceIphone5 = YES;
        deviceType = kDeviceTypeIphone5OrNewTouch;
    }
    

    
}


#pragma mark-场景初始化


-(id)init{
  
  if((self  =[super init])){
    
    //判断设备类型
      
      [self judgeDeviceType];
      
      [self getScreenSize];
    //推送
    
//    [self addPushNotification];
    
    //设置各视觉元素在屏幕中的位置
    
    [self setMenuLocation];
    
    //添加游戏标题和背景
    
//    [self addGameTitle];
    [self addBackground];
    
    //添加菜单选项
//      [self addToysMenu];
      
      [self addStartMenu];
    [self addAboutItem];

    
    //播放背景音乐
    [self playBackgroundMusic];


  }
  return self;
}


//push notification
-(void)addPushNotification{
    
    
    //@notification 新消息
    NSDictionary *dict = [MobClick getConfigParams];
    NSString *welcome = [dict objectForKey:WELCOME_UMENG];
    NSString *version = [dict objectForKey:VERSION_UMENG];
    
    NSString *version_now = [[NSUserDefaults standardUserDefaults] objectForKey:VERSION_LOCAL];
    
    if ( ![version_now isEqualToString:version] && [version length]>0) {
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:VERSION_LOCAL];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notification", nil) message:welcome delegate:self cancelButtonTitle:NSLocalizedString(@"later", nil) otherButtonTitles:NSLocalizedString(@"goto see", nil), nil];
        
        alertView.tag = kTagAlertForNotification;
        
        [alertView show];
        [alertView release];
    }
    
}

//umeng
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  if (buttonIndex!=[alertView cancelButtonIndex]) {
    
    //@notification
    if (alertView.tag==kTagAlertForNotification){
      if (buttonIndex == 1) {
        NSString *link = [MobClick getConfigParams:LINK_UMENG];
        NSURL *url = [NSURL URLWithString:link];
        [[UIApplication sharedApplication] openURL:url];
      }
    }
    
  }
}


@end
