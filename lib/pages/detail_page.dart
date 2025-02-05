import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/api_provider.dart';
import 'package:riverpod_example/widgets/video_widget.dart';


class DetailPage extends ConsumerWidget{
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final mealState = ref.watch(mealProvider(id));

    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: mealState.when(
            data: (data){

              final meal = data[0];
              final url = meal.strYoutube.split('=')[1];
              return ListView(
                children: [
                  Text(meal.strMeal),
                  const SizedBox(height: 10,),
                  // VideoWidget(url: url,),
                  // const SizedBox(height: 10,),
                  Text(meal.strInstructions)

                ],
              );
            },
            error: (err, st) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator())
        ),
      ),
    );
  }
}
