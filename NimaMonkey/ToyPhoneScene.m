//
//  ToyPhoneScene.m
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "ToyPhoneScene.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"


@implementation ToyPhoneScene

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    ToyPhoneScene *layer = [ToyPhoneScene node];
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
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
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
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_toyphone.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_toyphone-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
    
    
}

//添加卡通电话底图
-(void)addInstrument{
    CGSize size = [CCDirector sharedDirector].winSize;
    CCSprite *instrument = [CCSprite spriteWithFile:@"toyphone_base.png"];
    instrument.position = ccp(size.width/2,size.height*0.5);
    [self addChild:instrument z:0];
    
}
//添加电话按键菜单
-(void)addInstrumentKeys{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    
    //0-9数字按键
    CCMenuItemImage *key1 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key1.png" selectedImage:nil target:self selector:@selector(key1Pressed)];
    CCMenuItemImage *key2 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key2.png" selectedImage:nil target:self selector:@selector(key2Pressed)];
    CCMenuItemImage *key3 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key3.png" selectedImage:nil target:self selector:@selector(key3Pressed)];
    CCMenuItemImage *key4 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key4.png" selectedImage:nil target:self selector:@selector(key4Pressed)];
    CCMenuItemImage *key5 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key5.png" selectedImage:nil target:self selector:@selector(key5Pressed)];
    CCMenuItemImage *key6 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key6.png" selectedImage:nil target:self selector:@selector(key6Pressed)];
    CCMenuItemImage *key7 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key7.png" selectedImage:nil target:self selector:@selector(key7Pressed)];
    CCMenuItemImage *key8 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key8.png" selectedImage:nil target:self selector:@selector(key8Pressed)];
    CCMenuItemImage *key9 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key9.png" selectedImage:nil target:self selector:@selector(key9Pressed)];
    CCMenuItemImage *key0 = [CCMenuItemImage itemWithNormalImage:@"toyphone_key0.png" selectedImage:nil target:self selector:@selector(key0Pressed)];
    
    //星号和井号
    CCMenuItemImage *keyAsterik = [CCMenuItemImage itemWithNormalImage:@"toyphone_keyasteri.png" selectedImage:nil target:self selector:@selector(keyAsterikPressed)];
    CCMenuItemImage *keySharp = [CCMenuItemImage itemWithNormalImage:@"toyphone_keysharp.png" selectedImage:nil target:self selector:@selector(keySharpPressed)];
    
    //色块
    CCMenuItemImage *keyBlue = [CCMenuItemImage itemWithNormalImage:@"toyphone_bluekey.png" selectedImage:nil target:self selector:@selector(keyBluePressed)];
    CCMenuItemImage *keyOrange = [CCMenuItemImage itemWithNormalImage:@"toyphone_orangekey.png" selectedImage:nil target:self selector:@selector(keyOrangePressed)];
    CCMenuItemImage *keyRed = [CCMenuItemImage itemWithNormalImage:@"toyphone_redkey.png" selectedImage:nil target:self selector:@selector(keyRedPressed)];
    CCMenuItemImage *keyPurple = [CCMenuItemImage itemWithNormalImage:@"toyphone_purplekey.png" selectedImage:nil target:self selector:@selector(keyPurplePressed)];
    CCMenuItemImage *keyGreen = [CCMenuItemImage itemWithNormalImage:@"toyphone_greenkey.png" selectedImage:nil target:self selector:@selector(keyGreenPressed)];
    
    //话筒
        CCMenuItemImage *phoneHandle = [CCMenuItemImage itemWithNormalImage:@"phonehandle.png" selectedImage:nil target:self selector:@selector(handleTouched)];
    
    
    //设置色块的位置
    
    
    if(deviceType ==kDeviceTypeNotIphone5){
        //not iphone5 or new ipod touch
        
       
        key1.position = ccp(size.width*488/960 ,size.height*(640-258)/640);
        key2.position = ccp(size.width*565/960,size.height*(640-258)/640);
        key3.position = ccp(size.width*641/960 ,size.height*(640-258)/640);
        key4.position = ccp(size.width*488/960 ,size.height*(640-309)/640);
        key5.position = ccp(size.width*565/960 ,size.height*(640-309)/640);
        key6.position = ccp(size.width*641/960,size.height*(640-309)/640);
        key7.position = ccp(size.width*488/960,size.height*(640-359)/640);
        key8.position = ccp(size.width*565/960,size.height*(640-359)/640);
        key9.position = ccp(size.width*641/960,size.height*(640-359)/640);
        
         key0.position = ccp(size.width*565/960,size.height*(640-412)/640);
        
        keySharp.position = ccp(size.width*488/960,size.height*(640-412)/640);
        keyAsterik.position = ccp(size.width*641/960,size.height*(640-412)/640);
        
        
        key0.scale = 0.8;
        key1.scale = 0.8;
        key2.scale = 0.8;
        key3.scale = 0.8;
        key4.scale = 0.8;
        key5.scale = 0.8;
        key6.scale = 0.8;
        key7.scale = 0.8;
        key8.scale = 0.8;
        key9.scale = 0.8;
        keySharp.scale = 0.8;
        keyAsterik.scale = 0.8;
        phoneHandle.scale = 0.8;

        
        keyBlue.position = ccp(size.width*685/960 ,size.height*(640-485)/640);
        keyOrange.position = ccp(size.width*560/960,size.height*(640-155)/640);
        keyRed.position = ccp(size.width*750/960 ,size.height*(640-275)/640);
        keyPurple.position = ccp(size.width*360/960 ,size.height*(640-260)/640);
        keyGreen.position = ccp(size.width*414/960 ,size.height*(640-485)/640);
        
        phoneHandle.position = ccp(size.width*200/960,size.height/2);
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        //iphone 5 or new ipod touch
        
        key1.position = ccp(size.width*488/960 ,size.height*(640-258)/640);
        key2.position = ccp(size.width*550/960,size.height*(640-258)/640);
        key3.position = ccp(size.width*615/960 ,size.height*(640-258)/640);
        key4.position = ccp(size.width*488/960 ,size.height*(640-309)/640);
        key5.position = ccp(size.width*550/960 ,size.height*(640-309)/640);
        key6.position = ccp(size.width*615/960,size.height*(640-309)/640);
        key7.position = ccp(size.width*488/960,size.height*(640-359)/640);
        key8.position = ccp(size.width*550/960,size.height*(640-359)/640);
        key9.position = ccp(size.width*616/960,size.height*(640-359)/640);
        
        key0.position = ccp(size.width*550/960,size.height*(640-412)/640);
        
        keySharp.position = ccp(size.width*488/960,size.height*(640-412)/640);
        keyAsterik.position = ccp(size.width*615/960,size.height*(640-412)/640);
        
        
        key0.scale = 0.8;
        key1.scale = 0.8;
        key2.scale = 0.8;
        key3.scale = 0.8;
        key4.scale = 0.8;
        key5.scale = 0.8;
        key6.scale = 0.8;
        key7.scale = 0.8;
        key8.scale = 0.8;
        key9.scale = 0.8;
        keySharp.scale = 0.8;
        keyAsterik.scale = 0.8;
        phoneHandle.scale = 0.8;
        
        
        keyBlue.position = ccp(size.width*655/960 ,size.height*(640-485)/640);
        keyOrange.position = ccp(size.width*550/960,size.height*(640-155)/640);
        keyRed.position = ccp(size.width*720/960 ,size.height*(640-275)/640);
        keyPurple.position = ccp(size.width*380/960 ,size.height*(640-260)/640);
        keyGreen.position = ccp(size.width*430/960 ,size.height*(640-485)/640);
        
        phoneHandle.position = ccp(size.width*245/960,size.height/2);
    }
    

    
    CCMenu *menu = [CCMenu menuWithItems:key1,key2,key3,key4,key5,key6,key7,key8,key9,key0,keySharp,keyAsterik,keyGreen,keyBlue,keyRed,keyOrange,keyPurple,phoneHandle,nil];
    menu.position = ccp(0,0);
    [self addChild: menu z:1];
}

#pragma mark 按下数字键时的反应
-(void)key0Pressed{
    
    //key0 pressed
    
    CCLOG(@"key0 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number0.mp3" loop:NO];
}

-(void)key1Pressed{
    
    //key1 pressed
    
    CCLOG(@"key1 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number1.mp3" loop:NO];
}

-(void)key2Pressed{
    
    CCLOG(@"key2 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number2.mp3" loop:NO];
}

-(void)key3Pressed{
    CCLOG(@"key3 pressed");
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number3.mp3" loop:NO];
}

-(void)key4Pressed{
    
    CCLOG(@"key4 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number4.mp3" loop:NO];
}
-(void)key5Pressed{
    
    CCLOG(@"key5 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number5.mp3" loop:NO];
}
-(void)key6Pressed{
    
    CCLOG(@"key6 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number6.mp3" loop:NO];
}
-(void)key7Pressed{
    
    CCLOG(@"key7 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number7.mp3" loop:NO];
}
-(void)key8Pressed{
    
    CCLOG(@"key8 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number8.mp3" loop:NO];
}

-(void)key9Pressed{
    
    CCLOG(@"key9 pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"number9.mp3" loop:NO];
}

-(void)keyAsterikPressed{
    CCLOG(@"key asterik pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"hangon.mp3" loop:NO];
}

-(void)keySharpPressed{
    CCLOG(@"key sharp pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"hangon.mp3" loop:NO];
}

-(void)keyBluePressed{
    CCLOG(@"key blue pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"blue.wav" loop:NO];
}

-(void)keyOrangePressed{
    CCLOG(@"key orange pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"orange.wav" loop:NO];
}

-(void)keyRedPressed{
    CCLOG(@"key red pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"red.wav" loop:NO];
}

-(void)keyPurplePressed{
    CCLOG(@"key purple pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"purple.wav" loop:NO];
    
}

-(void)keyGreenPressed{
    
    CCLOG(@"key green pressed");
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"green.wav" loop:NO];
}

-(void)handleTouched{
    

    int random = arc4random()%6;

    
    CCLOG(@"handle touched");
    
    switch (random) {
        case 0:
          [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"ring.mp3" loop:NO];
            break;
            
        case 1:
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"busy.mp3"];
                  [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"busy.mp3" loop:NO];
            break;
        case 2:
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"dial.mp3"];
      [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"dial.mp3" loop:NO];
            break;
        case 3:
            
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error1.wav"];
                  [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error1.wav" loop:NO];
            break;
        case 4:
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error2.wav"];
                  [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error2.wav" loop:NO];
            break;
        case 5:
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error3.wav"];
                  [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"error3.wav" loop:NO];
            break;

        default:
            break;
    }
   
   
}

#pragma mark 初始化

-(id)init{
    if((self =[super init])){
        
        [self getDeviceType];
        
        [self addBackItem];
        [self addBackground];
        
        [self addInstrument];
        [self addInstrumentKeys];
    }
    return self;
    
}

@end
