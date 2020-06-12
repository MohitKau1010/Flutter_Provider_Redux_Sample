import 'Ad.dart';
import 'Data.dart';

class UserData {
    List<Data> data;
    Ad ad;
    int page;
    int per_page;
    int total;
    int total_pages;

    UserData({this.data, this.ad, this.page, this.per_page, this.total, this.total_pages});

    factory UserData.fromJson(Map<String, dynamic> json) {
        return UserData(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            ad: json['ad'] != null ? Ad.fromJson(json['ad']) : null, 
            page: json['page'], 
            per_page: json['per_page'], 
            total: json['total'], 
            total_pages: json['total_pages'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page'] = this.page;
        data['per_page'] = this.per_page;
        data['total'] = this.total;
        data['total_pages'] = this.total_pages;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        if (this.ad != null) {
            data['ad'] = this.ad.toJson();
        }
        return data;
    }
}