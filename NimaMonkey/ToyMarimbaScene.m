//
//  ToyMarimbaScene.m
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "ToyMarimbaScene.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"

@implementation ToyMarimbaScene{
    
    CGPoint key1Position;
    CGPoint key2Position;
    CGPoint key3Position;
    CGPoint key4Position;
    CGPoint key5Position;
    CGPoint key6Position;
    CGPoint key7Position;
    CGPoint key8Position;
    
}

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    ToyMarimbaScene *layer = [ToyMarimbaScene node];
    [scene addChild:layer];
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
    [SceneManager goChapterSelect];
    
}
//添加返回按钮
-(void)addBackItem{
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = ccp(screenSize.width*0.85,screenSize.height*0.85);
    [self addChild:menuButton z:1];
    
}

-(void)addBackground{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    if(deviceType == kDeviceTypeNotIphone5){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_marimaba.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_marimaba-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
 
    
}

-(void)setMenuLocation{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    if(deviceType ==kDeviceTypeNotIphone5){
        
        key1Position = ccp(size.width*0.054,size.height*0.4);
        key2Position = ccp(size.width*0.182,size.height*0.4);
        key3Position = ccp(size.width*0.292,size.height*0.4);
        key4Position = ccp(size.width*0.401,size.height*0.4);
        key5Position = ccp(size.width*0.531,size.height*0.4);
        key6Position= ccp(size.width*0.6458,size.height*0.4);
        key7Position = ccp(size.width*0.771,size.height*0.4);
        key8Position = ccp(size.width*0.885,size.height*0.4);
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        key1Position = ccp(size.width*0.1496,size.height*0.4);
        key2Position = ccp(size.width*0.246,size.height*0.4);
        key3Position = ccp(size.width*0.343,size.height*0.4);
        key4Position = ccp(size.width*0.44,size.height*0.4);
        key5Position = ccp(size.width*0.541,size.height*0.4);
        key6Position = ccp(size.width*0.647,size.height*0.4);
        key7Position = ccp(size.width*0.748,size.height*0.4);
        key8Position = ccp(size.width*0.854,size.height*0.4);
    }

    
}

//添加木琴底图
-(void)addInstrument{
    CGSize size = [CCDirector sharedDirector].winSize;
    CCSprite *instrument = [CCSprite spriteWithFile:@"marimba_base.png"];
    instrument.position = ccp(size.width/2,size.height*0.4);
    [self addChild:instrument z:-1];
    
}
//添加琴键菜单
-(void)addInstrumentKeys{
    
    
    CCMenuItemImage *key1 = [CCMenuItemImage itemWithNormalImage:@"marimba_key1.png" selectedImage:nil target:self selector:@selector(key1Pressed)];
    CCMenuItemImage *key2 = [CCMenuItemImage itemWithNormalImage:@"marimba_key2.png" selectedImage:nil target:self selector:@selector(key2Pressed)];
    CCMenuItemImage *key3 = [CCMenuItemImage itemWithNormalImage:@"marimba_key3.png" selectedImage:nil target:self selector:@selector(key3Pressed)];
    CCMenuItemImage *key4 = [CCMenuItemImage itemWithNormalImage:@"marimba_key4.png" selectedImage:nil target:self selector:@selector(key4Pressed)];
    CCMenuItemImage *key5 = [CCMenuItemImage itemWithNormalImage:@"marimba_key5.png" selectedImage:nil target:self selector:@selector(key5Pressed)];
    CCMenuItemImage *key6 = [CCMenuItemImage itemWithNormalImage:@"marimba_key6.png" selectedImage:nil target:self selector:@selector(key6Pressed)];
    CCMenuItemImage *key7 = [CCMenuItemImage itemWithNormalImage:@"marimba_key7.png" selectedImage:nil target:self selector:@selector(key7Pressed)];
    CCMenuItemImage *key8 = [CCMenuItemImage itemWithNormalImage:@"marimba_key8.png" selectedImage:nil target:self selector:@selector(key8Pressed)];

    
    key1.position = key1Position;
    key2.position = key2Position;
    key3.position = key3Position;
    key4.position = key4Position;
    key5.position = key5Position;
    key6.position = key6Position;
    key7.position = key7Position;
    key8.position = key8Position;

    
    CCMenu *menu = [CCMenu menuWithItems:key1,key2,key3,key4,key5,key6,key7,key8, nil];
    menu.position = ccp(0,0);
    [self addChild: menu z:1];
}

#pragma mark 按下琴键时的反应
-(void)key1Pressed{
    
    //key1 pressed
    
    CCLOG(@"key1 pressed");
    [[SimpleAudioEngine sharedEngine]playEffect:@"marimba1.mp3"];
    
    [self showParticleEffect:key1Position];
}

-(void)key2Pressed{
    
        CCLOG(@"key2 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba2.mp3"];
    
    [self showParticleEffect:key2Position];
}

-(void)key3Pressed{
     CCLOG(@"key3 pressed");
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba3.mp3"];
    [self showParticleEffect:key3Position];
}

-(void)key4Pressed{
    
     CCLOG(@"key4 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba4.mp3"];
    [self showParticleEffect:key4Position];
}
-(void)key5Pressed{
    
     CCLOG(@"key5 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba5.mp3"];
    [self showParticleEffect:key5Position];
}
-(void)key6Pressed{
    
     CCLOG(@"key6 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba6.mp3"];
    [self showParticleEffect:key6Position];
}
-(void)key7Pressed{
    
     CCLOG(@"key7 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba7.mp3"];
    [self showParticleEffect:key7Position];
}
-(void)key8Pressed{
    
     CCLOG(@"key8 pressed");
      [[SimpleAudioEngine sharedEngine]playEffect:@"marimba8.mp3"];
    [self showParticleEffect:key8Position];
}

//
-(void)addBackgroundMusic{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"bgmarimbashort.mp3"];
}

#pragma mark 粒子效果

-(void)showParticleEffect:(CGPoint)particlePosition{
    
    NSString *textureName;
      int randomIndex = arc4random()%3;
    switch (randomIndex) {
        case 0:
            textureName = @"sign1.png";
            break;
        case 1:
            textureName = @"sign2.png";
            break;
        case 2:
            textureName = @"sign3.png";
            break;
            
        default:
            textureName = @"sign1.png";
            break;
    }
    
    CCParticleSystemQuad *particle = [CCParticleSystemQuad particleWithFile:@"particle.plist"];
  
    
    particle.position = particlePosition;
    particle.autoRemoveOnFinish = YES;
    particle.duration = 0.5;
    
    
    particle.texture = [[CCTextureCache sharedTextureCache]addImage:textureName];
    
    [self addChild:particle z:5];
    
    
    
}


#pragma mark 初始化

-(id)init{
    if((self =[super init])){
        
        [self getDeviceType];
        [self setMenuLocation];
        
        [self addBackItem];
        [self addBackground];
        
        [self addInstrument];
        [self addInstrumentKeys];
        
        [self addBackgroundMusic];
    }
    return self;
    
}

@end
