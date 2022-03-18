abstract class AnimationState {
  final double position;
  final int count;
  final List<double> _imagesPosition = [];

  List<double> get imagesPosition => _imagesPosition;
  AnimationState({required this.position, required this.count}) {
    for (var i = 0; i < count; i++) {
      _imagesPosition.add(position + i);
    }
  }
}

class AnimationInitialState extends AnimationState {
  AnimationInitialState({required double position, required int count})
      : super(position: position, count: count);
}

class ClickArrowBackState extends AnimationState {
  ClickArrowBackState({required double position, required int count})
      : super(position: position, count: count);
}

class ClickArrowForwardState extends AnimationState {
  ClickArrowForwardState({required double position, required int count})
      : super(position: position, count: count);
}
