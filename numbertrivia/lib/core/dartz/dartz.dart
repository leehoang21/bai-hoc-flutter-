abstract class Either<Type, Error> {
  final Type? data;
  final Error? error;

  Either({this.data, this.error});
}

class Clean<Type, Error> extends Either<Type, Error> {
  Clean({
    required Type data,
  }) : super(data: data, error: null);
}

class Failed<Type, Error> extends Either<Type, Error> {
  Failed({
    required Error error,
  }) : super(data: null, error: error);
}
