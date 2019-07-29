class BookListResponseEntity {
	List<BookListResponseData> data;
	bool success;

	BookListResponseEntity({this.data, this.success});

	BookListResponseEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<BookListResponseData>();(json['data'] as List).forEach((v) { data.add(new BookListResponseData.fromJson(v)); });
		}
		success = json['success'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['success'] = this.success;
		return data;
	}
}

class BookListResponseData {
	String imageUrl;
	String publisher;
	int id;
	String writer;
	String title;

	BookListResponseData({this.imageUrl, this.publisher, this.id, this.writer, this.title});

	BookListResponseData.fromJson(Map<String, dynamic> json) {
		imageUrl = json['imageUrl'];
		publisher = json['publisher'];
		id = json['id'];
		writer = json['writer'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['imageUrl'] = this.imageUrl;
		data['publisher'] = this.publisher;
		data['id'] = this.id;
		data['writer'] = this.writer;
		data['title'] = this.title;
		return data;
	}
}
