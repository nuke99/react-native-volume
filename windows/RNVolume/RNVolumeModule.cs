using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNVolume
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNVolumeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNVolumeModule"/>.
        /// </summary>
        internal RNVolumeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNVolume";
            }
        }
    }
}
