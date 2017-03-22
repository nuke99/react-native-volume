
import { NativeModules,NativeEventEmitter,Platform } from 'react-native';
import { DeviceEventEmitter } from 'react-native'

const ANDROIDMAXVALUE = 15;
const { RNVolume } = NativeModules;

export default {
    getVolume : (callback) => {
        // iOS
       RNVolume.getVolume(callback);
    },

    setVolume: (value,onVolumeChangeNotification) => {
        onVolumeChangeNotification = (typeof onVolumeChangeNotification == "undefined") ? true : false;

        if(Platform.OS == 'ios'){
            RNVolume.setVolume(parseFloat(value));
        }

        else if (Platform.OS == 'android'){
            RNVolume.setVolume(parseFloat(value * ANDROIDMAXVALUE),onVolumeChangeNotification);

        }
        //iOS
    },
    onVolumeChange: (callback) => {
        // iOS 
        RNVolume.acivateListner();
        const VolumeListener = new NativeEventEmitter(NativeModules.RNVolume)
        VolumeListener.addListener('onVolumeChange', callback)
    },


} ;