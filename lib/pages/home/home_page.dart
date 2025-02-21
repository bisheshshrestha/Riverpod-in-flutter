import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/gen_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentState = ref.watch(getCommentsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async{
          await Future.delayed(Duration(milliseconds: 500));
          ref.invalidate(getCommentsProvider);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: commentState.when(
            skipLoadingOnRefresh: false,
            data: (data){
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    final comment = data[index];
                    return ListTile(
                      title: Text(comment.body),
                      subtitle: Text(comment.user.fullName),
                    );
                  }
              );
            },
            error: (err, str) => Center(child: Text('$err')),
            loading: () => Skeletonizer(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text("asdasdasdasdasd"),
                      subtitle: Text("asdaasdadadasd"),

                    );
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}