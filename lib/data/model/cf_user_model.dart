import 'package:coddr/domain/entities/user_entity.dart';

class CFUserModel extends UserEntity {
  final String lastName;
  final String country;
  final int lastOnlineTimeSeconds;
  final String city;
  final int rating;
  final int friendOfCount;
  final String titlePhoto;
  final String handle;
  final String avatar;
  final String firstName;
  final int contribution;
  final String organization;
  final String rank;
  final int maxRating;
  final int registrationTimeSeconds;
  final String email;
  final String maxRank;

  CFUserModel(
      {this.lastName,
      this.country,
      this.lastOnlineTimeSeconds,
      this.city,
      this.rating,
      this.friendOfCount,
      this.titlePhoto,
      this.handle,
      this.avatar,
      this.firstName,
      this.contribution,
      this.organization,
      this.rank,
      this.maxRating,
      this.registrationTimeSeconds,
      this.email,
      this.maxRank})
      : super(
          firstName: firstName,
          lastName: lastName,
          handle: handle,
          email: email,
          platformHandle: 'CF',
        );

  factory CFUserModel.fromJson(Map<String, dynamic> json) {
    return CFUserModel(
      lastName: json['lastName'],
      country: json['country'],
      lastOnlineTimeSeconds: json['lastOnlineTimeSeconds'],
      city: json['city'],
      rating: json['rating'],
      friendOfCount: json['friendOfCount'],
      titlePhoto: json['titlePhoto'],
      handle: json['handle'],
      avatar: json['avatar'],
      firstName: json['firstName'],
      contribution: json['contribution'],
      organization: json['organization'],
      rank: json['rank'],
      maxRating: json['maxRating'],
      registrationTimeSeconds: json['registrationTimeSeconds'],
      email: json['email'],
      maxRank: json['maxRank'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastName'] = this.lastName;
    data['country'] = this.country;
    data['lastOnlineTimeSeconds'] = this.lastOnlineTimeSeconds;
    data['city'] = this.city;
    data['rating'] = this.rating;
    data['friendOfCount'] = this.friendOfCount;
    data['titlePhoto'] = this.titlePhoto;
    data['handle'] = this.handle;
    data['avatar'] = this.avatar;
    data['firstName'] = this.firstName;
    data['contribution'] = this.contribution;
    data['organization'] = this.organization;
    data['rank'] = this.rank;
    data['maxRating'] = this.maxRating;
    data['registrationTimeSeconds'] = this.registrationTimeSeconds;
    data['email'] = this.email;
    data['maxRank'] = this.maxRank;
    return data;
  }
}
