//
//  SceneManager.m
//

#import "SceneManager.h"


@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;

@end

@implementation SceneManager

/*  ___Template___________________________________
 
 Step 3 - Add implementation to call scene
 ______________________________________________
 
 
 +(void) goSceneName {
 [SceneManager go:[SceneName node]];
 }
 
 */

#pragma mark 切换场景

+(void) goStartGame {
  [SceneManager go:[StartGameScene node]];
}

+(void) goAboutScene {
  [SceneManager go:[About node]];
}



+(void) goToyPhoneScene{
    
      [SceneManager go:[ToyPhoneScene node]];
}
+(void) goBellScene{
    
      [SceneManager go:[BellScene node]];
}
+(void) goToyBellScene{
    
      [SceneManager go:[ToyBellScene node]];
}
+(void) goToyMarimbaScene{
    
      [SceneManager go:[ToyMarimbaScene node]];
}

+(void) goAnimalPianoScene{
    
      [SceneManager go:[AnimalPianoScene node]];
}

+(void) goBubblePopping{
    
    [SceneManager go:[BubblePopping node]];
    
}

+(void)goWhackMole{
    
    [SceneManager go:[WhackMole node]];
}

+(void)goPlayFireworks{
    
    [SceneManager go:[PlayFireworks node]];
}


+(void)goRattleDrum{
    
    [SceneManager go:[RattleDrum node]];
}

+(void)goPlayFireCracker{
    
    [SceneManager go:[PlayFirecracker node]];
}

+(void)goBambooClapper{
    
    [SceneManager go:[BambooClappers node]];
    
}

+(void) goChapterSelect{
    
    [SceneManager go:[ChapterSelection node]];
}

#pragma mark  场景切换类方法

+(void) go: (CCLayer *) layer {
  CCDirector *director = [CCDirector sharedDirector];
  CCScene *newScene = [SceneManager wrap:layer];
  if ([director runningScene]) {
    
    [director replaceScene:newScene];
  }
  else {
    [director runWithScene:newScene];
  }
}


#pragma mark 类方法

+(CCScene *) wrap: (CCLayer *) layer {
  CCScene *newScene = [CCScene node];
  [newScene addChild: layer];
  return newScene;
}

@end
