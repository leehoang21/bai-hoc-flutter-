class Either<T, E> {
  final T? data;
  final E? error;

  Either({this.data, this.error});
}

class Data<T, E> extends Either<T, E> {
  Data(T data) : super(data: data);
}

class Error<T, E> extends Either<T, E> {
  Error(E error) : super(error: error);
}
