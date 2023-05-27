import '/model/post_model.dart';

class CourseModel {
  CourseModel({
    required this.status,
    required this.count,
    required this.countTotal,
    required this.pages,
    required this.posts,
  });

  String status;
  int count;
  int countTotal;
  int pages;
  List<Post> posts;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "count_total": countTotal,
        "pages": pages,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}
