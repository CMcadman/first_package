# first_harry

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## ScreenAdapter

由于使用了flutter_screenutil做屏幕的适配，需要初始化
ASScreenAdapter.init(context);

## Flutter package
- 在package包里面设置iamge.asset时，需要指定package
- 加载网络图片时，需要使用HTTPS
- 在外部需要使用package包里面的文件有两种方式，一种是绝对路径引入，另外一种是在package中使用export导出，外部只需要引入package包名.dart即可
- pubspec.yaml中使用author在 flutter packages pub pulish --dry-run 会报错，暂未使用

```
/// 使用git方式加载 first_harry是package包名，URL为地址 ref选择分支
first_harry:
    git:
      url: https://github.com/CMcadman/first_package.git
      ref: master
```

