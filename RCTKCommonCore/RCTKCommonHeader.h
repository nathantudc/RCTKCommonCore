//
//  RCTKCommonHeader.h
//  RCTKCommonCore
//
//  Created by NathanTu on 2018/12/20.
//  Copyright © 2018年 NathanTudc. All rights reserved.
//

#ifndef RCTKCommonHeader_h
#define RCTKCommonHeader_h
typedef NS_ENUM(NSInteger,KFingerprintRecognitionCode){
    KFRSuccess                 = 1,  //认证成功
    KFRError                   = 0,  //设备不支持指纹识别
    KFRRecognitionerror        = -1, //连续三次指纹识别错误
    KFRRecognitioncancel       = -2, //在TouchID对话框中点击了取消按钮
    KFRRecognitionPassword     = -3, //在TouchID对话框中点击了输入密码按钮
    KFRRecognitionsystemcancel = -4, //TouchID对话框被系统取消，例如按下Home或者电源键
    KFRRecognitionnotsupport   = -7, //设备不支持指纹识别
    KFRRecognitionerrorLock    = -8, //连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码
};
#define RCTKFingerprintRecognitionDescription @"我们需要验证您的指纹来确认您的身份"
#define KCommonCode @"code"
#define KCommonMessage @"message"

#endif /* RCTKCommonHeader_h */
