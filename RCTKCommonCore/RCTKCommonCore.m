//
//  RCTKCommonCore.m
//  RCTKCommonCore
//
//  Created by NathanTu on 2018/12/20.
//  Copyright © 2018年 NathanTudc. All rights reserved.
//

#import "RCTKCommonCore.h"
#import "RCTKCommonHeader.h"
#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#elif __has_include("React/RCTBridgeModule.h")
#import "React/RCTBridgeModule.h"
#endif
#import <LocalAuthentication/LocalAuthentication.h>

@interface RCTKCommonCore()<RCTBridgeModule>
@property(nonatomic,copy) RCTPromiseResolveBlock sureBlock;
@property(nonatomic,copy) RCTPromiseRejectBlock  faileBlock;
@end
@implementation RCTKCommonCore
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(fingerprintRecognitionWithDes:(NSString*)des resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    if (!resolve || !reject) {
        return;
    }
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    NSString *description = des;
    if(!description) {
        description = RCTKFingerprintRecognitionDescription;
    }
    __weak __typeof__(RCTPromiseResolveBlock) weakResolve = resolve;
    __weak __typeof__(RCTPromiseRejectBlock) weakReject = reject;
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]){
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:description reply:^(BOOL success, NSError * _Nullable error) {
            if(success){
                weakResolve(@{KCommonCode:@(KFRSuccess),KCommonMessage:@"success"});
                return;
            }
            weakReject([NSString stringWithFormat:@"%@",@(error.code)],error.description,error);
        }];
        return;
    }
    if (reject) {
        reject([NSString stringWithFormat:@"%@",@(error.code)],error.description,error);
    }
}
-(NSString*)dataTOjsonString:(id)object{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData) {
        return error.description;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
