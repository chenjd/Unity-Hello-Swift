using System;
using System.Runtime.InteropServices;
public class HelloSwift 
{
   [DllImport("__Internal")]
   private static extern string _sayHelloToUnity();
   
   public static string SayHelloToUnity()
   {
      return _sayHelloToUnity();
   }
   
}