# Flutter Restart App

[![pub package](https://img.shields.io/pub/v/flutter_restart_app.svg)](https://pub.dev/packages/flutter_restart_app)
[![License: Proprietary](https://img.shields.io/badge/license-Proprietary-red.svg)](LICENSE)

Seamlessly restart your Flutter desktop applications with a single line of code.

![Flutter Restart App Demo](https://path.to/your/demo.gif)

## 🚀 Features

- 🔄 Instant app restart
- ⏱️ Scheduled restarts
- 🖥️ Desktop platform support (macOS, Windows*, Linux*)

*Note: Windows and Linux support is experimental and needs further testing.

## 🛠️ Installation

Add `flutter_restart_app` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_restart_app: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## 🔧 Usage

### Import the package

```dart
import 'package:flutter_restart_app/flutter_restart_app.dart';
```

### Restart immediately

```dart
await FlutterRestartApp.instance.now();
```

### Schedule a restart

```dart
FlutterRestartApp.instance.scheduleRestart(Duration(seconds: 5));
```

## 📱 Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_restart_app/flutter_restart_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Restart App Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => FlutterRestartApp.instance.now(),
                child: Text('Restart Now'),
              ),
              ElevatedButton(
                onPressed: () => FlutterRestartApp.instance.scheduleRestart(Duration(seconds: 5)),
                child: Text('Restart in 5 seconds'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 💻 Platform Support

| Platform | Support    |
|----------|------------|
| macOS    | ✅ Stable   |
| Windows  | 🧪 Experimental |
| Linux    | 🧪 Experimental |

## 🤝 Contributing

We welcome contributions to improve Flutter Restart App, especially for Windows and Linux support. If you encounter any issues or have suggestions, please open an issue on our [GitHub repository](https://github.com/klarity-app/flutter_restart_app).

To contribute:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please note that all contributions are subject to review and approval by the Klarity team.

## 📄 License

This project is proprietary software owned by Klarity. All rights reserved. See the [LICENSE](LICENSE) file for details.

## 📬 Contact

For any inquiries or support, please contact us at info@klarity.app

---

Made with ❤️ by [Klarity](https://www.klarity.app)
