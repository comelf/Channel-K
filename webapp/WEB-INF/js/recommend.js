RECOMMEND = {
	currentImgDiv : null,
	init : function() {
		ADMIN.photoUploaderInit(this);
	},
	itemChoiceClick: function(e) {
		RECOMMEND.currentImgDiv = ADMIN.findParentElement(e.target, 2).children[0];
		ADMIN.popupItems(this.popupResult1.bind(this));
	},
	itemChangeClick: function(e) {
		RECOMMEND.currentImgDiv = ADMIN.findParentElement(e.target, 1);
		ADMIN.popupItems(this.popupResult2.bind(this));
	},
	imgUploadClick: function(e) {
		RECOMMEND.currentImgDiv = ADMIN.findParentElement(e.target, 2);
		ADMIN.photoUpload();
	},
	imgUploadComplete : function(result) {
		result.image;
		result.img_id;
		var div = this.currentImgDiv;
		var eImg = div.children[0];
		var eMediaId = div.parentElement.children[0].children[3];
		eImg.src 			  = result.image;
		eMediaId.defaultValue = result.img_id;
	},
	
	popupResult1 : function(data) {
		var div = this.currentImgDiv;
		var pDiv = ADMIN.findParentElement(div, 2);
		var hDiv = pDiv.children[0];
		var eItemId = hDiv.children[2];
		var eImg = pDiv.children[1].children[0];
		var iDiv = pDiv.children[3].children[0];
		var eTitle = iDiv.children[1].children[1];
		var eDes = iDiv.children[2].children[1];
		eItemId.defaultValue	= data.itemId;
		eTitle.value 		= data.itemName;
		eDes.value 			= data.itemDes;
		eImg.src 			= data.mediaPath;
	},
	popupResult2 : function(data) {
		var div = this.currentImgDiv;
		var eImg     = div.children[0];
		var eItemId  = div.children[3];
		var eMediaId = div.children[4];
		eImg.src = data.mediaPath;
		eItemId.value = data.itemId;
		eMediaId.value = data.mediaId;
	}
}

$('.recommend-upload').click(function(e) {
	RECOMMEND.itemChoiceClick(e);
})

$('.recommend-change').click(function(e) {
	RECOMMEND.itemChangeClick(e);
})

$('.recommend-mo-upload').click(function(e) {
	RECOMMEND.imgUploadClick(e);
})

RECOMMEND.init();