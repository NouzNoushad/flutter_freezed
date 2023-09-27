import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_freezed/data/model/post_model.dart';
import 'package:flutter_freezed/utils/end_points.dart';

class PostRepository {
  Dio dio = Dio();
  Future<List<PostModel>?> getPostData() async {
    String uri = '$baseUrl/${EndPoints.posts}';
    var response = await dio.get(uri);
    if (response.statusCode == 200) {
      List<PostModel> postModelList = response.data.map<PostModel>((post) {
        debugPrint('/////////// post: ${PostModel.fromJson(post)}');
        return PostModel.fromJson(post);
      }).toList();
      debugPrint('response: $postModelList');
      return postModelList;
    }
    return null;
  }
}
