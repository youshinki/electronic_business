class GirlResponseEntity {
	GirlResponseData data;
	bool success;

	GirlResponseEntity({this.data, this.success});

	GirlResponseEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new GirlResponseData.fromJson(json['data']) : null;
		success = json['success'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['success'] = this.success;
		return data;
	}
}

class GirlResponseData {
	String name;

	GirlResponseData({this.name});

	GirlResponseData.fromJson(Map<String, dynamic> json) {
		name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		return data;
	}
}
