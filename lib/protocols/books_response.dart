class BooksResponseEntity {
  List<BooksResponseBook> books;

  BooksResponseEntity({this.books});

  BooksResponseEntity.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = new List<BooksResponseBook>();(json['books'] as List).forEach((v) { books.add(new BooksResponseBook.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] =  this.books.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BooksResponseBook {
  String imageUrl;
  String description;
  int id;
  String title;

  BooksResponseBook({this.imageUrl, this.description, this.id, this.title});

  BooksResponseBook.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    description = json['description'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
