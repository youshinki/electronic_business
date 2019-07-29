class NaviResponseEntity {
	NaviResponseData data;
	bool success;

	NaviResponseEntity({this.data, this.success});

	NaviResponseEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new NaviResponseData.fromJson(json['data']) : null;
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

class NaviResponseData {
	List<NaviResponseDataIcon> icons;

	NaviResponseData({this.icons});

	NaviResponseData.fromJson(Map<String, dynamic> json) {
		if (json['icons'] != null) {
			icons = new List<NaviResponseDataIcon>();(json['icons'] as List).forEach((v) { icons.add(new NaviResponseDataIcon.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.icons != null) {
      data['icons'] =  this.icons.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class NaviResponseDataIcon {
	String iconName;
	String navi;
	String iconUrl;

	NaviResponseDataIcon({this.iconName, this.navi, this.iconUrl});

	NaviResponseDataIcon.fromJson(Map<String, dynamic> json) {
		iconName = json['iconName'];
		navi = json['navi'];
		iconUrl = json['iconUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['iconName'] = this.iconName;
		data['navi'] = this.navi;
		data['iconUrl'] = this.iconUrl;
		return data;
	}
}
