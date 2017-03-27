
#import "RNVolume.h"

@implementation RNVolume
@synthesize onVolumeChangeNotification;
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(hello){
    NSLog(@"hello");
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"onVolumeChange"];
}






RCT_EXPORT_METHOD(getVolume: (RCTResponseSenderBlock)callback){

    float volume = [self ngetVolume];
    callback(@[@(volume)]);
    
}

RCT_EXPORT_METHOD(setVolume:(float)volume :(BOOL *)onVolumeChangeNotification) {
    
    self.onVolumeChangeNotification = onVolumeChangeNotification;
    [self nsetVolume:volume];
}


RCT_EXPORT_METHOD(acivateListner) {
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(volumeChanged:)
     name:@"AVSystemController_SystemVolumeDidChangeNotification"
     object:nil];
    
    MPMusicPlayerController *musicPlayet = [MPMusicPlayerController applicationMusicPlayer];
    
    
}



-(float)ngetVolume{
    
    MPMusicPlayerController *musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    return musicPlayer.volume;
}

-(void)nsetVolume : (float) volume{
    MPMusicPlayerController *musicPlayet = [MPMusicPlayerController applicationMusicPlayer];
    musicPlayet.volume = volume;
}

- (void)volumeChanged:(NSNotification *)notification
{
    
    if(self.onVolumeChangeNotification == true) {
        float vol = [self ngetVolume];
        [self sendEventWithName:@"onVolumeChange" body:[NSNumber numberWithFloat:vol]];
    }
    
    self.onVolumeChangeNotification = true;
}

@end
  
