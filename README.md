# CAF - SDKs

CAF Platform provides reliable SDKs that can be integrated into projects/applications for document reading and other resources, ideal for integration flows. In this project I built an application using these SDKs to help you perform this integration.

This application used the Flutter tool and presents characteristics such as
> These features need to be changed in files like build.gradle and info.plist

- [x] Document Detector
- [x] Passive Face Liveness
- [x] Face Authenticator

## ⚙️ How to configure
To integrate your project with these tools, you must have an account on the [caf]("https://docs.combateafraude.com/") platform.
After an account is created, make sure to add the imports in the build.gradle and in the Podfile for IOS, you also need to grant the camera permission in the info.plist file, calm down 😅, it's all here:

In the build.gradle file at the app folder level add
```
android {
...

buildFeatures {
    dataBinding = true
}

dataBinding.enabled = true

aaptOptions {
    noCompress "tflite"
}

...
}
```

Still in the build.gradle file at the app folder level within dependencies add the resource you will use in your project and the camera implementations
```

dependencies {
    ...
    implementation "androidx.camera:camera-view:1.2.0-alpha02"
    implementation 'com.combateafraude.sdk:document-detector:6.37.0' // -> DocumentDetector
    implementation 'com.combateafraude.sdk:passive-face-liveness:5.25.11' // -> PassiveFaceLivenes
    implementation 'com.combateafraude.sdk:face-authenticator:5.8.10' // -> FaceAuthenticator

    implementation 'com.google.android.material:material:1.2.1'
    implementation 'androidx.constraintlayout:constraintlayout:2.0.2'
    ...
}


```

For IOS, inside the folder ios/runner/info.plist add
```
  ...
  
  <key>NSCameraUsageDescription</key>
  <string>To read the documents</string>

  // Required only for the document upload flow
  <key>NSPhotoLibraryUsageDescription</key>
  <string>To select images</string>
  
```

Still on ios add in the Podfile file
```
source 'https://github.com/combateafraude/iOS.git'
source 'https://cdn.cocoapods.org/' # or 'https://github.com/CocoaPods/Specs' if the CDN is down

```

Once that's done, just add the project to pubspec.yaml
```
...

dependencies:
  flutter:
    sdk: flutter
    
  document_detector:
    git:
      url: https://github.com/combateafraude/Flutter.git
      ref: document-detector-v5.26.0-rc01

  passive_face_liveness:
    git:
      url: https://github.com/combateafraude/Flutter.git
      ref: passive-face-liveness-v4.30.0

  face_authenticator:
    git:
      url: https://github.com/combateafraude/Flutter.git
      ref: face-authenticator-v3.12.0
      
...

```

That's it, your project is set up, just use it in your app, you can base it on the code developed in this repository.


## 📱 Demo of the APP of this repository 

| Document Detector | 
| :--: |
| <div style="display: flex"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/cnh.jpg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/cnh%20side.jpeg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/cnh%201.jpeg"> </div> |



| Passive Face Liveness | 
| :--: |
| <div style="display: flex"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/passive%20face%20liveness.jpeg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/passive%20face%20liveness%201.jpg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/passive%20face%20liveness.jpg"> </div> |



| Face Authenticator | 
| :--: |
| <div style="display: flex"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/face%20authenticator.jpeg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/face%20authenticator%201.jpeg"> <img width="200" alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/passive%20face%20liveness.jpg"> </div> |


It is worth mentioning that, in order to communicate with the CAF API, it is necessary to have an access token, which in the project of this repository can be added here:

<img alt="" src="https://github.com/KaueSena01/CAF_SDK/blob/master/assets/readme/token.png">

> Since it's a simple project created inside a .dart file, I suggest you add it to an .env file or another file where the token is not versioned.


For visual customization or other settings, follow the official documentation https://docs.combateafraude.com/ 😉.

## 💻 Developer 

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/KaueSena01">
        <img src="https://avatars.githubusercontent.com/u/86299739?s=400&u=79241537628ffd14ff1f80a584669a9b491e7bc1&v=4" width="100px;" alt="Kauê Sena"/><br>
        <sub>
          <b>Kauê Alves Sena - Mobile Developer 💙</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

Thanks for your attention.
