# kekokuki

## 开发环境：Flutter & Dart
Flutter 3.22.3
Framework • revision b0850beeb2 (10 months ago) • 2024-07-16 21:43:41 -0700
Engine • revision 235db911ba
Tools • Dart 3.4.4 • DevTools 2.34.3

## main入口配置
``` iOS:
{
    "name": "kekokuki",
    "request": "launch",
    "type": "dart",
    "program": "lib/main.dart",
}
```
``` Android:
- develop使用测试包名，production使用线上包名
{
    "name": "kekokuki",
    "request": "launch",
    "type": "dart",
    "program": "lib/main.dart",
    "args":[
        "--flavor",
        "develop"
    ]
}
```


## 混淆
- 详见同目录shell文件夹
/shell/README.md
/shell/prefix.py
/shell/hash.py

## 编译命令

- 生成代码
``` shell
dart run build_runner build --delete-conflicting-outputs
```

- Android打包：APK测试包
```shell
flutter build apk --flavor develop -t lib/main.dart --shrink --obfuscate --split-debug-info=./mapping --dart-define="package=1"
```

- Android打包：AAB测试包
```shell
flutter build appbundle --flavor develop -t lib/main.dart --dart-define="package=1"
```

- 上架Android打包：AAB正式包
```shell
flutter build appbundle --flavor production -t lib/main.dart --shrink --obfuscate --split-debug-info=./mapping --dart-define="package=1"
```

- 上架iOS打包：IPA正式包
```shell
flutter clean
flutter build ipa --release --obfuscate --split-debug-info=./symbols  --target=lib/main_production.dart --dart-define="package=1"

- 提审方法1: 
- cd /build/ios/archive
- 双击打开Runner.xcarchive，使用XCode提审

- 提审方法2:
- Mac App Store下载Transporter并登录开发者账号
- cd /build/ios/ipa
- 使用Transporter上传 "{AppName}.ipa"

```