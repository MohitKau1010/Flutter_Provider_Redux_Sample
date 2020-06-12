class Ad {
    String company;
    String text;
    String url;

    Ad({this.company, this.text, this.url});

    factory Ad.fromJson(Map<String, dynamic> json) {
        return Ad(
            company: json['company'], 
            text: json['text'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['company'] = this.company;
        data['text'] = this.text;
        data['url'] = this.url;
        return data;
    }
}