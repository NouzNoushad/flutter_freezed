import 'package:bloc/bloc.dart';
import 'package:flutter_freezed/data/model/post_model.dart';
import 'package:flutter_freezed/data/repository/post_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository postRepository;
  PostCubit({
    required this.postRepository,
  }) : super(const PostState.initial());

  getPosts() async {
    emit(const PostState.loading());
    try {
      List<PostModel>? posts = await postRepository.getPostData();
      emit(PostState.loaded(posts ?? []));
    } catch (error) {
      emit(const PostState.error());
    }
  }
}
