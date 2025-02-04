import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/api_provider.dart';



class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categoryState = ref.watch(categoryProvider);
    return categoryState.when(
        data: (data){
          return SliverList.separated(
              itemCount: data.length,
              itemBuilder: (context, index){
                final category = data[index];
                return Column(
                  children: [
                    Image.network(category.strCategoryThumb),
                    Text(category.strCategory),
                    Text(category.strCategoryDescription)
                  ],
                );
              },
              separatorBuilder: (c, i) => Divider()
          );
        },
        error: (err, st) => SliverFillRemaining(child: Center(child: Text('$err')),),
        loading: () => SliverFillRemaining(child: Center(child: CircularProgressIndicator()),)
    );
  }
}
