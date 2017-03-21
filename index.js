
import { NativeModules,NativeEventEmitter } from 'react-native';

const { RNVolume } = NativeModules;

export default {
    getVolume : (callback) => {
        

        // iOS
       RNVolume.getVolume(callback);
    },

    setVolume: (value) => {
        //iOS
        RNVolume.setVolume(parseFloat(value));
    },
    onVolumeChange: (callback) => {

        // iOS 
        RNVolume.acivateListner();
        const VolumeListener = new NativeEventEmitter(NativeModules.RNVolume)
        VolumeListener.addListener('onVolumeChange', callback)
    }
} ;