class Post {
  Post({
    required this.id,
    required this.vid,
    required this.catId,
    required this.videoTitle,
    required this.videoUrl,
    required this.videoId,
    required this.videoThumbnail,
    required this.videoDuration,
    required this.videoDescription,
    required this.videoType,
    required this.size,
    required this.totalViews,
    required this.dateTime,
    required this.categoryName,
  });

  int id;
  int vid;
  int catId;
  String videoTitle;
  String videoUrl;
  String videoId;
  String? videoThumbnail;
  String? videoDuration;
  String videoDescription;
  String? videoType;
  String size;
  int totalViews;
  DateTime dateTime;
  String categoryName;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        vid: json["vid"],
        catId: json["cat_id"],
        videoTitle: json["video_title"],
        videoUrl: json["video_url"],
        videoId: json["video_id"],
        videoThumbnail: json["video_thumbnail"],
        videoDuration: json["video_duration"],
        videoDescription: json["video_description"],
        videoType: json["video_type"],
        size: json["size"],
        totalViews: json["total_views"],
        dateTime: DateTime.parse(json["date_time"]),
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vid": vid,
        "cat_id": catId,
        "video_title": videoTitle,
        "video_url": videoUrl,
        "video_id": videoId,
        "video_thumbnail": videoThumbnail,
        "video_duration": videoDuration,
        "video_description": videoDescription,
        "video_type": videoType,
        "size": size,
        "total_views": totalViews,
        "date_time": dateTime.toIso8601String(),
        "category_name": categoryName,
      };
}
