#import "HelloSwift-Swift.h"
#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#include "Unity/IUnityInterface.h"


extern "C" void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginLoad(IUnityInterfaces* unityInterfaces);
extern "C" void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginUnload();


@interface MyAppController : UnityAppController
{
}
- (void)shouldAttachRenderDelegate;
@end
@implementation MyAppController
- (void)shouldAttachRenderDelegate;
{
    UnityRegisterRenderingPluginV5(&UnityPluginLoad, &UnityPluginUnload);
}
@end
IMPL_APP_CONTROLLER_SUBCLASS(MyAppController);

extern "C" void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginLoad(IUnityInterfaces* unityInterfaces)
{
    [SwiftForUnity OnUnityPluginLoad];
}

extern "C" void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginUnload()
{
    [SwiftForUnity OnUnityPluginLoad];
}

extern "C" {
    char* _sayHelloToUnity() {
        NSString *returnString = [SwiftForUnity SayHelloToUnity];
        char* cStringCopy(const char* string);
        return cStringCopy([returnString UTF8String]);
    }
}

char* cStringCopy(const char* string){
    if (string == NULL){
        return NULL;
    }
    char* res = (char*)malloc(strlen(string)+1);
    strcpy(res, string);
    return res;
}
