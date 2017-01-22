BANNER = {
	currentImgDiv : null,
	init : function() {
		ADMIN.photoUploaderInit(this);
	},
	imgUploadComplete : function(result) {
		var div = this.currentImgDiv;
		var eType = div.children[1];
		var eSrc = div.children[2];
		var eMediaId = div.children[3];
		var eImg = div.children[4];
		eMediaId.value  	= result.img_id;
		eType.value 		= $('#banner-type')[0].value;
		eSrc.value 			= result.image;
		eImg.src 			= result.image;
	},
	bannerUploadClick: function(e) {
		BANNER.currentImgDiv = ADMIN.findParentElement(e.target, 2).children[0];
		ADMIN.photoUpload();
	},
	bannerDeleteClick: function(e) {
		var parent = e.target.parentElement;
		var rowid = parent.children[0].value;
		var eRow = parent.parentElement.parentElement;
		$.ajax({
	         url: "/banner/delete",
	         type: "POST",
	         data: {"slide_id" : rowid },
	         success:  function(result){
	        	 debugger;
	        	 if(result.result === 200){
	        		 eRow.remove();
	        	 }else{
	        		 alert(result.msg);
	        	 }
	         },
	         error : function(){
	        	 alert("서버에 요청할수 없습니다.");
	         }
	     });
	}
}

$('.banner-upload').click(function(e) {
	BANNER.bannerUploadClick(e);
})
$('.banner-delete').click(function(e) {
	BANNER.bannerDeleteClick(e);
})
$('#newbutton').click(function(e) {
	var form = $('.banner-row')[0];
	var source   = document.getElementById("banner-template").innerHTML;
	var template = Handlebars.compile(source);
	var html     = template();
	form.insertAdjacentHTML("beforeend",html);
})
BANNER.init();