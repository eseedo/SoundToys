//
//  BirdPianoScene.m
//  NimaMonkey
//
//  Created by Ricky on 1/9/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "AnimalPianoScene.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"


@implementation AnimalPianoScene{
    
    //视觉元素
    CCSprite *sceneBg;
    CCSprite *pianoBg;
    
    CCMenuItemImage *keyDo;
    CCMenuItemImage *keyRe;
    CCMenuItemImage *keyMi;
    CCMenuItemImage *keyFa;
    CCMenuItemImage *keySo;
    CCMenuItemImage *keyLa;
    CCMenuItemImage *keyTi;
    CCMenuItemImage *keyDoDual;
    
    CCMenuItemImage *duck;
    CCMenuItemImage *cow;
    CCMenuItemImage *sheep;
    CCMenuItemImage *cock;
    CCMenuItemImage *horse;
    CCMenuItemImage *dog;
    CCMenuItemImage *tiger;
    CCMenuItemImage *cat;

    
    CCMenu *keyMenu;
    CCMenu *animalMenu;
    
    //音效设置
    
    CCMenu* soundMenu;
    
    //位置信息
    
    CGPoint soundMenuLocation;
    
    //视觉元素的位置
    
    CGPoint sceneBgPosition;
    CGPoint pianoBgPosition;
    
    CGPoint backButtonPosition;
    
    CGPoint keyDoPosition;
    CGPoint keyRePosition;
    CGPoint keyMiPosition;
    CGPoint keyFaPosition;
    CGPoint keySoPosition;
    CGPoint keyLaPosition;
    CGPoint keyTiPosition;
    CGPoint keyDoDualPosition;
    
    CGPoint duckPosition;
    CGPoint cowPosition;
    CGPoint sheepPosition;
    CGPoint cockPosition;
    CGPoint horsePosition;
    CGPoint dogPosition;
    CGPoint tigerPosition;
    CGPoint catPosition;
    
 
}


+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    AnimalPianoScene *layer = [AnimalPianoScene node];
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
    pianoBgPosition = ccp(0,0);
    backButtonPosition = ccp(size.width*0.85,size.height*0.85);
    
    soundMenuLocation = ccp(size.width*0.13,size.height*0.82);
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        keyDoPosition= ccp(0,0);
        keyRePosition = ccp(size.width*110/960,0);
        keyMiPosition = ccp(size.width*230/960,0);
        keyFaPosition = ccp(size.width*355/960,0);
        keySoPosition = ccp(size.width*475/960,0);
        keyLaPosition = ccp(size.width*592/960,0);
        keyTiPosition = ccp(size.width*715/960,0);
        keyDoDualPosition = ccp(size.width*833/960,0);
        
        catPosition = ccp(0,size.height*260/640);
        tigerPosition = ccp(size.width*110/960,size.height*260/640);
        duckPosition = ccp(size.width*230/960,size.height*260/640);
        cowPosition = ccp(size.width*355/960,size.height*260/640);
        horsePosition = ccp(size.width*470/960,size.height*260/640);
        sheepPosition = ccp(size.width*592/960,size.height*260/640);
        cockPosition = ccp(size.width*715/960,size.height*260/640);
        dogPosition = ccp(size.width*833/960,size.height*260/640);
        
        
        
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        
        keyDoPosition= ccp(0,0);
        keyRePosition = ccp(size.width*130/1136,0);
        keyMiPosition = ccp(size.width*280/1136,0);
        keyFaPosition = ccp(size.width*420/1136,0);
        keySoPosition = ccp(size.width*560/1136,0);
        keyLaPosition = ccp(size.width*700/1136,0);
        keyTiPosition = ccp(size.width*850/1136,0);
        keyDoDualPosition = ccp(size.width*990/1136,0);
        
        catPosition = ccp(0,size.height*260/640);
        tigerPosition = ccp(size.width*110/960,size.height*260/640);
        duckPosition = ccp(size.width*230/960,size.height*260/640);
        cowPosition = ccp(size.width*355/960,size.height*260/640);
        horsePosition = ccp(size.width*475/960,size.height*260/640);
        sheepPosition = ccp(size.width*600/960,size.height*260/640);
        cockPosition = ccp(size.width*730/960,size.height*260/640);
        dogPosition = ccp(size.width*833/960,size.height*260/640);
        
    }

    

}

//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];   
    [SceneManager goChapterSelect];
    
}
//添加返回按钮
-(void)addBackItem{

    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = backButtonPosition;
    [self addChild:menuButton z:1];
    
}

#pragma mark 切换钢琴类型

#pragma  mark 创建声音设置选项
-(void)createSoundSettingMenu{
    
    
    if([GameData sharedData].hasSwitchedToAnimaSounds ==NO){
        [self createSoundMenuClassicPiano];
        
    }else {
        [self createSoundMenuAnimalSound];
    }
    
}



//创建音效开关选项

-(void) createSoundMenuAnimalSound{
    
    [self removeChild:soundMenu cleanup:YES];
    
    
    CCMenuItem *button = [CCMenuItemImage itemWithNormalImage:@"switch_animalsound.png" selectedImage:nil target:self selector:@selector(switchToPiano)];
    
    button.scale = 0.8;
    
    soundMenu = [CCMenu menuWithItems:button, nil];
    soundMenu.position= soundMenuLocation;

    
    [self addChild:soundMenu z:3  ];
    
    
}
-(void)createSoundMenuClassicPiano{
    
    [self removeChild:soundMenu cleanup:YES];
    CCMenuItem *button = [CCMenuItemImage itemWithNormalImage:@"switch_piano.png" selectedImage:nil target:self selector:@selector(switchToAnimalSounds)];
    
    button.scale = 0.8;
    
    soundMenu = [CCMenu menuWithItems:button, nil];
    soundMenu.position= soundMenuLocation;
    
  
    
    [self addChild:soundMenu z:3  ];
    
}


-(void)switchToAnimalSounds{
    
    GameData *data = [GameData sharedData];
    data.hasSwitchedToAnimaSounds = YES;

    [[SimpleAudioEngine sharedEngine]playEffect:@"elephant.wav"];
    
    [self createSoundMenuAnimalSound];
}

-(void)switchToPiano{
    
    GameData *data = [GameData sharedData];
    data.hasSwitchedToAnimaSounds = NO;
    
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianobutton.mp3"];

    [self createSoundMenuClassicPiano];
    
}



#pragma mark 添加其它视觉元素

-(void)addBackground{
    
    
    if(deviceType == kDeviceTypeNotIphone5){
        sceneBg = [CCSprite spriteWithFile:@"bg_cartoonpiano.png"];
        sceneBg.position = sceneBgPosition;
        [self addChild:sceneBg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        sceneBg= [CCSprite spriteWithFile:@"bg_cartoonpiano-iphone5.png"];
        sceneBg.position = sceneBgPosition;
        [self addChild:sceneBg z:-1];
    }
    
    
    
}


//添加琴键菜单
-(void)addInstrumentKeys{
    
    if(deviceType == kDeviceTypeNotIphone5){
        
        //not iphone5
        
        keyDo = [CCMenuItemImage itemWithNormalImage:@"keydo.png" selectedImage:nil target:self selector:@selector(keyDoTouched)];
        keyRe = [CCMenuItemImage itemWithNormalImage:@"keyre.png" selectedImage:nil target:self selector:@selector(keyReTouched)];
        keyMi = [CCMenuItemImage itemWithNormalImage:@"keymi.png" selectedImage:nil target:self selector:@selector(keyMiTouched)];
        keyFa = [CCMenuItemImage itemWithNormalImage:@"keyfa.png" selectedImage:nil target:self selector:@selector(keyFaTouched)];
        keySo = [CCMenuItemImage itemWithNormalImage:@"keyso.png" selectedImage:nil target:self selector:@selector(keySoTouched)];
        keyLa = [CCMenuItemImage itemWithNormalImage:@"keyla.png" selectedImage:nil target:self selector:@selector(keyLaTouched)];
        keyTi = [CCMenuItemImage itemWithNormalImage:@"keyti.png" selectedImage:nil target:self selector:@selector(keyTiTouched)];
        keyDoDual = [CCMenuItemImage itemWithNormalImage:@"keydodual.png" selectedImage:nil target:self selector:@selector(keyDoDualTouched)];

        
 
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        //iphone5
        
        keyDo = [CCMenuItemImage itemWithNormalImage:@"keydo-iphone5.png" selectedImage:nil target:self selector:@selector(keyDoTouched)];
        keyRe = [CCMenuItemImage itemWithNormalImage:@"keyre-iphone5.png" selectedImage:nil target:self selector:@selector(keyReTouched)];
        keyMi = [CCMenuItemImage itemWithNormalImage:@"keymi-iphone5.png" selectedImage:nil target:self selector:@selector(keyMiTouched)];
        keyFa = [CCMenuItemImage itemWithNormalImage:@"keyfa-iphone5.png" selectedImage:nil target:self selector:@selector(keyFaTouched)];
        keySo = [CCMenuItemImage itemWithNormalImage:@"keyso-iphone5.png" selectedImage:nil target:self selector:@selector(keySoTouched)];
        keyLa = [CCMenuItemImage itemWithNormalImage:@"keyla-iphone5.png" selectedImage:nil target:self selector:@selector(keyLaTouched)];
        keyTi = [CCMenuItemImage itemWithNormalImage:@"keyti-iphone5.png" selectedImage:nil target:self selector:@selector(keyTiTouched)];
        keyDoDual = [CCMenuItemImage itemWithNormalImage:@"keydodual-iphone5.png" selectedImage:nil target:self selector:@selector(keyDoDualTouched)];
        

    }
    
    //set location
    keyDo.anchorPoint = ccp(0,0);
    keyRe.anchorPoint = ccp(0,0);
    keyMi.anchorPoint = ccp(0,0);
    keyFa.anchorPoint = ccp(0,0);
    keySo.anchorPoint = ccp(0,0);
    keyLa.anchorPoint = ccp(0,0);
    keyTi.anchorPoint = ccp(0,0);
    keyDoDual.anchorPoint = ccp(0,0);
    
 
    keyDo.position = keyDoPosition;
    keyRe.position = keyRePosition;
    keyMi.position = keyMiPosition;
    keyFa.position = keyFaPosition;
    keySo.position = keySoPosition;
    keyLa.position = keyLaPosition;
    keyTi.position = keyTiPosition;
    keyDoDual.position = keyDoDualPosition;
    

    keyMenu = [CCMenu menuWithItems:keyDo,keyRe,keyMi,keyFa,keySo,keyLa,keyTi,keyDoDual, nil];
    keyMenu.position = ccp(0,0);
    [self addChild:keyMenu z:2];
    
}

#pragma mark 动物叫声
-(void)playCatSound{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"cat.wav"];
}


-(void)playTigerSound{
    
     [[SimpleAudioEngine sharedEngine]playEffect:@"tiger.wav"]; 
}

-(void)playDuckSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"duck.mp3"]; 
    
}

-(void)playCowSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"cow.wav"]; 
}

-(void)playHorseSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"horse.wav"]; 
    
}
-(void)playSheepSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"sheep.wav"]; 
    
}

-(void)playCockSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"cock.wav"]; 
    
}
-(void)playDogSound{
    
      [[SimpleAudioEngine sharedEngine]playEffect:@"dog.wav"]; 
    
    
}

#pragma mark 按下琴键时的反应
-(void)keyDoTouched{
    
    //keyDO Touched
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效

        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_1.wav"];
        
        //播放动画
        [self catAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playCatSound];
        
            //播放动画
        [self catAnimation];
    }
    

    
    //播放粒子效果
    [self showParticleEffect:ccp(keyDoPosition.x+30,keyDoPosition.y+50)];

}

-(void)keyReTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_3.wav"];
        
        
        //播放动画
        [self tigerAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playTigerSound];
        
         //播放动画
        [self tigerAnimation];
    }
    
   
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyRePosition.x+30,keyRePosition.y+50)];
}

-(void)keyMiTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_5.wav"];
        
        //播放动画
        [self duckAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playDuckSound];
        
          //播放动画
        [self duckAnimation];
    }
    
  
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyMiPosition.x+30,keyMiPosition.y+50)];
}

-(void)keyFaTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_6.wav"];
        
        //播放动画
        [self cowAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playCowSound];
        
           //播放动画
        [self cowAnimation];
    }
    
 
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyFaPosition.x+30,keyFaPosition.y+50)];
}
-(void)keySoTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_8.wav"];
        
        //播放动画
        [self horseAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playHorseSound];
        
         //播放动画
        [self horseAnimation];
    }
    
   
    
    //播放粒子效果
    [self showParticleEffect:ccp(keySoPosition.x+30,keySoPosition.y+50)];
}
-(void)keyLaTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_10.wav"];
        
        //播放动画
        [self sheepAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playSheepSound];
        
           //播放动画
        [self sheepAnimation];
    }
    
 
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyLaPosition.x+30,keyLaPosition.y+50)];
}
-(void)keyTiTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_1_12.wav"];
        
        //播放动画
        [self cockAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playCockSound];
        
          //播放动画
        [self cockAnimation];
    }
    
  
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyTiPosition.x+30,keyTiPosition.y+50)];
}
-(void)keyDoDualTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        //如果是钢琴，则播放钢琴音效
        
        [[SimpleAudioEngine sharedEngine]playEffect:@"pianoA_3_1.wav"];
        
        //播放动画
        [self dogAnimation];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //如果是动物，则播放动物音效
        [self playDogSound];
        
          //播放动画
        [self dogAnimation];
    }
    
  
    
    //播放粒子效果
    [self showParticleEffect:ccp(keyDoDualPosition.x+30,keyDoDualPosition.y+50)];
    
}

#pragma mark 添加动物
//添加动物

-(void)addAnimals{

    
    cat = [CCMenuItemImage itemWithNormalImage:@"cat.png" selectedImage:nil target:self selector:@selector(catTouched)];
    cock = [CCMenuItemImage itemWithNormalImage:@"cock.png" selectedImage:nil target:self selector:@selector(cockTouched)];
    cow = [CCMenuItemImage itemWithNormalImage:@"cow.png" selectedImage:nil target:self selector:@selector(cowTouched)];
    dog = [CCMenuItemImage itemWithNormalImage:@"dog.png" selectedImage:nil target:self selector:@selector(dogTouched)];
    duck = [CCMenuItemImage itemWithNormalImage:@"duck.png" selectedImage:nil target:self selector:@selector(duckTouched)];
    horse = [CCMenuItemImage itemWithNormalImage:@"horse.png" selectedImage:nil target:self selector:@selector(horseTouched)];
    sheep = [CCMenuItemImage itemWithNormalImage:@"sheep.png" selectedImage:nil target:self selector:@selector(sheepTouched)];
    tiger = [CCMenuItemImage itemWithNormalImage:@"tiger.png" selectedImage:nil target:self selector:@selector(tigerTouched)];
    
        
        

    
    //set location
    cat.anchorPoint = ccp(0,0);
    cock.anchorPoint = ccp(0,0);
    cow.anchorPoint = ccp(0,0);
    dog.anchorPoint = ccp(0,0);
    duck.anchorPoint = ccp(0,0);
    horse.anchorPoint = ccp(0,0);
    sheep.anchorPoint = ccp(0,0);
    tiger.anchorPoint = ccp(0,0);
    
    
    cat.position = catPosition;
    cock.position = cockPosition;
    cow.position = cowPosition;
    dog.position = dogPosition;
    duck.position = duckPosition;
    horse.position = horsePosition;
    sheep.position = sheepPosition;
    tiger.position = tigerPosition;
    
    
    animalMenu = [CCMenu menuWithItems:cat,cock,cow,dog,duck,horse,sheep,tiger, nil];
    animalMenu.position = ccp(0,0);
    [self addChild:animalMenu z:3];
}

-(void)catTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self catAnimation];
        
        //发出叫声
        [self playCatSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self catAnimation];
        
        //发出叫声
        [self playCatSound];
    }
    

}

-(void)cockTouched{
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self cockAnimation];
        
        //发出叫声
        [self playCockSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self cockAnimation];
        
        //发出叫声
        [self playCockSound];
    }
}

-(void)cowTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self cowAnimation];
        
        //发出叫声
        [self playCowSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self cowAnimation];
        
        //发出叫声
        [self playCowSound];
    }
}

-(void)dogTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self dogAnimation];
        
        //发出叫声
        [self playDogSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self dogAnimation];
        
        //发出叫声
        [self playDogSound];
    }
}

-(void)duckTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self duckAnimation];
        
        //发出叫声
        [self playDuckSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self duckAnimation];
        
        //发出叫声
        [self playDuckSound];
    }
}

-(void)horseTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        
        [self horseAnimation];
        
        //发出叫声
        [self playHorseSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        
        [self horseAnimation];
        
        //发出叫声
        [self playHorseSound];
    }
}

-(void)sheepTouched{
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        
        [self sheepAnimation];
        
        //发出叫声
        [self playSheepSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        
        [self sheepAnimation];
        
        //发出叫声
        [self playSheepSound];
    }
}

-(void)tigerTouched{
    
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
        
        //播放动画
        [self tigerAnimation];
        
        //发出叫声
        [self playTigerSound];
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        //播放动画
        [self tigerAnimation];
        
        //发出叫声
        [self playTigerSound];
    }
}

#pragma mark 动画

-(void)catAnimation{
    
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:catPosition];
    [cat runAction:[CCSequence actions:action1,action2, nil]];
    
}
-(void)cockAnimation{
    
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:cockPosition];
    [cock runAction:[CCSequence actions:action1,action2, nil]];
}
-(void)cowAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:cowPosition];
    [cow runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)dogAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:dogPosition];
    [dog runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)duckAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:duckPosition];
    [duck runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)horseAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:horsePosition];
    [horse runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)sheepAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:sheepPosition];
    [sheep runAction:[CCSequence actions:action1,action2, nil]];
}

-(void)tigerAnimation{
    //jump
    id action1 = [CCMoveBy actionWithDuration:0.2 position:ccp(0,30)];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:tigerPosition];
    [tiger runAction:[CCSequence actions:action1,action2, nil]];
}


#pragma mark 粒子效果

-(void)showParticleEffect:(CGPoint)particlePosition{
    
    
    if([GameData sharedData].hasSwitchedToAnimaSounds == NO){
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
        
    }else if([GameData sharedData].hasSwitchedToAnimaSounds == YES){
        
        CCParticleSystemQuad *particle = [CCParticleSystemQuad particleWithFile:@"particle.plist"];
        
        particle.position = particlePosition;
        particle.autoRemoveOnFinish = YES;
        particle.duration = 0.3;

        int animalType =0;
        if(particlePosition.x == keyDoPosition.x +30){
            animalType = 1;
        }else if(particlePosition.x == keyRePosition.x+30){
            animalType = 2;
        }else if(particlePosition.x ==  keyMiPosition.x+30){
            animalType = 3;
        }else if(particlePosition.x ==  keyFaPosition.x+30){
            animalType = 4;
        }else if(particlePosition.x ==  keySoPosition.x+30){
            animalType = 5;
        }else if(particlePosition.x ==  keyLaPosition.x+30){
            animalType = 6;
        }else if(particlePosition.x ==  keyTiPosition.x+30){
            animalType = 7;
        }else if(particlePosition.x ==  keyDoDualPosition.x+30){
            animalType = 8;
        }
        
        switch (animalType) {
            case 1:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"cat.png"];

                break;
                
            case 2:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"tiger.png"];
                
                break;
            case 3:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"duck.png"];
                
                break;
            case 4:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"cow.png"];
                
                break;
            case 5:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"horse.png"];
                
                break;
            case 6:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"sheep.png"];
                
                break;
            case 7:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"cock.png"];
                
                break;
            case 8:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"dog.png"];
                
                break;
            default:
                particle.texture = [[CCTextureCache sharedTextureCache]addImage:@"cat.png"];
                break;
        }
  
        
        [self addChild:particle z:5];
    }
    

    
}



-(void)playIntroMusic{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"pianobutton.mp3"];

}



#pragma mark 初始化

-(id)init{
    if((self =[super init])){
        
        [self getDeviceType];
        
        [self setMenuLocation];
        
        //添加音效设置开关
        
        [self createSoundSettingMenu];
        
        [self addBackItem];
        [self addBackground];

        [self addInstrumentKeys];
        [self addAnimals];
        
        [self playIntroMusic];
        
        
        
    }
    return self;
    
}




@end
