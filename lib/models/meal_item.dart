



class MealItem{


  final String idMeal;
  final String strMeal;
  final String strMealThumb;


  MealItem({
   required this.idMeal,
    required this.strMeal,
    required this.strMealThumb
  });

  factory  MealItem.fromJson(Map<String, dynamic> json){
    return  MealItem(
       idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb']
    );
  }




}