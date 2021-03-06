//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)initWithAudioSource:(AKAudio *)audioSource
{
    self = [super init];
    if (self) {

        // Instrument Properties
        _reverb  = [[AKInstrumentProperty alloc] initWithValue:0.0
                                                       minimum:0.0
                                                       maximum:1.0];
        [self addProperty:_reverb];

        // Instrument Definition
        AKReverb *reverb = [[AKReverb alloc] initWithAudioSource:audioSource
                                                   feedbackLevel:_reverb
                                                 cutoffFrequency:akp(4000)];
        [self connect:reverb];

        // Audio Output
        AKAudioOutput *audio;
        audio = [[AKAudioOutput alloc] initWithStereoAudioSource:reverb];
        [self connect:audio];

        // Reset Inputs
        [self resetParameter:audioSource];
    }
    return self;
}
@end
