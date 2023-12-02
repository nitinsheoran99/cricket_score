class MatchScoreInfo {
  int? r;
  int? w;
  num? o;
  String? inning;

  MatchScoreInfo({this.r, this.w, this.o, this.inning});

  MatchScoreInfo.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'];
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['r'] = r;
    data['w'] = w;
    data['o'] = o;
    data['inning'] = inning;
    return data;
  }
}