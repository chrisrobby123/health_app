import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/home/controller/home_controller.dart';
import 'package:health_app/features/home/repository/home_repository.dart';

class TestApi extends ConsumerStatefulWidget {
  const TestApi({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestApiState();
}

class _TestApiState extends ConsumerState<TestApi> {
  testApi() {
    ref.read(homeRepositoryProvider).getRecipe();
  }

  @override
  void initState() {
    super.initState();
    ref.read(homeRepositoryProvider).getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(quoteFutureProvider).when(
            data: (data) {
              return SafeArea(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (ctx, i) {
                      // Map map = data.quote[i];
                      return Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            // for(va)
                            Text(data.quote[i]),
                            Text(data.author[i]),
                          ],
                        ),
                      );
                    }),
              );
            },
            error: (err, trace) {
              print(trace);
              return Center(
                child: Text(trace.toString()),
              );
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
