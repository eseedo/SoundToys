//
//  PlayFireworks.m
//  NimaMonkey
//
//  Created by Ricky on 1/29/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "PlayFireworks.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"


@implementation PlayFireworks{
    
    CGPoint touchLocation;
    
    CCSprite *firework1;
    CCSprite *firework2;
    CCSprite *firework3;
    CCSprite *firework4;
    CCSprite *firework5;
    CCSprite *firework6;
    CCSprite *firework7;
    CCSprite *firework8;
    CCSprite *firework9;
    CCSprite *firework10;
    
    //
    int  numberOfFireworks;
    
    BOOL canAddNewFireworks;
}


+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    PlayFireworks *layer = [PlayFireworks node];
    [scene addChild:layer];
    return scene;
}



#pragma mark 获取设备类型

//获取设备类型
-(void)getDeviceType{
    
    if([GameData sharedData].isDeviceIphone5 == NO){
        deviceType = kDeviceTypeNotIphone5;
    }else{
        deviceType = kDeviceTypeIphone5OrNewTouch;
    }
}

#pragma mark 设置视觉元素的位置



//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    
    [SceneManager goChapterSelect];
    
}
//添加返回按钮
-(void)addBackItem{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton, nil];
    menuButton.position =  ccp(size.width*0.85,size.height*0.85);
    [self addChild:menuButton z:5];
    
}

#pragma mark 添加其它视觉元素



-(void)checkFireworkNumber:(ccTime)dt{
    
    if(numberOfFireworks < 4){
        canAddNewFireworks = YES;
    }else {
        canAddNewFireworks = NO;
    }
    
}



-(void)addLabel{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *intro = [CCLabelTTF labelWithString:@"Touch the screen" fontName:@"ChalkboardSE-Bold" fontSize:20];
    intro.position = ccp(size.width/2,size.height*0.5);
    intro.scale = 0;
    [self addChild:intro z:1];
    
    
    id scaleUpAction = [CCScaleTo actionWithDuration:1 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:3];
    
    [intro runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(removeLabel:)], nil]];
    
    
}

-(void)removeLabel:(id)sender{
    
    CCLabelTTF *label = (CCLabelTTF*)sender;
    [self removeChild:label cleanup:YES];
    
}

-(void)addBackgroundPic{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    //not iphone5
    
    if(deviceType == kDeviceTypeNotIphone5){
        
    CCSprite *bg = [CCSprite spriteWithFile:@"cartoonnight.png"];
    bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        CCSprite *bg = [CCSprite spriteWithFile:@"cartoonnight-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
}

-(void)playFireworksSound1{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"firework01.mp3"];
    
}

-(void)playFireworksSound2{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"firework02.mp3"];
    
}

-(void)playFireworksSound3{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"firework03.mp3"];
    
}

-(void)playFireworksSound4{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"firework04.mp3"];
    
}

-(void)playFireworksSound5{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"firework05.mp3"];
    
}
-(void)playParticleEffect11{
    
    //烟花1
    CCParticleSystemQuad *particle =[CCParticleSystemQuad particleWithFile:@"firework02.plist"];
    
    [self addChild:particle z:1];
    particle.position = touchLocation;
    [self playFireworksSound5];
    
}

-(void)playParticleEffect1{
    
    //烟花1
    firework1 = [CCSprite spriteWithFile:@"firework01.png"];
    firework1.scale = 0;
    firework1.position = touchLocation;
    
    [self addChild:firework1 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:2 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:2];
    
    [firework1 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound2];
}

-(void)playParticleEffect2{
    
    //烟花2
    firework2 = [CCSprite spriteWithFile:@"firework02.png"];
    
    firework2.scale = 0;
    firework2.position = touchLocation;
    
    [self addChild:firework2 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:2 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:2];
    
    
    [firework2 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound2];
}

-(void)playParticleEffect3{
    
    //烟花3
    firework3 = [CCSprite spriteWithFile:@"firework03.png"];
    
    firework3.scale = 0;
    firework3.position = touchLocation;
    
    [self addChild:firework3 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:0.9];
    id fadeOutAction = [CCFadeOut actionWithDuration:3];
    
    
    [firework3 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound2];
    
}
-(void)playParticleEffect4{
    
    //烟花4
    firework4 = [CCSprite spriteWithFile:@"firework04.png"];
    firework4.scale = 0;
    firework4.position = touchLocation;
    
    [self addChild:firework4 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:4];
    
    
    [firework4 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound3];
    
    
}

-(void)playParticleEffect5{
    
    
    //烟花5
    firework5 = [CCSprite spriteWithFile:@"firework05.png"];
    firework5.scale = 0;
    firework5.position = touchLocation;
    
    [self addChild:firework5 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    [firework5 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound5];
    
}

-(void)playParticleEffect6{
    
    //烟花6
    firework6 = [CCSprite spriteWithFile:@"firework06.png"];
    firework6.scale = 0;
    firework6.position = touchLocation;
    
    [self addChild:firework6 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:4 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    [firework6 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound5];
    
}
-(void)playParticleEffect7{
    
    //烟花7
    firework7 = [CCSprite spriteWithFile:@"firework07.png"];
    firework7.scale = 0;
    firework7.position = touchLocation;
    
    [self addChild:firework7 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    [firework7 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound5];
    
}

-(void)playParticleEffect8{
    
    
    //烟花8
    firework8 = [CCSprite spriteWithFile:@"firework08.png"];
    firework8.scale = 0;
    firework8.position = touchLocation;
    
    [self addChild:firework8 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    
    [firework8 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound3];
    
}

-(void)playParticleEffect9{
    
    
    //烟花9
    firework9 = [CCSprite spriteWithFile:@"firework09.png"];
    firework9.scale = 0;
    
    firework9.position = touchLocation;
    
    [self addChild:firework9 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    
    [firework9 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound4];
    
}


-(void)playParticleEffect10{
    
    
    //烟花10
    firework10 = [CCSprite spriteWithFile:@"firework10.png"];
    firework10.scale = 0;
    firework10.position = touchLocation;
    
    [self addChild:firework10 z:1];
    
    id scaleUpAction = [CCScaleTo actionWithDuration:3 scale:1.1];
    
    id fadeOutAction = [CCFadeOut actionWithDuration:5];
    
    
    
    [firework10 runAction:[CCSequence actions:scaleUpAction,fadeOutAction,[CCCallFunc actionWithTarget:self selector:@selector(disappear:)], nil]];
    [self playFireworksSound2];
    
}

-(void)disappear:(id)sender{
    
    CCSprite *sprite = (CCSprite *)sender;
    
    [self removeChild:sprite cleanup:YES];
    
    numberOfFireworks --;
    
    //    sprite = nil;
    
    
    
}

-(void)registerWithTouchDispatcher{
    
    CCDirector *director = [CCDirector sharedDirector];
    [[director touchDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
    
    return YES;
    
}


-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector]convertToGL:touchLocation];
    touchLocation =[self convertToNodeSpace:touchLocation];
    
    int effectIndex = arc4random()%8;
    
    //   [self playParticleEffect1];
    ////
    if(canAddNewFireworks == YES){
        
        numberOfFireworks ++;
        
        switch (effectIndex) {
            case 0:
                [self playParticleEffect1];
                break;
            case 1:
                [self playParticleEffect2];
                break;
            case 2:
                [self playParticleEffect3];
                break;
            case 3:
                [self playParticleEffect4];
                break;
            case 4:
                [self playParticleEffect5];
                break;
            case 5:
                [self playParticleEffect6];
                break;
            case 6:
                [self playParticleEffect7];
                break;
            case 7:
                [self playParticleEffect8];
                break;
            case 8:
                [self playParticleEffect9];
                break;
            case 9:
                [self playParticleEffect10];
                break;
            case 10:
                [self playParticleEffect11];
                break;
                
            default:
                [self playParticleEffect1];
                break;
        }
        
    }
    
}

-(void)playBackgroundMusic{
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bgfireworks.mp3" loop:YES];
    
}

#pragma mark 初始化 方法

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        [self getDeviceType];
        
        [self addBackItem];
        
        [self addLabel];
        self.isTouchEnabled = YES;
        
        [self addBackgroundPic];
        
        [self playBackgroundMusic];
        
        [self schedule:@selector(checkFireworkNumber:) interval:0.2];
        
	}
	return self;
}







@end
