# Smartpay_App

Mobile Developer Screening Test app, designed to evaluate skills and creativity in mobile app
development. This project involves converting a pixel-perfect design of the onboarding and
authentication flow, utilizing a variety of tools and technologies to create a seamless user
experience.

## Getting Started

These instructions will give you heads up on how to get started, architecture flow, implementations using in this project.

### Architecture.

I decide to adopt ```Clean Architecture``` for the development because it allow decoupling different units of your code in an organized manner.


## The project consist of some basic implementations and patterns:

* MVVM architectural approaches for the Presentation layer
  
* Network operations with [Dio](https://pub.dev/packages/dio)

* [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization and deserialization .
  
* [get_it](https://pub.dev/packages/get_it) For simple Service Locator
  
* [Provider](https://pub.dev/packages/provider) A predictable state management for handling app wide state.
  
* [Get_STorage](https://pub.dev/packages/get_storage) Flutter Secure Storage provides API to store data in secure storage. Keychain is used in iOS, KeyStore based solution is used in Android


### Installing & Setup

* Clone this project from Github to your machine
* Import project to Android Studio using the latest version (Android Studio Iguana and above)
* Run `dart run build_runner build --delete-conflicting-outputs` to build all annotations on the app
* To install the app on your device, you can get the apk from this link: build/app/outputs/flutter-apk/app-release.apk


