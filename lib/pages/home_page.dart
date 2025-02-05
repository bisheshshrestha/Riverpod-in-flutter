import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/api_provider.dart';
import 'package:riverpod_example/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categoryState = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Category List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: categoryState.when(
            data: (data){
              return ListView.separated(
                  itemBuilder: (context, index){
                    final category = data[index];
                    return InkWell(
                      onTap: (){
                        context.pushNamed(AppRoute.itemList.name, pathParameters: {'label': category.strCategory});
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                              height: 150,
                              width: 150,
                              imageUrl: category.strCategoryThumb),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(category.strCategory),
                                if(category.strCategoryDescription.length > 200)Text( category.strCategoryDescription.substring(0, 200))
                                else Text(category.strCategoryDescription)
                                ,
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (c, i) => Divider(),
                  itemCount: data.length
              );
            },
            error: (err, st) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator())
        ),
      )
    );
  }
}
