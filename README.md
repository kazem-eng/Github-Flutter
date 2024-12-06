# flutter_issues_viewer

An app to view issues on the Flutter repository with the limited filter and sort functionality

### Setup Instructions

Please follow below steps:

- Download and install Flutter sdk More info [here](https://docs.flutter.dev/get-started/install)
- Download and install IDE (vscode is recommended)
- Open the project
- Run following commands:
  - flutter pub get ( to download required packages)
  - flutter packages pub run build_runner build ( to generate files and codes required for project)
- Select a target device such as android-iphone emulator or real device.follow [here](https://docs.flutter.dev/get-started/test-drive) and [here](https://developer.android.com/studio/run/managing-avds) if help is needed:
- flutter run (to run the project)
  - for more info on flutter cli [here](https://docs.flutter.dev/reference/flutter-cli)

\*\*Please make sure that your phone/emulator is connected to the internet so that you are be able to data

### Release info

- android :
  - flutter build apk --release
- ios :
  - flutter build ipa --release
- more info [ios](https://docs.flutter.dev/deployment/ios) and [android](https://docs.flutter.dev/deployment/android)

### Architecture

Following principles are followed:

- CLEAN architecture 
- MVVM pattern for presentation layer
- Injection pattern for dependencies and instantiation
- SOLID principles
- Latest Flutter coding style, conventions and lints
- Covered by Unit Tests and Widget Tests