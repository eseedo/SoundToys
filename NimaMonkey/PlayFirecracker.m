//
//  PlayFirecracker.m
//  NimaMonkey
//
//  Created by Ricky on 2/4/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "PlayFirecracker.h"

#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"


@implementation PlayFirecracker{
    
    CGPoint touchLocation;
    

    
    CCMenuItem *boyItem;
    CCMenuItem *girlItem;
    CCMenuItem *snowmanItem;
    CCMenuItem *firecrackerItem;
    
    CCMenu *spriteMenu;
    
    CGPoint boyPosition;
    CGPoint girlPosition;
    CGPoint firecrackerPosition;
    CGPoint snowmanPosition;
    
}


+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    PlayFirecracker *layer = [PlayFirecracker node];
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
-(void)setMenuLocation{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    boyPosition = ccp(size.width*160/960,size.height*180/640);
    girlPosition = ccp(size.width*760/960,size.height*240/640);
    firecrackerPosition = ccp(size.width/2,size.height*0.6);
    snowmanPosition = ccp(size.width*0.35,size.height*0.6);
    
    
}


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


-(void)addBackgroundPic{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    //not iphone5
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_firecrack.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_firecrack-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
}

-(void)addSpriteMenu{
    
    
    boyItem = [CCMenuItemImage itemWithNormalImage:@"firecrack_boy.png" selectedImage:nil disabledImage:nil target:self selector:@selector(boyTouched)];
    girlItem = [CCMenuItemImage itemWithNormalImage:@"firecrack_girl.png" selectedImage:nil disabledImage:nil target:self selector:@selector(girlTouched)];
    firecrackerItem = [CCMenuItemImage itemWithNormalImage:@"firecracker.png" selectedImage:nil disabledImage:nil target:self selector:@selector(firecrackerTouched)];
    
    snowmanItem = [CCMenuItemImage itemWithNormalImage:@"snowman.png" selectedImage:nil target:self selector:@selector(snowmanTouched)];
    
    
    
    boyItem.position = boyPosition;
    girlItem.position = girlPosition;
    firecrackerItem.position = firecrackerPosition;
    snowmanItem.position = snowmanPosition;
    
    spriteMenu = [CCMenu menuWithItems:boyItem,girlItem,firecrackerItem, snowmanItem, nil];
    spriteMenu.position = ccp(0,0);
    
    [self addChild:spriteMenu z:3];
    
//    CCSprite *snowman =[CCSprite spriteWithFile:@"snowman.png"];
//    snowman.position = snowmanPosition;
//    [self addChild:snowman z:2];
//    
}

-(void)boyTouched{
 
    //play sound
    [self playBoySound];
    
    //play aniamation
    
    [self playBoyAnimation];
}

-(void)playBoySound{
    
    int soundIndex = arc4random()%2;
    
    switch (soundIndex) {
        case 0:
            [[SimpleAudioEngine sharedEngine]playEffect:@"boylaugh01.mp3"];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine]playEffect:@"boylaugh02.mp3"];
            break;
            
        default:
            [[SimpleAudioEngine sharedEngine]playEffect:@"boylaugh01.mp3"];
            break;
    }
}

-(void)playBoyAnimation{
    
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:boyPosition];
    [boyItem runAction:[CCSequence actions:action1,action2, nil]];
    
}

-(void)girlTouched{
    
    //play sound
    [self playGirlSound];
    
    //play aniamation
    [self playGirlAnimation];
}

-(void)playGirlSound{
    
    int soundIndex = arc4random()%3;
    
    switch (soundIndex) {
        case 0:
            [[SimpleAudioEngine sharedEngine]playEffect:@"girllaugh01.mp3"];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine]playEffect:@"girllaugh02.mp3"];
            break;
        case 2:
            [[SimpleAudioEngine sharedEngine]playEffect:@"girllaugh03.mp3"];
            break;
            
        default:
            [[SimpleAudioEngine sharedEngine]playEffect:@"girllaugh01.mp3"];
            break;
    }
}

-(void)playGirlAnimation{
    
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:girlPosition];
    [girlItem runAction:[CCSequence actions:action1,action2, nil]];
    
}
-(void)snowmanTouched{
    
    //play sound
    [self playSnowmanSound];
    
    //play aniamation
    [self playSnowmanAnimation];
}

-(void)playSnowmanSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"snowmanlaugh.mp3"];
}

-(void)playSnowmanAnimation{
    
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:snowmanPosition];
    [snowmanItem runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)firecrackerTouched{
    
    //play sound
    [self playFirecrackerSound];
    
    //play aniamation
//    [self playFirecrackerAnimation];
    
    [self playParticleEffectFirecracker];
}

-(void)playFirecrackerSound{
    
    int soundIndex = arc4random()%2;
    
    switch (soundIndex) {
        case 0:
            [[SimpleAudioEngine sharedEngine]playEffect:@"firecracker01.mp3"];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine]playEffect:@"firecracker02.mp3"];
            break;
            
        default:
            [[SimpleAudioEngine sharedEngine]playEffect:@"firecracker01.mp3"];
            break;
    }
    

    
}
-(void)playParticleEffectFirecracker{
    CGSize size =[CCDirector sharedDirector].winSize;
    
    //烟花1
    CCParticleSystemQuad *particle =[CCParticleSystemQuad particleWithFile:@"firecracker01.plist"];
    particle.position = ccp(size.width/2,size.height*0.15);
    particle.duration = 2;
    particle.autoRemoveOnFinish = YES;
    
    [self addChild:particle z:5];


}

-(void)playFirecrackerAnimation{
    
    id action1 = [CCScaleTo actionWithDuration:5 scale:0.1];
    id action2 = [CCFadeOut actionWithDuration:1];
    id action3 = [CCFadeIn actionWithDuration:1];
    id action4 = [CCScaleTo actionWithDuration:0.1 scale:1];
    
    [firecrackerItem runAction:[CCSequence actions:action1,action2,action3,action4, nil]];
    
}

-(void)playParticleEffectSnow{
    
    
    NSString *textureName;
    int randomIndex = arc4random()%5;
    switch (randomIndex) {
        case 0:
            textureName = @"snow1.png";
            break;
        case 1:
            textureName = @"snow2.png";
            break;
        case 2:
            textureName = @"snow3.png";
            break;
        case 3:
            textureName = @"snow4.png";
            break;
        case 4:
            textureName = @"snow5.png";
            break;
            
        default:
            textureName = @"snow1.png";
            break;
    }

    //烟花1
    CCParticleSnow *snow = [CCParticleSnow node];
    
      snow.duration = 1;
    snow.autoRemoveOnFinish = YES;
    snow.position = touchLocation;
    snow.texture = [[CCTextureCache sharedTextureCache]addImage:textureName];
    
    CCLOG(@"下雪了");
    
    [self addChild:snow z:5];
    

    
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
    
    [self playParticleEffectSnow];
    //play sound

    
}

-(void)playBackgroundMusic{
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_firecracker.mp3" loop:YES];
    
}

#pragma mark 初始化 方法

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        [self getDeviceType];
        
        [self setMenuLocation];
        
        [self addBackItem];
        
//        [self addLabel];
        [self addSpriteMenu];
        
        [self addBackgroundPic];
        
        [self playBackgroundMusic];
        self.isTouchEnabled = YES;

        
	}
	return self;
}





@end
