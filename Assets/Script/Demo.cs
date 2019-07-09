using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Demo : MonoBehaviour
{
    void OnGUI()
    {
        if(GUI.Button(new Rect(100, 100, 100, 100),"Say Hello!"))
        {
            string hello = HelloSwift.SayHelloToUnity();
            Debug.Log(hello);
        }
    }
}
