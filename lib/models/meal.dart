



class Meal{


  final String idMeal;
  final String strMeal;
  final String strInstructions;
  final String strMealThumb;
  final String strYoutube;
  final List<String> ingredients;


  Meal({
    required this.strMealThumb,
    required this.strMeal,
    required this.idMeal,
    required this.strInstructions,
    required this.strYoutube,
    required this.ingredients

});

  factory  Meal.fromJson(Map<String, dynamic> json){
    return  Meal(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
      strInstructions: json['strInstructions'],
      strYoutube: json['strYoutube'],
      ingredients: [
        for(final k in json.keys)
      if(k.startsWith('strIngredient'))
        if((json[k] as String).trim().isNotEmpty) json[k] as String
      ]
    );
  }

  List<String>  getIngre(Map<String, dynamic> json){
    List<String> ingres = [];
  for(final k in json.keys){
    if(k.startsWith('strIngredient')){
      final data = json[k] as String;
      if(data.trim().isNotEmpty){
        ingres.add(data);
      }
    }

  }
   return ingres;
  }






}