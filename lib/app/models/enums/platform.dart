enum Platform {
  app,
  web,
}

extension PlatformExtension on Platform {
  String get value {
    switch (this) {
      case Platform.app:
        return 'app';
      case Platform.web:
        return 'web';
    }
  }
}