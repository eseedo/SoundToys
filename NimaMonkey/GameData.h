//
//  GameData.h


/*
 
 其中使用NSUserDefaults来存储玩家的数据，如关卡中的最高得分，已解锁的关卡等，玩家在退出游戏中再次打开时仍然会保存此类信息
 此外，其中还设置不同关卡的一些基本信息，如不同关卡的背景图片文件名，要抛投的熊猫数量，通过关卡的分值要求等等。
 该类在经过修改后可在其它项目中重用
 
 */


#import <Foundation/Foundation.h>
//#import "cocos2d.h"


@interface GameData : NSObject {
  
  
  //人物属性值
  
  //唐僧所获得的总经验
  
  int totalMonkExpEarned;
  
  //唐僧的等级
  int currentMonkRank;
  
  //唐僧的魔法
  
  int currentMonkMp;
  
  
  
  //尼玛币数量
  int currentNimaCoins;
  
  
  //悟空所获得的总经验
  
  int totalMonkeyExpEarned;
  
  //当前关卡经验
  
  int currentLevelMonkeyExp;
  int currentLevelMonkExp;
  
  //当前关卡金钱奖励
  
  int currentLevelNimaCoin;
  
  //悟空的等级
  int currentMonkeyRank;
  
  //悟空的血量
  int currentMonkeyHp;
  
  
  
  //悟空的速度
  
  //  int currentMonkeySpeed;
  
  
  
  //悟空的攻击
  
  int currentMonkeyAttack;
  
  //所击退的怪物总数
  
  int totalMonstersKilled;
  
  //所击退的Boss总数
  
  int totalBossKilled;
  
  //当前的技能等级
  int currentSkillWaterLevel;
  int currentSkillFireLevel;
  int currentSkillSpringLevel;
  
  
  //当前的装备等级
  int currentEquipMonkBowLevel;
  int currentEquipMonkClothesLevel;
  int currentEquipStaffLevel;
  int currentEquipStickLevel;
  int currentEquipBootLevel;
  int currentEquipGoldenClothesLevel;
  
  //当前的药物数量
  
  int numberOfCurrentHpMedicine;
  int numberOfCurrentMpMedicine;
  
  
  //音效相关
  
  BOOL soundEffectMuted; //音效是否打开
  BOOL backgroundMusicMuted;//背景音乐是否打开
  
  
  
  //游戏相关
  
  //是否是第一次玩这款游戏
  BOOL notFirstTimeEnterStore;
  
  BOOL notFirstTimePlayThisGame;
  
  
  //是否暂停游戏
  BOOL gamePaused;
  
  //系统默认设置
  NSUserDefaults* defaults;
  
  
  //关卡相关
  
  int levelsCompleted; //已通过的关卡数量
  
  int chaptersCompleted;//已完成的场景数量
  
  //当前关卡是否通过
  
  BOOL currentLevelSolved;
  
  //当前关卡是否解锁
  BOOL currentLevelUnlocked;
  
  //当前游戏场景是否解锁
  BOOL currentChapterUnlocked;
  
  
  //所选场景和关卡
  
  int _selectedChapter;
  int _selectedLevel;
  
  //当前关卡的评价（非历史最佳成绩，而是此次通关时的评价，历史最佳成绩保存在Levels-Chapter1.xml中）
  
  int currentLevelStars;
  

  
  //是否是初始值
  BOOL numberOfHpMedicineChanged;
  BOOL numberOfMpMedicineChanged;
  
  BOOL numberOfNimaCoinChanged;
  
  BOOL levelOfSkillWaterChanged;
  BOOL levelOfSkillFireChanged;
  BOOL levelOfSkillSpringChanged;
  
  BOOL levelOfEquipMonkBowlChanged;
  BOOL levelOfEquipMonkClothesChanged;
  BOOL levelOfEquipStaffChanged;
  BOOL levelOfEquipStickChanged;
  BOOL levelOfEquipBootChanged;
  BOOL levelOFEquipGoldenClothesChanged;
  
  BOOL rankOfMonkChanged;
  BOOL rankOfMonkeyChanged;
  
  BOOL expOfMonkChanged;
  BOOL expOfMonkeyChanged;
  
  BOOL chapterChanged;
    
    int currentBackgroundMusicIndex;
    
    
    //判断设备类型
    
    BOOL isDeviceIphone5;
    
    int selectedPianoType;
    
    BOOL hasSwitchedToAnimaSounds;
  
}

@property(nonatomic,assign) NSInteger currentNimaCoins;

@property(nonatomic,assign) BOOL currentLevelSolved,currentLevelUnlocked,currentChapterUnlocked;

@property(nonatomic,assign) int selectedPianoType;
@property(nonatomic,assign) BOOL hasSwitchedToAnimaSounds;


@property(nonatomic) NSInteger levelsCompleted,chaptersCompleted;

@property (nonatomic, assign) int selectedChapter;
@property(nonatomic,assign) int currentBackgroundMusicIndex;
@property (nonatomic, assign) int selectedLevel;

@property(nonatomic)BOOL soundEffectMuted,backgroundMusicMuted;
@property(nonatomic)BOOL notFirstTimePlayThisGame,notFirstTimeEnterStore;
@property(nonatomic)BOOL gamePaused;

@property(nonatomic,assign) int totalMonstersKilled, totalBossKilled,totalMonkExpEarned,totalMonkeyExpEarned,currentLevelMonkeyExp,currentLevelMonkExp;
@property(nonatomic,assign) int currentMonkRank,currentMonkeyRank;

@property(nonatomic,assign)int currentSkillWaterLevel,currentSkillFireLevel,currentSkillSpringLevel;

@property(nonatomic,assign)int currentEquipMonkBowLevel,currentEquipMonkClothesLevel,currentEquipStaffLevel,currentEquipStickLevel,currentEquipBootLevel,currentEquipGoldenClothesLevel;

@property(nonatomic)BOOL numberOfHpMedicineChanged,numberOfMpMedicineChanged,numberOfNimaCoinChanged,levelOfSkillWaterChanged,levelOfSkillFireChanged,levelOfSkillSpringChanged,levelOfEquipMonkBowlChanged,levelOfEquipMonkClothesChanged,levelOfEquipStaffChanged,levelOfEquipStickChanged,levelOfEquipBootChanged,levelOFEquipGoldenClothesChanged,rankOfMonkChanged,rankOfMonkeyChanged,expOfMonkChanged,expOfMonkeyChanged;


@property(nonatomic,assign)int numberOfCurrentHpMedicine,numberOfCurrentMpMedicine;

@property(nonatomic,assign)int currentMonkMp,currentMonkeyHp,currentMonkeySpeed,currentMonkeyAttack,currentLevelNimaCoin;
@property(nonatomic)BOOL chapterChanged;

@property(nonatomic)BOOL isDeviceIphone5;

+(GameData*) sharedData;


//初始化
-(id)init;

@end
