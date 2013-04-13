
#import "GameData.h"
#import "Constants.h"
#import "SimpleAudioEngine.h"

@implementation GameData


@synthesize notFirstTimePlayThisGame,notFirstTimeEnterStore;
@synthesize gamePaused;
@synthesize currentNimaCoins;
@synthesize selectedChapter = _selectedChapter;
@synthesize selectedLevel = _selectedLevel;
@synthesize soundEffectMuted,backgroundMusicMuted;


@synthesize currentLevelSolved,currentLevelUnlocked,currentChapterUnlocked;

@synthesize levelsCompleted,chaptersCompleted;

@synthesize totalBossKilled,totalMonkExpEarned,totalMonkeyExpEarned,totalMonstersKilled,currentLevelMonkExp,currentLevelMonkeyExp;

@synthesize  currentMonkRank,currentMonkeyRank;

@synthesize currentSkillFireLevel,currentSkillSpringLevel;
@synthesize currentSkillWaterLevel;

@synthesize currentEquipBootLevel,currentEquipGoldenClothesLevel,currentEquipMonkBowLevel,currentEquipMonkClothesLevel,currentEquipStaffLevel,currentEquipStickLevel;

@synthesize numberOfCurrentHpMedicine,numberOfCurrentMpMedicine;

@synthesize currentMonkMp,currentMonkeyHp,currentMonkeySpeed,currentMonkeyAttack;
@synthesize currentLevelNimaCoin;

@synthesize numberOfHpMedicineChanged,numberOfMpMedicineChanged,numberOfNimaCoinChanged,levelOfSkillWaterChanged,levelOfSkillFireChanged,levelOfSkillSpringChanged,levelOfEquipMonkBowlChanged,levelOfEquipMonkClothesChanged,levelOfEquipStaffChanged,levelOfEquipStickChanged,levelOfEquipBootChanged,levelOFEquipGoldenClothesChanged,rankOfMonkChanged,rankOfMonkeyChanged,expOfMonkChanged,expOfMonkeyChanged;

@synthesize chapterChanged;

@synthesize isDeviceIphone5;

@synthesize selectedPianoType;

@synthesize hasSwitchedToAnimaSounds;

@synthesize currentBackgroundMusicIndex;

static GameData *sharedData = nil;

+(GameData*) sharedData {
  
  if (sharedData == nil) {
    sharedData = [[GameData alloc] init] ;
    
  }
  return  sharedData;
  
}


-(id) init
{
  
  //无法获取数据的愿意可能在此，也即使用了参数
  
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
    
    
    sharedData = self;
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    
    currentNimaCoins = [defaults integerForKey:@"currentDragonCoins"];
    
    currentLevelSolved = [defaults boolForKey:@"currentLevelSolved"];
    
    currentLevelUnlocked = [defaults boolForKey:@"currentLevelUnlocked"];
    
    currentChapterUnlocked = [defaults boolForKey:@"currentChapterUnlocked"];
    
    
    soundEffectMuted = [defaults boolForKey:@"soundEffectMuted"];   //默认值为NO
    backgroundMusicMuted = [defaults boolForKey:@"backgroundMusicMuted"];   //默认值为NO
    
    
    gamePaused = [defaults boolForKey:@"gamePaused"];
    
    
    
    notFirstTimePlayThisGame = [defaults boolForKey:@"notFirstTimePlayThisGame"];
    notFirstTimeEnterStore = [defaults boolForKey:@"notFirstTimeEnterStore"];
    
    
    levelsCompleted = [defaults integerForKey:@"levelsCompletedTotal"];
    chaptersCompleted = [defaults integerForKey:@"chaptersCompleted"];
    
    
    totalBossKilled = [defaults integerForKey:@"totalBossKilled"];
    totalMonstersKilled = [defaults integerForKey:@"totalMonstersKilled"];
    
    totalMonkExpEarned = [defaults integerForKey:@"totalMonkExpEarned"];
    totalMonkeyExpEarned = [defaults integerForKey:@"totalMonkeyExpEarned"];
    
    currentLevelMonkExp = [defaults integerForKey:@"currentLevelMonkExp"];
    currentLevelMonkeyExp = [defaults integerForKey:@"currentLevelMonkeyExp"];
    
    currentLevelNimaCoin = [defaults integerForKey:@"currentLevelNimaCoin"];
    
    //法师和悟空的等级
    
    currentMonkRank = [defaults integerForKey:@"currentMonkRank"];
    currentMonkeyRank = [defaults integerForKey:@"currentMonkeyRank"];
    
    
    currentMonkMp = [defaults integerForKey:@"currentMonkMp"];
    currentMonkeyAttack = [defaults integerForKey:@"currentMonkeyAttack"];
    currentMonkeyHp = [defaults integerForKey:@"currentMonkeyHp"];
    currentMonkeySpeed = [defaults integerForKey:@"currentMonkeySpeed"];
    
    
    //当前的技能等级
    
    //默认值
    
    currentSkillWaterLevel = [defaults integerForKey:@"currentSkillWaterLevel"];
    currentSkillFireLevel = [defaults integerForKey:@"currentSkillFireLevel"];
    currentSkillSpringLevel = [defaults integerForKey:@"currentSkillSpringLevel"];
    
    
    
    //当前的装备等级
    
    //默认值
    
    currentEquipBootLevel = [defaults integerForKey:@"currentEquipBootLevel"];
    currentEquipGoldenClothesLevel = [defaults integerForKey:@"currentEquipGoldenClothesLevel"];
    currentEquipMonkBowLevel = [defaults integerForKey:@"currentEquipMonkBowLevel"];
    currentEquipStaffLevel = [defaults integerForKey:@"currentEquipStaffLevel"];
    currentEquipStickLevel = [defaults integerForKey:@"currentEquipStickLevel"];
    currentEquipMonkClothesLevel = [defaults integerForKey:@"currentEquipMonkClothesLevel"];
    
    
    
    //当前的药物数量
    
    //默认值
    
    numberOfCurrentHpMedicine = [defaults integerForKey:@"numberOfCurrentHpMedicine"];
    
    numberOfCurrentMpMedicine = [defaults integerForKey:@"numberOfCurrentMpMedicine"];
    
    
    
    //默认选择的关卡和场景
    _selectedChapter = 1;
    _selectedLevel =1;
    
    
    //关卡成就相关
    
    //默认数值是否改变
    numberOfMpMedicineChanged = [defaults boolForKey:@"numberOfMpMedicineChanged"];
    numberOfHpMedicineChanged = [defaults boolForKey:@"numberOfHpMedicineChanged"];
    
    numberOfNimaCoinChanged = [defaults boolForKey:@"numberOfNimaCoinChanged"];
    
    levelOfSkillWaterChanged = [defaults boolForKey:@"levelOfSkillWaterChanged"];
    levelOfSkillFireChanged = [defaults boolForKey:@"levelOfSkillFireChanged"];
    levelOfSkillSpringChanged = [defaults boolForKey:@"levelOfSkillSpringChanged"];
    
    levelOfEquipMonkBowlChanged = [defaults boolForKey:@"levelOfEquipMonkBowlChanged"];
    levelOfEquipMonkClothesChanged = [defaults boolForKey:@"levelOfEquipMonkClothesChanged"];
    levelOfEquipStaffChanged = [defaults boolForKey:@"levelOfEquipStaffChanged"];
    levelOfEquipStickChanged = [defaults boolForKey:@"levelOfEquipStickChanged"];
    levelOfEquipBootChanged = [defaults boolForKey:@"levelOfEquipBootChanged"];
    levelOFEquipGoldenClothesChanged = [defaults boolForKey:@"levelOFEquipGoldenClothesChanged"];
    
    rankOfMonkChanged = [defaults boolForKey:@"rankOfMonkChanged"];
    rankOfMonkeyChanged = [defaults boolForKey:@"rankOfMonkeyChanged"];
    expOfMonkeyChanged = [defaults boolForKey:@"expOfMonkeyChanged"];
    expOfMonkChanged = [defaults boolForKey:@"expOfMonkChanged"];
    
    chapterChanged = [defaults boolForKey:@"chapterChanged"];
        
        isDeviceIphone5 = [defaults boolForKey:@"isDeviceIphone5"];
        
        selectedPianoType = [defaults integerForKey:@"selectedPianoType"];
        hasSwitchedToAnimaSounds = [defaults boolForKey:@"hasSwitchedToAnimaSounds"];
        
        
        currentBackgroundMusicIndex = [defaults integerForKey:@"currentBackgroundMusicIndex"];
  }
  
  return self;
}





@end
