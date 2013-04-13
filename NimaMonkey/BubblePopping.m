//
//  BubblePopping.m
//  NimaMonkey
//
//  Created by Ricky on 1/23/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "BubblePopping.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"

@implementation BubblePopping{
    //视觉元素
    CCSprite *sceneBg;

    
    //第1排泡泡
    
    CCMenuItemImage *bubble1_1;
    CCMenuItemImage *bubble1_2;
    CCMenuItemImage *bubble1_3;
    CCMenuItemImage *bubble1_4;
    CCMenuItemImage *bubble1_5;
    CCMenuItemImage *bubble1_6;
    CCMenuItemImage *bubble1_7;
    
    //第2排泡泡

    CCMenuItemImage *bubble2_1;
    CCMenuItemImage *bubble2_2;
    CCMenuItemImage *bubble2_3;
    CCMenuItemImage *bubble2_4;
    CCMenuItemImage *bubble2_5;
    CCMenuItemImage *bubble2_6;
    CCMenuItemImage *bubble2_7;
    
    //第3排泡泡
    
    
    CCMenuItemImage *bubble3_1;
    CCMenuItemImage *bubble3_2;
    CCMenuItemImage *bubble3_3;
    CCMenuItemImage *bubble3_4;
    CCMenuItemImage *bubble3_5;
    CCMenuItemImage *bubble3_6;
    CCMenuItemImage *bubble3_7;
    
    CCMenu *bubbleMenu1_1;
    CCMenu *bubbleMenu1_2;
    CCMenu *bubbleMenu1_3;
    CCMenu *bubbleMenu1_4;
    CCMenu *bubbleMenu1_5;
    CCMenu *bubbleMenu1_6;
    CCMenu *bubbleMenu1_7;
    
    CCMenu *bubbleMenu2_1;
    CCMenu *bubbleMenu2_2;
    CCMenu *bubbleMenu2_3;
    CCMenu *bubbleMenu2_4;
    CCMenu *bubbleMenu2_5;
    CCMenu *bubbleMenu2_6;
    CCMenu *bubbleMenu2_7;
    
    CCMenu *bubbleMenu3_1;
    CCMenu *bubbleMenu3_2;
    CCMenu *bubbleMenu3_3;
    CCMenu *bubbleMenu3_4;
    CCMenu *bubbleMenu3_5;
    CCMenu *bubbleMenu3_6;
    CCMenu *bubbleMenu3_7;

    
    //音效设置
    
    CCMenu* soundMenu;
    
    //位置信息
    
    CGPoint soundMenuLocation;
    
    //视觉元素的位置
    
    CGPoint sceneBgPosition;

    
    CGPoint backButtonPosition;
    
    CGPoint bubble1_1Position;
    CGPoint bubble1_2Position;
    CGPoint bubble1_3Position;
    CGPoint bubble1_4Position;
    CGPoint bubble1_5Position;
    CGPoint bubble1_6Position;
    CGPoint bubble1_7Position;
    
    CGPoint bubble2_1Position;
    CGPoint bubble2_2Position;
    CGPoint bubble2_3Position;
    CGPoint bubble2_4Position;
    CGPoint bubble2_5Position;
    CGPoint bubble2_6Position;
    CGPoint bubble2_7Position;

    CGPoint bubble3_1Position;
    CGPoint bubble3_2Position;
    CGPoint bubble3_3Position;
    CGPoint bubble3_4Position;
    CGPoint bubble3_5Position;
    CGPoint bubble3_6Position;
    CGPoint bubble3_7Position;
    
    
    //泡泡是否压破
    BOOL bubble1_1Wrapped;
    BOOL bubble1_2Wrapped;
    BOOL bubble1_3Wrapped;
    BOOL bubble1_4Wrapped;
    BOOL bubble1_5Wrapped;
    BOOL bubble1_6Wrapped;
    BOOL bubble1_7Wrapped;
    
    BOOL bubble2_1Wrapped;
    BOOL bubble2_2Wrapped;
    BOOL bubble2_3Wrapped;
    BOOL bubble2_4Wrapped;
    BOOL bubble2_5Wrapped;
    BOOL bubble2_6Wrapped;
    BOOL bubble2_7Wrapped;
    
    BOOL bubble3_1Wrapped;
    BOOL bubble3_2Wrapped;
    BOOL bubble3_3Wrapped;
    BOOL bubble3_4Wrapped;
    BOOL bubble3_5Wrapped;
    BOOL bubble3_6Wrapped;
    BOOL bubble3_7Wrapped;
    
}



+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    BubblePopping *layer = [BubblePopping node];
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
    
    sceneBgPosition = ccp(size.width*0.5,size.height*0.5);

    backButtonPosition = ccp(size.width*0.85,size.height*0.85);
    
    soundMenuLocation = ccp(size.width*0.1,size.height*0.85);
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        bubble1_1Position =ccp(0,0);
        bubble1_2Position =ccp(size.width*167/960,0);
        bubble1_3Position=ccp(size.width*333/960,0);
        bubble1_4Position=ccp(size.width*497/960,0);
        bubble1_5Position=ccp(size.width*657/960,0);
        bubble1_6Position=ccp(size.width*822/960,0);

        
        bubble2_1Position=ccp(0,size.height*(640-475)/640);
        bubble2_2Position=ccp(size.width*167/960,size.height*(640-475)/640);
        bubble2_3Position=ccp(size.width*333/960,size.height*(640-475)/640);
        bubble2_4Position=ccp(size.width*497/960,size.height*(640-475)/640);
        bubble2_5Position=ccp(size.width*657/960,size.height*(640-475)/640);
        bubble2_6Position=ccp(size.width*822/960,size.height*(640-475)/640);

        
        bubble3_1Position=ccp(0,size.height*(640-294)/640);
        bubble3_2Position=ccp(size.width*167/960,size.height*(640-294)/640);
        bubble3_3Position=ccp(size.width*333/960,size.height*(640-294)/640);
        bubble3_4Position=ccp(size.width*497/960,size.height*(640-294)/640);
        bubble3_5Position=ccp(size.width*657/960,size.height*(640-294)/640);
        bubble3_6Position=ccp(size.width*822/960,size.height*(640-294)/640);

        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        
        
        bubble1_1Position =ccp(0,0);
        bubble1_2Position =ccp(size.width*167/1136,0);
        bubble1_3Position=ccp(size.width*333/1136,0);
        bubble1_4Position=ccp(size.width*497/1136,0);
        bubble1_5Position=ccp(size.width*657/1136,0);
        bubble1_6Position=ccp(size.width*822/1136,0);
        bubble1_7Position=ccp(size.width*990/1136,0);
        
        bubble2_1Position=ccp(0,size.height*(640-475)/640);
        bubble2_2Position=ccp(size.width*167/1136,size.height*(640-475)/640);
        bubble2_3Position=ccp(size.width*333/1136,size.height*(640-475)/640);
        bubble2_4Position=ccp(size.width*497/1136,size.height*(640-475)/640);
        bubble2_5Position=ccp(size.width*657/1136,size.height*(640-475)/640);
        bubble2_6Position=ccp(size.width*822/1136,size.height*(640-475)/640);
        bubble2_7Position=ccp(size.width*990/1136,size.height*(640-475)/640);
        
        bubble3_1Position=ccp(0,size.height*(640-294)/640);
        bubble3_2Position=ccp(size.width*167/1136,size.height*(640-294)/640);
        bubble3_3Position=ccp(size.width*333/1136,size.height*(640-294)/640);
        bubble3_4Position=ccp(size.width*497/1136,size.height*(640-294)/640);
        bubble3_5Position=ccp(size.width*657/1136,size.height*(640-294)/640);
        bubble3_6Position=ccp(size.width*822/1136,size.height*(640-294)/640);
        bubble3_7Position=ccp(size.width*990/1136,size.height*(640-294)/640);
    }
    

    
    
}

//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    [SceneManager goChapterSelect];
    
}
//添加返回按钮
-(void)addBackItem{
    
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = backButtonPosition;
    [self addChild:menuButton z:1];
    
}


#pragma mark 添加其它视觉元素

-(void)addBackground{
    
    
    if(deviceType == kDeviceTypeNotIphone5){
        sceneBg = [CCSprite spriteWithFile:@"bg_bubblepop.png"];
        sceneBg.position = sceneBgPosition;
        [self addChild:sceneBg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        sceneBg= [CCSprite spriteWithFile:@"bg_bubblepop-iphone5.png"];
        sceneBg.position = sceneBgPosition;
        [self addChild:sceneBg z:-1];
    }
    
    
    
}

#pragma mark 添加泡泡

//第1排泡泡，最下面的一排

-(void)addBubble1_1{
    
    if(bubble1_1Wrapped == NO){
        
        bubble1_1 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_1Wrapped == YES){
        
        bubble1_1 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_1.tag = kTagBubbleIndex1_1;
    
    
    //anchorpoint
    
    bubble1_1.anchorPoint = ccp(0,0);
    
    //position
    bubble1_1.position = bubble1_1Position;
    
    bubbleMenu1_1 = [CCMenu menuWithItems:bubble1_1, nil];
    bubbleMenu1_1.position = ccp(0,0);
    [self addChild:bubbleMenu1_1 z:2];
    
}
-(void)addBubble1_2{
    
    if(bubble1_2Wrapped == NO){
        
        bubble1_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_2Wrapped == YES){
        
        bubble1_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_2.tag = kTagBubbleIndex1_2;
    
    //anchorpoint
    
    bubble1_2.anchorPoint = ccp(0,0);
    
    //position
    bubble1_2.position = bubble1_2Position;
    
    bubbleMenu1_2 = [CCMenu menuWithItems:bubble1_2, nil];
    bubbleMenu1_2.position = ccp(0,0);
    [self addChild:bubbleMenu1_2 z:2];
    
}

-(void)addBubble1_3{
    
    if(bubble1_3Wrapped == NO){
        
        bubble1_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_3Wrapped == YES){
        
        bubble1_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_3.tag = kTagBubbleIndex1_3;
    
    //anchorpoint
    
    bubble1_3.anchorPoint = ccp(0,0);
    
    //position
    bubble1_3.position = bubble1_3Position;
    
    bubbleMenu1_3 = [CCMenu menuWithItems:bubble1_3, nil];
    bubbleMenu1_3.position = ccp(0,0);
    [self addChild:bubbleMenu1_3 z:2];
    
}
-(void)addBubble1_4{
    
    if(bubble1_4Wrapped == NO){
        
        bubble1_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_4Wrapped == YES){
        
        bubble1_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_4.tag = kTagBubbleIndex1_4;
    
    //anchorpoint
    
    bubble1_4.anchorPoint = ccp(0,0);
    
    //position
    bubble1_4.position = bubble1_4Position;
    
    bubbleMenu1_4 = [CCMenu menuWithItems:bubble1_4, nil];
    bubbleMenu1_4.position = ccp(0,0);
    [self addChild:bubbleMenu1_4 z:2];
    
}
-(void)addBubble1_5{
    
    if(bubble1_5Wrapped == NO){
        
        bubble1_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_5Wrapped == YES){
        
        bubble1_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_5.tag = kTagBubbleIndex1_5;
    
    //anchorpoint
    
    bubble1_5.anchorPoint = ccp(0,0);
    
    //position
    bubble1_5.position = bubble1_5Position;
    
    bubbleMenu1_5 = [CCMenu menuWithItems:bubble1_5, nil];
    bubbleMenu1_5.position = ccp(0,0);
    [self addChild:bubbleMenu1_5 z:2];
    
}

-(void)addBubble1_6{
    
    if(bubble1_6Wrapped == NO){
        
        bubble1_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_6Wrapped == YES){
        
        bubble1_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_6.tag = kTagBubbleIndex1_6;
    
    //anchorpoint
    
    bubble1_6.anchorPoint = ccp(0,0);
    
    //position
    bubble1_6.position = bubble1_6Position;
    
    bubbleMenu1_6 = [CCMenu menuWithItems:bubble1_6, nil];
    bubbleMenu1_6.position = ccp(0,0);
    [self addChild:bubbleMenu1_6 z:2];
    
}
-(void)addBubble1_7{
    
    if(bubble1_7Wrapped == NO){
        
        bubble1_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble1_7Wrapped == YES){
        
        bubble1_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble1_7.tag = kTagBubbleIndex1_7;
    
    //anchorpoint
    
    bubble1_7.anchorPoint = ccp(0,0);
    
    //position
    bubble1_7.position = bubble1_7Position;
    
    bubbleMenu1_7 = [CCMenu menuWithItems:bubble1_7, nil];
    bubbleMenu1_7.position = ccp(0,0);
    [self addChild:bubbleMenu1_7 z:2];
    
}
#pragma mark 第2排泡泡（中间）
-(void)addBubble2_1{
    
    if(bubble2_1Wrapped == NO){
        
        bubble2_1 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_1Wrapped == YES){
        
        bubble2_1 =[CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_1.tag = kTagBubbleIndex2_1;
    
    //anchorpoint
    
    bubble2_1.anchorPoint = ccp(0,0);
    
    //position
    bubble2_1.position = bubble2_1Position;
    
    bubbleMenu2_1 = [CCMenu menuWithItems:bubble2_1, nil];
    bubbleMenu2_1.position = ccp(0,0);
    [self addChild:bubbleMenu2_1 z:2];
    
}
-(void)addBubble2_2{
    
    if(bubble2_2Wrapped == NO){
        
        bubble2_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_2Wrapped == YES){
        
        bubble2_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_2.tag = kTagBubbleIndex2_2;
    
    //anchorpoint
    
    bubble2_2.anchorPoint = ccp(0,0);
    
    //position
    bubble2_2.position = bubble2_2Position;
    
    bubbleMenu2_2 = [CCMenu menuWithItems:bubble2_2, nil];
    bubbleMenu2_2.position = ccp(0,0);
    [self addChild:bubbleMenu2_2 z:2];
    
}

-(void)addBubble2_3{
    
    if(bubble2_3Wrapped == NO){
        
        bubble2_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_3Wrapped == YES){
        
        bubble2_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_3.tag = kTagBubbleIndex2_3;
    
    //anchorpoint
    
    bubble2_3.anchorPoint = ccp(0,0);
    
    //position
    bubble2_3.position = bubble2_3Position;
    
    bubbleMenu2_3 = [CCMenu menuWithItems:bubble2_3, nil];
    bubbleMenu2_3.position = ccp(0,0);
    [self addChild:bubbleMenu2_3 z:2];
    
}
-(void)addBubble2_4{
    
    if(bubble2_4Wrapped == NO){
        
        bubble2_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_4Wrapped == YES){
        
        bubble2_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_4.tag = kTagBubbleIndex2_4;
    
    //anchorpoint
    
    bubble2_4.anchorPoint = ccp(0,0);
    
    //position
    bubble2_4.position = bubble2_4Position;
    
    bubbleMenu2_4 = [CCMenu menuWithItems:bubble2_4, nil];
    bubbleMenu2_4.position = ccp(0,0);
    [self addChild:bubbleMenu2_4 z:2];
    
}
-(void)addBubble2_5{
    
    if(bubble2_5Wrapped == NO){
        
        bubble2_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_5Wrapped == YES){
        
        bubble2_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_5.tag = kTagBubbleIndex2_5;
    
    //anchorpoint
    
    bubble2_5.anchorPoint = ccp(0,0);
    
    //position
    bubble2_5.position = bubble2_5Position;
    
    bubbleMenu2_5 = [CCMenu menuWithItems:bubble2_5, nil];
    bubbleMenu2_5.position = ccp(0,0);
    [self addChild:bubbleMenu2_5 z:2];
    
}

-(void)addBubble2_6{
    
    if(bubble2_6Wrapped == NO){
        
        bubble2_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_6Wrapped == YES){
        
        bubble2_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_6.tag = kTagBubbleIndex2_6;
    
    //anchorpoint
    
    bubble2_6.anchorPoint = ccp(0,0);
    
    //position
    bubble2_6.position = bubble2_6Position;
    
    bubbleMenu2_6 = [CCMenu menuWithItems:bubble2_6, nil];
    bubbleMenu2_6.position = ccp(0,0);
    [self addChild:bubbleMenu2_6 z:2];
    
}
-(void)addBubble2_7{
    
    if(bubble2_7Wrapped == NO){
        
        bubble2_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble2_7Wrapped == YES){
        
        bubble2_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble2_7.tag = kTagBubbleIndex2_7;
    
    //anchorpoint
    
    bubble2_7.anchorPoint = ccp(0,0);
    
    //position
    bubble2_7.position = bubble2_7Position;
    
    bubbleMenu2_7 = [CCMenu menuWithItems:bubble2_7, nil];
    bubbleMenu2_7.position = ccp(0,0);
    [self addChild:bubbleMenu2_7 z:2];
    
}

#pragma mark 第3排泡泡（最上面）
-(void)addBubble3_1{
    
    if(bubble3_1Wrapped == NO){
        
        bubble3_1 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_1Wrapped == YES){
        
        bubble3_1 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_1.tag = kTagBubbleIndex3_1;
    
    //anchorpoint
    
    bubble3_1.anchorPoint = ccp(0,0);
    
    //position
    bubble3_1.position = bubble3_1Position;
    
    bubbleMenu3_1 = [CCMenu menuWithItems:bubble3_1, nil];
    bubbleMenu3_1.position = ccp(0,0);
    [self addChild:bubbleMenu3_1 z:2];
    
}
-(void)addBubble3_2{
    
    if(bubble3_2Wrapped == NO){
        
        bubble3_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_2Wrapped == YES){
        
        bubble3_2 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_2.tag = kTagBubbleIndex3_2;
    
    //anchorpoint
    
    bubble3_2.anchorPoint = ccp(0,0);
    
    //position
    bubble3_2.position = bubble3_2Position;
    
    bubbleMenu3_2 = [CCMenu menuWithItems:bubble3_2, nil];
    bubbleMenu3_2.position = ccp(0,0);
    [self addChild:bubbleMenu3_2 z:2];
    
}

-(void)addBubble3_3{
    
    if(bubble3_3Wrapped == NO){
        
        bubble3_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_3Wrapped == YES){
        
        bubble3_3 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_3.tag = kTagBubbleIndex3_3;
    
    //anchorpoint
    
    bubble3_3.anchorPoint = ccp(0,0);
    
    //position
    bubble3_3.position = bubble3_3Position;
    
    bubbleMenu3_3 = [CCMenu menuWithItems:bubble3_3, nil];
    bubbleMenu3_3.position = ccp(0,0);
    [self addChild:bubbleMenu3_3 z:2];
    
}
-(void)addBubble3_4{
    
    if(bubble3_4Wrapped == NO){
        
        bubble3_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_4Wrapped == YES){
        
        bubble3_4 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_4.tag = kTagBubbleIndex3_4;
    
    //anchorpoint
    
    bubble3_4.anchorPoint = ccp(0,0);
    
    //position
    bubble3_4.position = bubble3_4Position;
    
    bubbleMenu3_4 = [CCMenu menuWithItems:bubble3_4, nil];
    bubbleMenu3_4.position = ccp(0,0);
    [self addChild:bubbleMenu3_4 z:2];
    
}
-(void)addBubble3_5{
    
    if(bubble3_5Wrapped == NO){
        
        bubble3_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_5Wrapped == YES){
        
        bubble3_5 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_5.tag = kTagBubbleIndex3_5;
    
    //anchorpoint
    
    bubble3_5.anchorPoint = ccp(0,0);
    
    //position
    bubble3_5.position = bubble3_5Position;
    
    bubbleMenu3_5 = [CCMenu menuWithItems:bubble3_5, nil];
    bubbleMenu3_5.position = ccp(0,0);
    [self addChild:bubbleMenu3_5 z:2];
    
}

-(void)addBubble3_6{
    
    if(bubble3_6Wrapped == NO){
        
        bubble3_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_6Wrapped == YES){
        
        bubble3_6 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_6.tag = kTagBubbleIndex3_6;
    
    //anchorpoint
    
    bubble3_6.anchorPoint = ccp(0,0);
    
    //position
    bubble3_6.position = bubble3_6Position;
    
    bubbleMenu3_6 = [CCMenu menuWithItems:bubble3_6, nil];
    bubbleMenu3_6.position = ccp(0,0);
    [self addChild:bubbleMenu3_6 z:2];
    
}
-(void)addBubble3_7{
    
    if(bubble3_7Wrapped == NO){
        
        bubble3_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_origin.png" selectedImage:nil target:self selector:@selector(bubbleTouched:)];
    }else if(bubble3_7Wrapped == YES){
        
        bubble3_7 = [CCMenuItemImage itemWithNormalImage:@"bubble_poped.png" selectedImage:nil];
    }
    
    //tag
    bubble3_7.tag = kTagBubbleIndex3_7;
    
    //anchorpoint
    
    bubble3_7.anchorPoint = ccp(0,0);
    
    //position
    bubble3_7.position = bubble3_7Position;
    
    bubbleMenu3_7 = [CCMenu menuWithItems:bubble3_7, nil];
    bubbleMenu3_7.position = ccp(0,0);
    [self addChild:bubbleMenu3_7 z:2];
    
}


-(void)addBubbles{
    
    //添加第1排泡泡（最下面）
    [self addBubble1_1];
    [self addBubble1_2];
    [self addBubble1_3];
    [self addBubble1_4];
    [self addBubble1_5];
    [self addBubble1_6];

    //添加第2排泡泡（中间）
    [self addBubble2_1];
    [self addBubble2_2];
    [self addBubble2_3];
    [self addBubble2_4];
    [self addBubble2_5];
    [self addBubble2_6];

    //添加第3排泡泡（最上面）
    [self addBubble3_1];
    [self addBubble3_2];
    [self addBubble3_3];
    [self addBubble3_4];
    [self addBubble3_5];
    [self addBubble3_6];

    
    
    
    
 if(deviceType == kDeviceTypeIphone5OrNewTouch){//如果是iphone5，则添加新的泡泡
              
     [self addBubble1_7];
     [self addBubble2_7];
     [self addBubble3_7];
 }
    
}

#pragma mark 特殊音效

#pragma mark 按下泡泡时的反应
-(void)bubbleTouched:(id)sender{
    
    CCMenuItemImage *bubbleTouched =(CCMenuItemImage *)sender;
    
    touchedBubbleIndex = bubbleTouched.tag;
    
    switch (touchedBubbleIndex) {
        case kTagBubbleIndex1_1:
            if(bubbleMenu1_1 != nil){
                
             
                [self removeChild:bubbleMenu1_1 cleanup:YES];
                   bubbleMenu1_1 = nil;
                bubble1_1Wrapped = YES;
                [self addBubble1_1];
            }
            break;
        case kTagBubbleIndex1_2:
            if(bubbleMenu1_2 != nil){
                
                
                [self removeChild:bubbleMenu1_2 cleanup:YES];
                bubbleMenu1_2 = nil;
                bubble1_2Wrapped = YES;
                [self addBubble1_2];
            }
            break;
        case kTagBubbleIndex1_3:
            if(bubbleMenu1_3 != nil){
                
                
                [self removeChild:bubbleMenu1_3 cleanup:YES];
                bubbleMenu1_3 = nil;
                bubble1_3Wrapped = YES;
                [self addBubble1_3];
            }
            break;
        case kTagBubbleIndex1_4:
            if(bubbleMenu1_4 != nil){
                
                
                [self removeChild:bubbleMenu1_4 cleanup:YES];
                bubbleMenu1_4 = nil;
                bubble1_4Wrapped = YES;
                [self addBubble1_4];
            }
            break;
        case kTagBubbleIndex1_5:
            if(bubbleMenu1_5 != nil){
                
                
                [self removeChild:bubbleMenu1_5 cleanup:YES];
                bubbleMenu1_5 = nil;
                bubble1_5Wrapped = YES;
                [self addBubble1_5];
            }
            break;
        case kTagBubbleIndex1_6:
            if(bubbleMenu1_6 != nil){
                
                
                [self removeChild:bubbleMenu1_6 cleanup:YES];
                bubbleMenu1_6 = nil;
                bubble1_6Wrapped = YES;
                [self addBubble1_6];
            }
            break;
        case kTagBubbleIndex1_7:
            if(bubbleMenu1_7 != nil){
                
                
                [self removeChild:bubbleMenu1_7 cleanup:YES];
                bubbleMenu1_7 = nil;
                bubble1_7Wrapped = YES;
                [self addBubble1_7];
            }
            break;
            
        case kTagBubbleIndex2_1:
            if(bubbleMenu2_1 != nil){
                
                
                [self removeChild:bubbleMenu2_1 cleanup:YES];
                bubbleMenu2_1 = nil;
                bubble2_1Wrapped = YES;
                [self addBubble2_1];
            }
            break;
        case kTagBubbleIndex2_2:
            if(bubbleMenu2_2 != nil){
                
                
                [self removeChild:bubbleMenu2_2 cleanup:YES];
                bubbleMenu2_2 = nil;
                bubble2_2Wrapped = YES;
                [self addBubble2_2];
            }
            break;
        case kTagBubbleIndex2_3:
            if(bubbleMenu2_3 != nil){
                
                
                [self removeChild:bubbleMenu2_3 cleanup:YES];
                bubbleMenu2_3 = nil;
                bubble2_3Wrapped = YES;
                [self addBubble2_3];
            }
            break;
        case kTagBubbleIndex2_4:
            if(bubbleMenu2_4 != nil){
                
                
                [self removeChild:bubbleMenu2_4 cleanup:YES];
                bubbleMenu2_4 = nil;
                bubble2_4Wrapped = YES;
                [self addBubble2_4];
            }
            break;
        case kTagBubbleIndex2_5:
            if(bubbleMenu2_5 != nil){
                
                
                [self removeChild:bubbleMenu2_5 cleanup:YES];
                bubbleMenu2_5 = nil;
                bubble2_5Wrapped = YES;
                [self addBubble2_5];
            }
            break;
        case kTagBubbleIndex2_6:
            if(bubbleMenu2_6 != nil){
                
                
                [self removeChild:bubbleMenu2_6 cleanup:YES];
                bubbleMenu2_6 = nil;
                bubble2_6Wrapped = YES;
                [self addBubble2_6];
            }
            break;
        case kTagBubbleIndex2_7:
            if(bubbleMenu2_7 != nil){
                
                
                [self removeChild:bubbleMenu2_7 cleanup:YES];
                bubbleMenu2_7 = nil;
                bubble2_7Wrapped = YES;
                [self addBubble2_7];
            }
            break;
            
        case kTagBubbleIndex3_1:
            if(bubbleMenu3_1 != nil){
                
                
                [self removeChild:bubbleMenu3_1 cleanup:YES];
                bubbleMenu3_1 = nil;
                bubble3_1Wrapped = YES;
                [self addBubble3_1];
            }
            break;
        case kTagBubbleIndex3_2:
            if(bubbleMenu3_2 != nil){
                
                
                [self removeChild:bubbleMenu3_2 cleanup:YES];
                bubbleMenu3_2 = nil;
                bubble3_2Wrapped = YES;
                [self addBubble3_2];
            }
            break;
        case kTagBubbleIndex3_3:
            if(bubbleMenu3_3 != nil){
                
                
                [self removeChild:bubbleMenu3_3 cleanup:YES];
                bubbleMenu3_3 = nil;
                bubble3_3Wrapped = YES;
                [self addBubble3_3];
            }
            break;
        case kTagBubbleIndex3_4:
            if(bubbleMenu3_4 != nil){
                
                
                [self removeChild:bubbleMenu3_4 cleanup:YES];
                bubbleMenu3_4 = nil;
                bubble3_4Wrapped = YES;
                [self addBubble3_4];
            }
            break;
        case kTagBubbleIndex3_5:
            if(bubbleMenu3_5 != nil){
                
                
                [self removeChild:bubbleMenu3_5 cleanup:YES];
                bubbleMenu3_5 = nil;
                bubble3_5Wrapped = YES;
                [self addBubble3_5];
            }
            break;
        case kTagBubbleIndex3_6:
            if(bubbleMenu3_6 != nil){
                
                
                [self removeChild:bubbleMenu3_6 cleanup:YES];
                bubbleMenu3_6 = nil;
                bubble3_6Wrapped = YES;
                [self addBubble3_6];
            }
            break;
        case kTagBubbleIndex3_7:
            if(bubbleMenu3_7 != nil){
                
                
                [self removeChild:bubbleMenu3_7 cleanup:YES];
                bubbleMenu3_7 = nil;
                bubble3_7Wrapped = YES;
                [self addBubble3_7];
            }
            break;
            
        default:
            if(bubbleMenu1_1 != nil){
                
                
                [self removeChild:bubbleMenu1_1 cleanup:YES];
                bubbleMenu1_1 = nil;
                bubble1_1Wrapped = YES;
                [self addBubble1_1];
            }
            break;
    }
    
    int randomEffectIndex = arc4random()%10;
    
    if(numberOfBubbleTouched ==5){
        switch (randomEffectIndex) {
            case 0:
                  [[SimpleAudioEngine sharedEngine]playEffect:@"fart2.mp3"];
                break;
            case 1:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
            case 2:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubble.mp3"];
                break;
            case 3:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby1.mp3"];
                break;
            case 4:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby2.mp3"];
                break;
            case 5:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby3.mp3"];
            case 6:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
            case 7:
                [[SimpleAudioEngine sharedEngine]playEffect:@"cat.wav"];
                break;
            case 8:
                [[SimpleAudioEngine sharedEngine]playEffect:@"ring.mp3"];
            case 9:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                
            default:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
        }
    
    }else if(numberOfBubbleTouched == 10){
        
        switch (randomEffectIndex) {
            case 0:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart2.mp3"];
                break;
            case 1:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
            case 2:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubble.mp3"];
                break;
            case 3:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby1.mp3"];
                break;
            case 4:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby2.mp3"];
                break;
            case 5:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby3.mp3"];
            case 6:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
            case 7:
                [[SimpleAudioEngine sharedEngine]playEffect:@"cat.wav"];
                break;
            case 8:
                [[SimpleAudioEngine sharedEngine]playEffect:@"ring.mp3"];
            case 9:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                
            default:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
        }
        
    }else if(numberOfBubbleTouched == 15){
        
        switch (randomEffectIndex) {
            case 0:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart2.mp3"];
                break;
            case 1:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
            case 2:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubble.mp3"];
                break;
            case 3:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby1.mp3"];
                break;
            case 4:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby2.mp3"];
                break;
            case 5:
                [[SimpleAudioEngine sharedEngine]playEffect:@"baby3.mp3"];
            case 6:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
            case 7:
                [[SimpleAudioEngine sharedEngine]playEffect:@"cat.wav"];
                break;
            case 8:
                [[SimpleAudioEngine sharedEngine]playEffect:@"ring.mp3"];
            case 9:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                
            default:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
        }
    }else{
        
        switch (randomEffectIndex) {
            case 0:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart2.mp3"];
                break;
            case 1:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart.mp3"];
                break;
            case 2:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
                break;
            case 3:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
                break;
            case 4:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
                break;
            case 5:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
            case 6:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
            case 7:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
                break;
            case 8:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
            case 9:
                [[SimpleAudioEngine sharedEngine]playEffect:@"fart2.mp3"];
                
            default:
                [[SimpleAudioEngine sharedEngine]playEffect:@"bubblepop.mp3"];
                break;
        }
 
    }
    
    //添加粒子或动画效果
    
    //2秒后重新加载界面
    
    if(deviceType == kDeviceTypeNotIphone5){
    if(numberOfBubbleTouched ==17){
     
           [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(reloadScene)] ,nil]];
    }
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        if(numberOfBubbleTouched ==20){
            
            [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(reloadScene)] ,nil]];
        }
    }
    
    
    numberOfBubbleTouched ++;
}

-(void)reloadScene{
    
    [SceneManager goBubblePopping];
}

#pragma mark 粒子效果

-(void)showParticleEffect{
    
    
}

-(void)playEffect{
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bubblebg.mp3" loop:YES];
}
-(void)playIntroMusic{
    
//    [[SimpleAudioEngine sharedEngine]playEffect:@"scenereplace.mp3"];
    
}

#pragma mark 初始化

-(id)init{
    if((self =[super init])){
        
        [self getDeviceType];
        
        [self setMenuLocation];
   
        
        [self addBackItem];
        [self addBackground];
        
        [self addBubbles];
        [self playIntroMusic];
        [self playEffect];

        
    }
    return self;
    
}



@end
