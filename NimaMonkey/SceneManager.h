//
//  SceneManager.h
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*  ___Template___________________________________
 
 Step 1 - Import header of your SceneName
 ______________________________________________
 
 #import "SceneName.h"
 
 */
#import "StartGameScene.h"
#import "About.h"

#import "ToyPhoneScene.h"

#import "BellScene.h"
#import "ToyBellScene.h"
#import "ToyMarimbaScene.h"
#import "AnimalPianoScene.h"
#import "BubblePopping.h"
#import "WhackMole.h" 
#import "PlayFireworks.h"
#import "RattleDrum.h"
#import "PlayFirecracker.h"
#import "BambooClappers.h"


#import "ChapterSelect.h"


@interface SceneManager : NSObject {
  
}

/*  ___Template___________________________________
 
 Step 2 - Add interface scene calling method
 ______________________________________________
 
 +(void) goSceneName;
 
 */

+(void) goStartGame;
+(void) goAboutScene;

+(void) goToyPhoneScene;
+(void) goBellScene;
+(void) goToyBellScene;
+(void) goToyMarimbaScene;
+(void) goAnimalPianoScene;
+(void) goBubblePopping;
+(void) goWhackMole;
+(void) goPlayFireworks;
+(void) goRattleDrum;
+(void) goPlayFireCracker;
+(void) goBambooClapper;

+(void) goChapterSelect;

@end
