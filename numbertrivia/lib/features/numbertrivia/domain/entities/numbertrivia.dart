import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'numbertrivia.g.dart';

@HiveType(typeId: 0)
class NumberTrivia extends Equatable {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final int number;

  const NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object?> get props => [text, number];
}
