import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:numbertrivia/app_view.dart';
import 'package:numbertrivia/features/numbertrivia/domain/entities/numbertrivia.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(const AppView());

  Hive.registerAdapter(NumberTriviaAdapter());
}
