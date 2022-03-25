class Repo {
  final String id;
  final String name;
  late final bool hasStarred;

  void toggleHasStarred() {
    hasStarred = !hasStarred;
  }

  Repo({
    required this.id,
    required this.hasStarred,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'viewerHasStarred': hasStarred,
    };
  }

  Repo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hasStarred = json['viewerHasStarred'];
}
