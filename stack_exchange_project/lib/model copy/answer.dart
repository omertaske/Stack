


  import 'dart:convert';

Answer answerFromJson(String str) => Answer.fromJson(json.decode(str));

String answerToJson(Answer data) => json.encode(data.toJson());




class Answer {
  List<Items>? items;
  bool? hasMore;
  int? backoff;
  int? quotaMax;
  int? quotaRemaining;
  int? page;
  int? pageSize;
  int? total;
  String? type;

  Answer(
      {this.items,
      this.hasMore,
      this.backoff,
      this.quotaMax,
      this.quotaRemaining,
      this.page,
      this.pageSize,
      this.total,
      this.type});

  Answer.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    backoff = json['backoff'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
    page = json['page'];
    pageSize = json['page_size'];
    total = json['total'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = this.hasMore;
    data['backoff'] = this.backoff;
    data['quota_max'] = this.quotaMax;
    data['quota_remaining'] = this.quotaRemaining;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['total'] = this.total;
    data['type'] = this.type;
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