class HomeModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  dynamic description;
  dynamic altDescription;
  Urls? urls;
  Links? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  Sponsorship? sponsorship;
  User? user;

  HomeModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    promotedAt = json['promoted_at'];
    width = json['width'] as int?;
    height = json['height'] as int?;
    color = json['color'] as String?;
    blurHash = json['blur_hash'] as String?;
    description = json['description'];
    altDescription = json['alt_description'];
    urls = (json['urls'] as Map<String,dynamic>?) != null ? Urls.fromJson(json['urls'] as Map<String,dynamic>) : null;
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
    likes = json['likes'] as int?;
    likedByUser = json['liked_by_user'] as bool?;
    currentUserCollections = json['current_user_collections'] as List?;
    sponsorship = (json['sponsorship'] as Map<String,dynamic>?) != null ? Sponsorship.fromJson(json['sponsorship'] as Map<String,dynamic>) : null;
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['promoted_at'] = promotedAt;
    json['width'] = width;
    json['height'] = height;
    json['color'] = color;
    json['blur_hash'] = blurHash;
    json['description'] = description;
    json['alt_description'] = altDescription;
    json['urls'] = urls?.toJson();
    json['links'] = links?.toJson();
    json['likes'] = likes;
    json['liked_by_user'] = likedByUser;
    json['current_user_collections'] = currentUserCollections;
    json['sponsorship'] = sponsorship?.toJson();
    json['user'] = user?.toJson();
    return json;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'] as String?;
    full = json['full'] as String?;
    regular = json['regular'] as String?;
    small = json['small'] as String?;
    thumb = json['thumb'] as String?;
    smallS3 = json['small_s3'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['raw'] = raw;
    json['full'] = full;
    json['regular'] = regular;
    json['small'] = small;
    json['thumb'] = thumb;
    json['small_s3'] = smallS3;
    return json;
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] as String?;
    html = json['html'] as String?;
    download = json['download'] as String?;
    downloadLocation = json['download_location'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['self'] = self;
    json['html'] = html;
    json['download'] = download;
    json['download_location'] = downloadLocation;
    return json;
  }
}

class Sponsorship {
  List<String>? impressionUrls;
  String? tagline;
  String? taglineUrl;
  Sponsor? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  Sponsorship.fromJson(Map<String, dynamic> json) {
    impressionUrls = (json['impression_urls'] as List?)?.map((dynamic e) => e as String).toList();
    tagline = json['tagline'] as String?;
    taglineUrl = json['tagline_url'] as String?;
    sponsor = (json['sponsor'] as Map<String,dynamic>?) != null ? Sponsor.fromJson(json['sponsor'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['impression_urls'] = impressionUrls;
    json['tagline'] = tagline;
    json['tagline_url'] = taglineUrl;
    json['sponsor'] = sponsor?.toJson();
    return json;
  }
}

class Sponsor {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  dynamic lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  dynamic location;
  Links? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  Sponsor({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    updatedAt = json['updated_at'] as String?;
    username = json['username'] as String?;
    name = json['name'] as String?;
    firstName = json['first_name'] as String?;
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'] as String?;
    portfolioUrl = json['portfolio_url'] as String?;
    bio = json['bio'] as String?;
    location = json['location'];
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
    profileImage = (json['profile_image'] as Map<String,dynamic>?) != null ? ProfileImage.fromJson(json['profile_image'] as Map<String,dynamic>) : null;
    instagramUsername = json['instagram_username'] as String?;
    totalCollections = json['total_collections'] as int?;
    totalLikes = json['total_likes'] as int?;
    totalPhotos = json['total_photos'] as int?;
    acceptedTos = json['accepted_tos'] as bool?;
    forHire = json['for_hire'] as bool?;
    social = (json['social'] as Map<String,dynamic>?) != null ? Social.fromJson(json['social'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['updated_at'] = updatedAt;
    json['username'] = username;
    json['name'] = name;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['twitter_username'] = twitterUsername;
    json['portfolio_url'] = portfolioUrl;
    json['bio'] = bio;
    json['location'] = location;
    json['links'] = links?.toJson();
    json['profile_image'] = profileImage?.toJson();
    json['instagram_username'] = instagramUsername;
    json['total_collections'] = totalCollections;
    json['total_likes'] = totalLikes;
    json['total_photos'] = totalPhotos;
    json['accepted_tos'] = acceptedTos;
    json['for_hire'] = forHire;
    json['social'] = social?.toJson();
    return json;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'] as String?;
    medium = json['medium'] as String?;
    large = json['large'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['small'] = small;
    json['medium'] = medium;
    json['large'] = large;
    return json;
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  Social.fromJson(Map<String, dynamic> json) {
    instagramUsername = json['instagram_username'] as String?;
    portfolioUrl = json['portfolio_url'] as String?;
    twitterUsername = json['twitter_username'] as String?;
    paypalEmail = json['paypal_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['instagram_username'] = instagramUsername;
    json['portfolio_url'] = portfolioUrl;
    json['twitter_username'] = twitterUsername;
    json['paypal_email'] = paypalEmail;
    return json;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  dynamic lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  dynamic location;
  Links? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    updatedAt = json['updated_at'] as String?;
    username = json['username'] as String?;
    name = json['name'] as String?;
    firstName = json['first_name'] as String?;
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'] as String?;
    portfolioUrl = json['portfolio_url'] as String?;
    bio = json['bio'] as String?;
    location = json['location'];
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
    profileImage = (json['profile_image'] as Map<String,dynamic>?) != null ? ProfileImage.fromJson(json['profile_image'] as Map<String,dynamic>) : null;
    instagramUsername = json['instagram_username'] as String?;
    totalCollections = json['total_collections'] as int?;
    totalLikes = json['total_likes'] as int?;
    totalPhotos = json['total_photos'] as int?;
    acceptedTos = json['accepted_tos'] as bool?;
    forHire = json['for_hire'] as bool?;
    social = (json['social'] as Map<String,dynamic>?) != null ? Social.fromJson(json['social'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['updated_at'] = updatedAt;
    json['username'] = username;
    json['name'] = name;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['twitter_username'] = twitterUsername;
    json['portfolio_url'] = portfolioUrl;
    json['bio'] = bio;
    json['location'] = location;
    json['links'] = links?.toJson();
    json['profile_image'] = profileImage?.toJson();
    json['instagram_username'] = instagramUsername;
    json['total_collections'] = totalCollections;
    json['total_likes'] = totalLikes;
    json['total_photos'] = totalPhotos;
    json['accepted_tos'] = acceptedTos;
    json['for_hire'] = forHire;
    json['social'] = social?.toJson();
    return json;
  }
}


