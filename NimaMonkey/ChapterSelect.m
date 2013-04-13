//
//  ChapterSelection.m
//  CrazyMonk
//
//  Created by eseedo on 7/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChapterSelect.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "GameSounds.h"
#import "CCTouchDispatcher.h"
#import "CCScrollLayer.h"
#import "Chapter.h"
#import "Chapters.h"
#import "ChapterParser.h"
#import "Constants.h"
#import "SceneManager.h"

enum{
  
  kTagChapterBg = -100,
  kTagChapterText = 1,
  kTagChapterBackButton =2,
  kTagChapterStoreButton =3,
  kTagChapterButton = 4,
  kTagChapterBackText =5,
  kTagChapterStoreText =6,
  
}zOrderTag;





@implementation ChapterSelection

//获取屏幕大小

-(void)getScreenSize{
  
  size = [CCDirector sharedDirector].winSize;
  
}


#pragma mark 设置菜单的位置

-(void)setMenuLocation{
  
  [self getScreenSize];
  
  backButtonLocation = ccp( size.width*0.15, size.height*0.1);
  
  storeButtonLocation = ccp(size.width*0.85,size.height*0.1);
  
  textLocation = ccp(size.width*0.5,size.height*0.75);
  
  chapterLocation = ccp(size.width*0.5,size.height*0.5);
  
  bgLocation = ccp(size.width*0.5,size.height*0.5);
  
}

//添加背景图片
-(void)addBackground{
  
  
    size = [CCDirector sharedDirector].winSize;
    
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


//添加背景音乐
-(void)playBackgroundMusic{
    GameData *data = [GameData sharedData];
    
    if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO){

    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"soft.mp3" loop:YES];
    data.currentBackgroundMusicIndex = 1;
    }


}


#pragma mark 添加底部两个菜单选项

//返回起始画面
-(void)backToStart{
  
  //返回起始画面
  NSLog(@"返回起始画面");
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



//获取设备类型
-(void)getDeviceType{
    
    if([GameData sharedData].isDeviceIphone5 == NO){
        deviceType = kDeviceTypeNotIphone5;
    }else{
        deviceType = kDeviceTypeIphone5OrNewTouch;
    }
}



#pragma mark 选择关卡场景

//选中场景后进入到具体的场景

- (void)onSelectChapter:(CCMenuItemImage *)sender {
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
  
  //CCLOG(@"writing the selected stage to GameData.xml as %i", sender.tag);
  
  GameData *gameData = [GameData sharedData];
  gameData.selectedChapter = sender.tag;
  
    selectedToy = gameData.selectedChapter;
    
    switch (selectedToy) {

        case kSceneTypeAnimalPiano:  //动物钢琴
            [SceneManager goAnimalPianoScene];
             CCLOG(@"进入动物钢琴界面");
            break;
        case kSceneTypeToyMarimba:    //玩具木琴
            [SceneManager goToyMarimbaScene];
             CCLOG(@"进入玩具木琴界面");
            break;
        case kSceneTypeShakeBell:     //玩具摇铃
            [SceneManager goToyBellScene];
             CCLOG(@"进入玩具摇铃界面");
            break;
        case kSceneTypeBell:        //玩具铃铛
            [SceneManager goBellScene];
            CCLOG(@"进入玩具铃铛界面");
            break;
        case kSceneTypeBubbleTouch:   //塑料泡泡
            [SceneManager goBubblePopping];
            CCLOG(@"进入塑料泡泡界面");
            break;
        case kSceneTypeMolePoping: //打地鼠
            [SceneManager goWhackMole];
             CCLOG(@"进入打地鼠界面");
            break;
        case kSceneTypeFireworks: //放烟花
            [SceneManager goPlayFireworks];
            CCLOG(@"进入放烟花界面");
            break;
            
        case kSceneTypeRattleDrm: //摇晃拨浪鼓
            [SceneManager goRattleDrum];
            CCLOG(@"进入拨浪鼓界面");
            break;
            
        case kSceneTypeFireCrack: //放鞭炮
            [SceneManager goPlayFireCracker];
            CCLOG(@"进入拨浪鼓界面");
            break;
            
        case kSceneTypeBambooClapper: //快板
        
            [SceneManager goBambooClapper];
            CCLOG(@"进入快板界面");
            break;
            
        default:
             [SceneManager goAnimalPianoScene];
            break;
    }
    


}

//初始化层
- (CCLayer*)layerWithChapterName:(NSString*)chapterName
                   chapterNumber:(int)chapterNumber
                 chapterUnlocked:(BOOL)chaterUnlocked
                      screenSize:(CGSize)screenSize {
  
  CCLayer *layer = [[CCLayer alloc] init];
  
  [self getScreenSize];
  
  if(chapterNumber ==kSceneTypeAnimalPiano){
    

    
    CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_cartoonphone.png"
                                                    selectedImage:nil
                                                           target:self
                                                         selector:@selector(onSelectChapter:)];
    image.tag = chapterNumber;
    //    image.scale = 0.8;
    
    CCMenu *menu = [CCMenu menuWithItems: image, nil];
    [menu alignItemsVertically];
    [layer addChild: menu];
    
    
    //添加文字
    
    [CCMenuItemFont setFontSize:15];
    CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Animal Piano"];
    text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
    
    
    CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
    //    [menu2 alignItemsVertically];
    menu2.anchorPoint = ccp(0,0);
    menu2.position = ccp(size.width*0.5,size.height*0.8);
    
    [layer addChild:menu2];
    
  }else if(chapterNumber ==kSceneTypeToyMarimba){
    
    
    CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_marimba.png"
                                                    selectedImage:nil
                                                           target:self
                                                         selector:@selector(onSelectChapter:)];
    image.tag = chapterNumber;
    //    image.scale = 0.8;
    
    CCMenu *menu = [CCMenu menuWithItems: image, nil];
    [menu alignItemsVertically];
    [layer addChild: menu];
    
    //添加文字
    
    [CCMenuItemFont setFontSize:15];
    CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Toy Marimba"];
    text.tag = chapterNumber;
    text.color = ccc3(16,174,231);
    
    CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
    //    [menu2 alignItemsVertically];
    menu2.anchorPoint = ccp(0,0);
    menu2.position = ccp(size.width*0.5,size.height*0.8);
    
    [layer addChild:menu2];
    
  }  else if(chapterNumber ==kSceneTypeShakeBell){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_shakebell.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Shake Bell"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }  else if(chapterNumber ==kSceneTypeBell){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_bell.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Toy Bell"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeBubbleTouch){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_bubble.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Bubble Popping"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeMolePoping){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_whackingmole.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Whacking Mole"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeFireworks){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_fireworks.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Play Fireworks"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeRattleDrm){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_rattledrum.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Rattle Drum"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeFireCrack){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_firecracker.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Play firecracker"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }else if(chapterNumber ==kSceneTypeBambooClapper){
      
      
      CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"mini_bg_bambooclapper.png"
                                                      selectedImage:nil
                                                             target:self
                                                           selector:@selector(onSelectChapter:)];
      image.tag = chapterNumber;
      //    image.scale = 0.8;
      
      CCMenu *menu = [CCMenu menuWithItems: image, nil];
      [menu alignItemsVertically];
      [layer addChild: menu];
      
      //添加文字
      
      [CCMenuItemFont setFontSize:15];
      CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"Bamboo Clapper"];
      text.tag = chapterNumber;
      text.color = ccc3(16,174,231);
      
      CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
      //    [menu2 alignItemsVertically];
      menu2.anchorPoint = ccp(0,0);
      menu2.position = ccp(size.width*0.5,size.height*0.8);
      
      [layer addChild:menu2];
      
  }


  
  return layer;
}


//set offset of the scroll layer
-(void)setScollLayerOffset{
    
    if(deviceType == kDeviceTypeIphone5OrNewTouch){
        scrollLayerOffset = 250;
    }else if(deviceType == kDeviceTypeNotIphone5){
        scrollLayerOffset = 180;
    }
}

//添加滑动选择
-(void)addChapters{
  
  [self getScreenSize];
  
  NSMutableArray *layers = [NSMutableArray new];
  
  Chapters *chapters = [ChapterParser loadData];
  
  for (Chapter *chapter in chapters.chapters) {
    // Create a layer for each of the stages found in Chapters.xml
    CCLayer *layer = [self layerWithChapterName:chapter.name chapterNumber:chapter.number chapterUnlocked:chapter.unlocked  screenSize:size];
    [layers addObject:layer];
  }
  
    [self setScollLayerOffset];

  // Set up the swipe-able layers
  CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:layers
                                                      widthOffset:scrollLayerOffset];
  
  
  //  GameData *gameData = [GameDataParser loadData];
  GameData *gameData = [GameData sharedData];
  
  [scroller selectPage:(gameData.selectedChapter -1)];
  
  [self addChild:scroller];
  
  [scroller release];
  [layers release];
  
  
  
  
  
}


-(void)addIntro{
    
    size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *intro = [CCLabelTTF labelWithString:@"Swipe to choose other toys " fontName:@"ChalkboardSE-Bold" fontSize:20];
  
    intro.position = ccp(size.width/2,size.height*0.1);
    intro.color = ccc3(16,174,231);
    
      [self addChild:intro z:5];
    
}

+(id)scene{
  
  CCScene *scene =[CCScene node];
  ChapterSelection *layer = [ChapterSelection node];
  [scene addChild:layer];
  return scene;
  
}

-(id)init{
  if((self = [super init])){
      
      [self getDeviceType];
    
    //设置位置
    
    [self setMenuLocation];
    
    //添加背景
    
    [self addBackground];
    
    //播放背景音乐
    [self playBackgroundMusic];
    
    //添加菜单选项
    [self addBackItem];
    
    
    //添加场景选择
    [self addChapters];
      
      
      //添加介绍
      [self addIntro];
    
  }
  return self;
  
}

@end
