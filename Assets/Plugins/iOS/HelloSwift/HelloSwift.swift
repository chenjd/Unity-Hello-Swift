import Foundation
import UIKit
@objc public class SwiftForUnity: UIViewController {
    @objc public static func SayHelloToUnity() -> String{
        return "Hello, I'm Swift"
    }
    
    @objc public static func OnUnityPluginLoad(){
        print("OnUnityPluginLoad")
    }
}
