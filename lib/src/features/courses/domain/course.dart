class Course {
  Course({
    required this.id,
    required this.appxCourseId,
    required this.discordRoleId,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.openToEveryone,
    required this.slug,
    required this.discordOauthUrl,
    required this.certIssued,
  });
  int id;
  String appxCourseId;
  String discordRoleId;
  String title;
  String imageUrl;
  String description;
  bool openToEveryone;
  String slug;
  String discordOauthUrl;
  bool certIssued;

  factory Course.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final appxCourseId = data['appxCourseId'] as String;
    final discordRoleId = data['discordRoleId'] as String;
    final title = data['title'] as String;
    final imageUrl = data['imageUrl'] as String;
    final description = data['description'] as String;
    final openToEveryone = data['openToEveryone'] as bool;
    final slug = data['slug'] as String;
    final discordOauthUrl = data['discordOauthUrl'] as String;
    final certIssued = data['certIssued'] as bool;
    return Course(
      id: id,
      appxCourseId: appxCourseId,
      discordRoleId: discordRoleId,
      title: title,
      imageUrl: imageUrl,
      description: description,
      openToEveryone: openToEveryone,
      slug: slug,
      discordOauthUrl: discordOauthUrl,
      certIssued: certIssued,
    );
  }
}
