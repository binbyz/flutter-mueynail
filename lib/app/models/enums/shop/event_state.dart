enum EventState {
  visible,
  invisible,
  deleted,
}

extension EventStateExtension on EventState {
  int get value {
    switch (this) {
      case EventState.visible:
        return 1;
      case EventState.invisible:
        return 2;
      case EventState.deleted:
        return 0;
    }
  }

  static EventState fromValue(int value) {
    switch (value) {
      case 1:
        return EventState.visible;
      case 2:
        return EventState.invisible;
      case 0:
        return EventState.deleted;
      default:
        throw ArgumentError('Invalid value $value for enum EventState');
    }
  }
}