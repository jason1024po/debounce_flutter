simple debounce widget
一个简单的防止重复点击组件


## Base Usage（基本用法）
```dart
DebounceWidget(
  child: ElevatedButton(
    onPressed: (){},
    child: const Text("Submit"),
  ),
)
```

## Other Usage （其它参数）
```dart
DebounceWidget(
  onDebounce: () => print("too fast / 太快了"), // options/可选
  duration: 5000, //  milliseconds options / 毫秒 可选
  child: ElevatedButton(
    onPressed: vm.loginOrRegister,
    child: const Text("登 录"),
  ),
)
```

## Global （全局设置）
```dart
DebounceWidget.defaultDuration = 10000;
```