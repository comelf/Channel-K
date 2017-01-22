$('tr').click(function(e){
	var noticeId = $(this).find('.notice-id');
	var faqId = $(this).find('.faq-id');
	if(noticeId.val()){
		location.replace('/meesig/notice/'+noticeId.val());
	}else if(faqId.val()){
		location.replace('/meesig/faq/'+faqId.val());
	}
})