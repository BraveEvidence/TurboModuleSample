//
//  RCTNativeLocalModel.m
//  myrnapp
//
//  Created by Student on 27/09/25.
//

#import "RCTNativeLocalModel.h"
#import "myrnapp-Swift.h"

@interface RCTNativeLocalModel()
@end

@implementation RCTNativeLocalModel

RCT_EXPORT_MODULE(NativeLocalModel)

NativeLocalModel *nativeLocalModel = [[NativeLocalModel alloc] init];

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeLocalModelSpecJSI>(params);
}



- (void)ask:(nonnull NSString *)prompt resolve:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject {
  dispatch_async(dispatch_get_main_queue(), ^{
    [nativeLocalModel askWithPrompt:prompt completion:^(NSString * _Nullable value) {
      resolve(value);
    }];
  });
}

@end
