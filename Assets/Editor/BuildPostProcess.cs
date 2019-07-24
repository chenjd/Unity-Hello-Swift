using UnityEngine;
using UnityEditor;
using UnityEditor.iOS.Xcode;
using UnityEditor.Callbacks;

public class BuildPostProcess : MonoBehaviour
{
    [PostProcessBuild]
    public static void OnPostProcessBuild(BuildTarget buildTarget, string path)
    {
        if(buildTarget != BuildTarget.iOS)
        {
            return;
        }

        string projPath = path + "/Unity-iPhone.xcodeproj/project.pbxproj";
        
        var proj = new PBXProject();
        proj.ReadFromFile(projPath);
        var targetGUID = proj.TargetGuidByName("Unity-iPhone");

        //set xcode proj properties
        proj.AddBuildProperty(targetGUID, "SWIFT_VERSION", "4.0");
        
        proj.WriteToFile(projPath);

    }

}
