class WorkingHourModelClass {
  String? day;
  String? start;
  String? end;
  String? breakStart;
  String? breakEnd;
  bool? isChecked;

  WorkingHourModelClass(
      {this.day, this.start, this.end, this.breakStart, this.breakEnd, this.isChecked = false});

  WorkingHourModelClass.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    start = json['start'];
    end = json['end'];
    breakStart = json['breakStart'];
    breakEnd = json['breakEnd'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['breakStart'] = this.breakStart;
    data['breakEnd'] = this.breakEnd;
    data['isChecked'] = this.isChecked;
    return data;
  }
}

