class SpinnerResponseEntity {
	SpinnerResponseData data;
	bool success;

	SpinnerResponseEntity({this.data, this.success});

	SpinnerResponseEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SpinnerResponseData.fromJson(json['data']) : null;
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

class SpinnerResponseData {
	List<SpinnerResponseDataSpinner> spinners;

	SpinnerResponseData({this.spinners});

	SpinnerResponseData.fromJson(Map<String, dynamic> json) {
		if (json['spinners'] != null) {
			spinners = new List<SpinnerResponseDataSpinner>();(json['spinners'] as List).forEach((v) { spinners.add(new SpinnerResponseDataSpinner.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.spinners != null) {
      data['spinners'] =  this.spinners.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SpinnerResponseDataSpinner {
	String imageUrl;
	String linkUrl;

	SpinnerResponseDataSpinner({this.imageUrl, this.linkUrl});

	SpinnerResponseDataSpinner.fromJson(Map<String, dynamic> json) {
		imageUrl = json['imageUrl'];
		linkUrl = json['linkUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['imageUrl'] = this.imageUrl;
		data['linkUrl'] = this.linkUrl;
		return data;
	}
}
