import {NativeModules} from 'react-native'

const {KCommonCore} = NativeModules;

export default class KCore {

  static fingerprintRecognition (tag) {

    return KCommonCore.fingerprintRecognition(tag)
  }
  static sayHello () {

  }

}
