import 'package:hive_flutter/hive_flutter.dart';
import 'package:evoting/config/config.dart';

class HiveRepository {
  final Box _box = Hive.box(boxName);

}
