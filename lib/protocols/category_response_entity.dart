class CategoryResponseEntity {
	List<CategoryResponseData> data;
	bool success;

	CategoryResponseEntity({this.data, this.success});

	CategoryResponseEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<CategoryResponseData>();(json['data'] as List).forEach((v) { data.add(new CategoryResponseData.fromJson(v)); });
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

class CategoryResponseData {
	String name;
	List<CategoryResponseDataSubcategroy> subCategroy;
	int id;

	CategoryResponseData({this.name, this.subCategroy, this.id});

	CategoryResponseData.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		if (json['subCategroy'] != null) {
			subCategroy = new List<CategoryResponseDataSubcategroy>();(json['subCategroy'] as List).forEach((v) { subCategroy.add(new CategoryResponseDataSubcategroy.fromJson(v)); });
		}
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		if (this.subCategroy != null) {
      data['subCategroy'] =  this.subCategroy.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		return data;
	}
}

class CategoryResponseDataSubcategroy {
	String name;
	int id;

	CategoryResponseDataSubcategroy({this.name, this.id});

	CategoryResponseDataSubcategroy.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}
