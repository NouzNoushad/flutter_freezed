import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_freezed/data/cubit/post_cubit.dart';

import '../repository/post_repository.dart';

class CubitWidget extends StatelessWidget {
  final Widget child;
  const CubitWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepository(),
      child: BlocProvider(
        create: (context) => PostCubit(
            postRepository: RepositoryProvider.of<PostRepository>(context)),
        child: child,
      ),
    );
  }
}
