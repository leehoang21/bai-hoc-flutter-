import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

// tham số phải được đưa vào một đối tượng container để chúng có thể được
// Bao gồm trong định nghĩa phương thức lớp cơ sở trừu tượng này.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

//Điều này sẽ được sử dụng bởi mã gọi trường hợp sử dụng bất cứ khi nào trường hợp sử dụng
// không chấp nhận bất kỳ tham số nào.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}