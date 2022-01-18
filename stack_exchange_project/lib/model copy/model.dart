class StackExchange {
  List<Items>? items;


  StackExchange(
      {this.items,
  });

  StackExchange.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Items {
  Owner? owner;
  bool? isAccepted;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? answerId;
  int? questionId;
  String? contentLicense;
  int? communityOwnedDate;
  int? lastEditDate;

  Items(
      {this.owner,
      this.isAccepted,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.answerId,
      this.questionId,
      this.contentLicense,
      this.communityOwnedDate,
      this.lastEditDate});

  Items.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    isAccepted = json['is_accepted'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    answerId = json['answer_id'];
    questionId = json['question_id'];
    contentLicense = json['content_license'];
    communityOwnedDate = json['community_owned_date'];
    lastEditDate = json['last_edit_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['is_accepted'] = this.isAccepted;
    data['score'] = this.score;
    data['last_activity_date'] = this.lastActivityDate;
    data['creation_date'] = this.creationDate;
    data['answer_id'] = this.answerId;
    data['question_id'] = this.questionId;
    data['content_license'] = this.contentLicense;
    data['community_owned_date'] = this.communityOwnedDate;
    data['last_edit_date'] = this.lastEditDate;
    return data;
  }
}

class Owner {
  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  String? profileImage;
  String? displayName;
  String? link;
  int? acceptRate;

  Owner(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.profileImage,
      this.displayName,
      this.link,
      this.acceptRate});

  Owner.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
    acceptRate = json['accept_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['reputation'] = this.reputation;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['profile_image'] = this.profileImage;
    data['display_name'] = this.displayName;
    data['link'] = this.link;
    data['accept_rate'] = this.acceptRate;
    return data;
  }
}