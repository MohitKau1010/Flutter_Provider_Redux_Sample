class Datas {
    String color;
    int id;
    String name;
    String pantone_value;
    int year;

    Datas({this.color, this.id, this.name, this.pantone_value, this.year});

    factory Datas.fromJson(Map<String, dynamic> json) {
        return Datas(
            color: json['color'], 
            id: json['id'], 
            name: json['name'], 
            pantone_value: json['pantone_value'], 
            year: json['year'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['color'] = this.color;
        data['id'] = this.id;
        data['name'] = this.name;
        data['pantone_value'] = this.pantone_value;
        data['year'] = this.year;
        return data;
    }
}