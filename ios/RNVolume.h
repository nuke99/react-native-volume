
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif
#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioSession.h>

#import <MediaPlayer/MediaPlayer.h>
#import "RCTEventEmitter.h"



@interface RNVolume : RCTEventEmitter <RCTBridgeModule>

@property (nonatomic) BOOL onVolumeChangeNotification;

-(void)hello;
-(void)getVolume;
-(void)setVolume:(float)volume :(BOOL *)onVolumeChangeNotification;


@end
  
