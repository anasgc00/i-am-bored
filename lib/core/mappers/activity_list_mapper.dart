import '../../data/models/activity_mode.dart';

class TodoListMapper {
  List<ActivityModel> mapList(List<Map<String, dynamic>> jsonMapList) {
    final values =
        jsonMapList.map((json) => ActivityModel.fromJson(json)).toList();
    return values;
  }
}
