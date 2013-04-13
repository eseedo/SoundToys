//
//  WhackMole.m
//  NimaMonkey
//
//  Created by Ricky on 1/28/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "WhackMole.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"

@implementation WhackMole{
    
    CCSprite *sceneBg;
    
    //视觉元素的位置
    
    CGPoint sceneBgPosition;

    
    CGPoint backButtonPosition;
    
    NSMutableArray *moles;
    CCAnimation *laughAnim;
    CCAnimation *hitAnim;
    CCLabelTTF *label;
    int score;
    int totalSpawns;
    BOOL gameOver;
    
    //精灵表单
    
    
    //角色
    NSString *spritesSheet;
    NSString *spritesPlist;
    
    //logic
    
    int numberOfMissingMole;
    int numberOfHitMole;

}


+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    WhackMole *layer = [WhackMole node];
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



#pragma mark 粒子效果

-(void)showParticleEffect{
    
    
}


#pragma mark 添加视觉元素



- (CCAnimation *)animationFromPlist:(NSString *)animPlist delay:(float)delay {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:animPlist ofType:@"plist"];
    NSArray *animImages = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *animFrames = [NSMutableArray array];
    for(NSString *animImage in animImages) {
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:animImage]];
    }
    
    
    return [CCAnimation animationWithSpriteFrames:animFrames delay:delay];
    
}




-(void)preparePlist{
    
    
    spritesSheet = @"sprites.png";
    spritesPlist = @"sprites.plist";
    
}


-(void)addForeGround{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        CCSprite *lower = [CCSprite spriteWithFile:@"grass_lower.png"];
        lower.anchorPoint = ccp(0.5, 1);
        lower.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:lower z:1];
        
        CCSprite *upper = [CCSprite spriteWithFile:@"grass_upper.png"];
        upper.anchorPoint = ccp(0.5, 0);
        upper.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:upper z:-1];
     
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        
        CCSprite *lower = [CCSprite spriteWithFile:@"grass_lower-iphone5.png"];
        lower.anchorPoint = ccp(0.5, 1);
        lower.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:lower z:1];
        
        CCSprite *upper = [CCSprite spriteWithFile:@"grass_upper-iphone5.png"];
        upper.anchorPoint = ccp(0.5, 0);
        upper.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:upper z:-1];
       
    }

    
    
    
}

-(void)addBackground{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    if(deviceType == kDeviceTypeNotIphone5){
            sceneBg = [CCSprite spriteWithFile:@"bg_dirt.png"];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
            sceneBg = [CCSprite spriteWithFile:@"bg_dirt-iphone5.png"];
    }
    

    //    dirt.scale = 2.0;
    sceneBg.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:sceneBg z:-2];
}

-(void)addLabel{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    float margin = 10;
    label = [CCLabelTTF labelWithString:@"Score: 0" fontName:@"Verdana" fontSize:14.0];
    label.anchorPoint = ccp(1, 0);
    label.position = ccp(winSize.width - margin, margin);
    [self addChild:label z:10];
}

-(void)preloadSoundEffects{
    
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"molelaugh.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"punch.mp3"];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background.mp3" loop:YES];
//    [[SimpleAudioEngine sharedEngine]playEffect:@"babylaugh.mp3"];
    
}
-(void)loadSprites{
    
    
    CCSpriteBatchNode *spriteNode = [CCSpriteBatchNode batchNodeWithFile:spritesSheet];
    [self addChild:spriteNode z:0];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spritesPlist];
    
    moles = [[NSMutableArray alloc] init];
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        
        CCSprite *mole1 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole1.position = ccp(80, 40);
        [spriteNode addChild:mole1];
        [moles addObject:mole1];
        
        CCSprite *mole2 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole2.position = ccp(230, 40);
        [spriteNode addChild:mole2];
        [moles addObject:mole2];
        
        CCSprite *mole3 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole3.position = ccp(400, 40);
        [spriteNode addChild:mole3];
        [moles addObject:mole3];
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        
        CCSprite *mole1 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole1.position = ccp(100, 40);
        [spriteNode addChild:mole1];
        [moles addObject:mole1];
        
        CCSprite *mole2 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole2.position = ccp(265, 40);
        [spriteNode addChild:mole2];
        [moles addObject:mole2];
        
        CCSprite *mole3 = [CCSprite spriteWithSpriteFrameName:@"mouse.png"];
        mole3.position = ccp(430, 40);
        [spriteNode addChild:mole3];
        [moles addObject:mole3];
    }

    
    
    [self schedule:@selector(tryPopMoles:) interval:0.5];
    
}

-(void)createAnimations{
    
    laughAnim = [self animationFromPlist:@"laughAnim" delay:0.1];
    hitAnim = [self animationFromPlist:@"hitAnim" delay:0.02];
    [[CCAnimationCache sharedAnimationCache] addAnimation:laughAnim name:@"laughAnim"];
    [[CCAnimationCache sharedAnimationCache] addAnimation:hitAnim name:@"hitAnim"];
}


#pragma mark 添加交互
- (void)setTappable:(id)sender {
    CCSprite *mole = (CCSprite *)sender;
    [mole setUserData:TRUE];
    
    //    mole.userData = TRUE;
    [[SimpleAudioEngine sharedEngine] playEffect:@"molelaugh.mp3"];
}

- (void)unsetTappable:(id)sender {
    
    CCSprite *mole = (CCSprite *)sender;
    [mole setUserData:FALSE];
    
    numberOfMissingMole ++;
}

- (void) popMole:(CCSprite *)mole {
    
    if (totalSpawns > 50) return;
    totalSpawns++;
    
    [mole setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"mouse.png"]];
    
    // Pop mole
    CCMoveBy *moveUp = [CCMoveBy actionWithDuration:0.2 position:ccp(0, mole.contentSize.height)];
    CCCallFunc *setTappable = [CCCallFuncN actionWithTarget:self selector:@selector(setTappable:)];
    CCEaseInOut *easeMoveUp = [CCEaseInOut actionWithAction:moveUp rate:3.0];
    CCAnimate *laugh = [CCAnimate actionWithAnimation:laughAnim];
    
    CCCallFunc *unsetTappable = [CCCallFuncN actionWithTarget:self selector:@selector(unsetTappable:)];
    CCAction *easeMoveDown = [easeMoveUp reverse];
    
    [mole runAction:[CCSequence actions:easeMoveUp, setTappable, laugh, unsetTappable, easeMoveDown, nil]];
    
}

-(void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self priority:kCCMenuHandlerPriority swallowsTouches:NO];
    
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    for (CCSprite *mole in moles) {
        if (mole.userData == FALSE) continue;
        if (CGRectContainsPoint(mole.boundingBox, touchLocation)) {
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"punch.mp3"];
            
            mole.userData = FALSE;
            score+= 10;
            
            numberOfHitMole ++;
            
            [mole stopAllActions];
            CCAnimate *hit = [CCAnimate actionWithAnimation:hitAnim];
            CCMoveBy *moveDown = [CCMoveBy actionWithDuration:0.2 position:ccp(0, -mole.contentSize.height)];
            CCEaseInOut *easeMoveDown = [CCEaseInOut actionWithAction:moveDown rate:3.0];
            [mole runAction:[CCSequence actions:hit, easeMoveDown, nil]];
        }
    }
    return TRUE;
}

- (void)tryPopMoles:(ccTime)dt {
    
    if (gameOver){
        //延迟几秒后重新进入该界面
        
        [self endGame];
    }else {
        
        for (CCSprite *mole in moles) {
            if (arc4random() % 3 == 0) {
                if (mole.numberOfRunningActions == 0) {
                    [self popMole:mole];
                }
            }
        }
    }

//    
//    [label setString:[NSString stringWithFormat:@"Score: %d", score]];
//    
//    if (totalSpawns >= 50) {
//        
//        CGSize winSize = [CCDirector sharedDirector].winSize;
//        
//        CCLabelTTF *goLabel = [CCLabelTTF labelWithString:@"All clear!" fontName:@"Verdana" fontSize:48.0];
//        goLabel.position = ccp(winSize.width/2, winSize.height/2);
//        goLabel.scale = 0.1;
//        [self addChild:goLabel z:10];
//        [goLabel runAction:[CCScaleTo actionWithDuration:0.5 scale:1.0]];
//        
//        gameOver = true;
//        return;
//        
//    }



}

#pragma mark game over

-(void)update:(ccTime)delta{
    
    if(numberOfMissingMole >=5){
        
        gameOver = true;
    }
    
}

-(void)restartGame{
    
    [SceneManager goWhackMole];
}

-(void)endGame{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    NSString *endString = [NSString stringWithFormat:@"%d moles    catched ",numberOfHitMole];
    
    
    CCLabelTTF *endLabel = [CCLabelTTF labelWithString:endString fontName:@"ChalkboardSE-Bold" fontSize:18.0];
    endLabel.position = ccp(winSize.width*0.35, winSize.height*0.5);

    [self addChild:endLabel z:10];
    
    [CCMenuItemFont setFontSize:25];
    [CCMenuItemFont setFontName:@"ChalkboardSE-Bold"];
    CCMenuItemFont *restartItem = [CCMenuItemFont itemWithString:@"Restart" target:self selector:@selector(restartGame)];

    restartItem.position = ccp(winSize.width*0.83,winSize.height*0.5);

    
    CCMenu *menu = [CCMenu menuWithItems:restartItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu z:5];
    

    
//    [self stopAllActions];

    
    
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
		
        // Determine names of sprite sheets and plists to load
        [self preparePlist];
        
        
        // Add background
        [self addBackground];
        
        // Add foreground
        [self addForeGround];
        
        // Load sprites
        [self loadSprites];
        
        
        // Create animations
        [self createAnimations];
        
        // Set touch enabled
        self.isTouchEnabled = YES;
        
        // Add label
//        [self addLabel];
        
        // Preload sound effects
        [self preloadSoundEffects];
        
        [self scheduleUpdate];
        
        
        
	}
	return self;
}





@end
