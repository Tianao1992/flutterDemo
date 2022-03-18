import 'package:favorcate/core/model/meal_model.dart';
import 'http_requset.dart';

class MealRequest {
  static Future<List<MealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";
    final result = await HttpRequest.requset(url);

    // 2.json转modal
    final mealArray = result["meal"];
    List<MealModel> meals = [];
    for (var json in mealArray) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}
