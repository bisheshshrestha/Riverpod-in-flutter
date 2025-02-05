import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/meal_item.dart';
import 'package:riverpod_example/providers/api_provider.dart';
import 'package:riverpod_example/routes/route_enum.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemList extends ConsumerWidget {
  final String label;
  const ItemList({super.key, required this.label});

  @override
  Widget build(BuildContext context, ref) {
    final itemsState = ref.watch(itemListProvider(label));
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('$label dishes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: itemsState.when(
          data: (data) {
            return _buildListView(data);
          },
          error: (err, st) => Center(child: Text('$err')),
          loading: () => Skeletonizer(
            child: _buildListView(
              List.generate(
                10,
                (i) => MealItem(
                    idMeal: '9',
                    strMeal: 'asd;lk asdlkjnasd',
                    strMealThumb:
                        'https://plus.unsplash.com/premium_photo-1732736768092-43a010784507?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildListView(List<MealItem> data) {
    return ListView.separated(
        separatorBuilder: (c, i) => Divider(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            child: ListTile(
              onTap: (){
                context.pushNamed(AppRoute.detail.name, pathParameters: {'id': item.idMeal});
              },
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(item.strMealThumb),
              ),
              title: Text(item.strMeal),
            ),
          );
        });
  }
}
