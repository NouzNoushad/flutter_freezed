import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_freezed/data/cubit/post_cubit.dart';
import 'package:flutter_freezed/data/model/post_model.dart';

class FreezedHome extends StatefulWidget {
  const FreezedHome({super.key});

  @override
  State<FreezedHome> createState() => _FreezedHomeState();
}

class _FreezedHomeState extends State<FreezedHome> {
  @override
  Widget build(BuildContext context) {
    getPosts() {
      context.read<PostCubit>().getPosts();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
        'Flutter Freezed',
      )),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: ElevatedButton(
                  onPressed: () {
                    getPosts();
                  },
                  child: const Text('Get Posts')),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (posts) => ListView.builder(
                itemBuilder: (context, index) {
                  PostModel post = posts[index];
                  return ListTile(
                    leading: Text(post.id.toString()),
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
                itemCount: posts.length),
            error: () => Center(
              child: ElevatedButton(
                  onPressed: () {
                    getPosts();
                  },
                  child: const Text('Retry')),
            ),
          );
        },
      ),
    );
  }
}
