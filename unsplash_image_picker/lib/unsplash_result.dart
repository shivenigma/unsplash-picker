class ProfileImage {
  String small;
  String medium;
  String large;
  ProfileImage({this.small, this.medium, this.large});
  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      large: json['large'],
      small: json['small'],
      medium: json['medium'],
    );
  }
}
class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  UserLinks({
    this.self,
    this.html,
    this.likes,
    this.photos});
  factory UserLinks.fromJson(Map<String, dynamic> json) {
    return UserLinks(
    self: json['self'],
    html: json['html'],
    likes: json['likes'],
    photos: json['pho']);
  }
}
class UnsplashUser {
  String id;
  String username;
  String name;
  String first_name;
  String last_name;
  String instagram_username;
  String twitter_username;
  String portfolio_url;
  String bio;
  ProfileImage profile_image;
  UserLinks links;
  UnsplashUser({
    this.id,
    this.username,
    this.name,
    this.first_name,
    this.last_name,
    this.instagram_username,
    this.twitter_username,
    this.portfolio_url,
    this.bio,
    this.profile_image,
    this.links
  });
  factory UnsplashUser.fromJson(Map<String, dynamic> json) {
    var profileImage = ProfileImage.fromJson(json['profile_image']);
    var links = UserLinks.fromJson(json['links']);
    return UnsplashUser(
      id: json['id'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      instagram_username: json['instagram_username'] as String,
      twitter_username: json['twitter_username'] as String,
      portfolio_url: json['portfolio_url'] as String,
      bio: json['bio'] as String,
      profile_image: profileImage,
      links: links
    );
  }
}
class ImageUrls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  ImageUrls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb});
  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    return ImageUrls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
    );
  }
}
class ImageReferences {
  String self;
  String html;
  String download;
  ImageReferences({this.self, this.html, this.download});
  factory ImageReferences.fromJson(Map<String, dynamic> json) {
    return ImageReferences(
      download: json['download'],
      html: json['html'],
      self: json['self'],
    );
  }
}

class UnsplashResults {
  String id;
  String created_at;
  int width;
  int height;
  String color;
  int likes;
  bool liked_by_user;
  String description;
  UnsplashUser user;
  ImageUrls urls;
  ImageReferences links;
  UnsplashResults({
    this.id,
    this.created_at,
    this.width,
    this.height,
    this.color,
    this.liked_by_user,
    this.likes,
    this.description,
    this.user,
    this.urls,
    this.links});
  factory UnsplashResults.fromJson(Map<String, dynamic> json) {
    var user = UnsplashUser.fromJson(json['user']);
    var imageUrl = ImageUrls.fromJson(json['urls']);
    var imageRef = ImageReferences.fromJson(json['links']);
    return UnsplashResults(
      id: json['id'] as String,
      created_at: json['created_at'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      likes: json['likes'] as int,
      liked_by_user: json['liked_by_user'] as bool,
      description: json['description'] as String,
      user: user,
      urls: imageUrl,
      links: imageRef
    );
  }
}