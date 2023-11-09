import 'package:cricket_score/model/cricket_info.dart';
import 'package:cricket_score/model/match_info.dart';

class MatchApiResponse {
  String? apikey;
  List<MatchInfo>? data;
  String? status;
  CricketInfo? info;

  MatchApiResponse({this.apikey, this.data, this.status, this.info});

  MatchApiResponse.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      data = <MatchInfo>[];
      json['data'].forEach((v) {
        data!.add(new MatchInfo.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? new CricketInfo.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}








