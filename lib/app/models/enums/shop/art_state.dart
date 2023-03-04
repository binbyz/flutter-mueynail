enum ArtState {
  visible,
  invisible,
}

extension ArtStateExtension on ArtState {
  int get value {
    switch (this) {
      case ArtState.visible:
        return 1;
      case ArtState.invisible:
        return 0;
    }
  }

  static ArtState fromValue(int value) {
    switch (value) {
      case 1:
        return ArtState.visible;
      case 0:
        return ArtState.invisible;
      default:
        throw ArgumentError('Invalid value $value for enum ArtState');
    }
  }
}