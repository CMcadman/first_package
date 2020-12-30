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

### DataTable
- 排序的图标显示需要同时设置sortColumnIndex，以及对应的DataColumn中的onSort，否则不显示

### DragTarget
- DragTarget与Draggable配合使用时，Draggable中必须设置data,不然会导致onwillAccept返回null报错
- LongPressDraggable继承自Draggable，唯一不同的是触发方式，长按触发

### DropdownButtonHideUnderline
- 此控件为减少控件，如果DropdownButton是DropdownButtonHideUnderline的子控件，那么DropdownButton的下划线将不起作用

### ExpansionPanelList
- ExpansionPanelList需要被SingleChildScrollView包裹
- expansionCallback为展开/关闭回调，返回展开/关闭子控件的索引及状态
- ExpansionPanel中headerBuilder为关闭时显示内容，body为展开时显示的内容


