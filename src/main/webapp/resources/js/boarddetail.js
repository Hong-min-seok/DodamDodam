function comment() {

	var comment_content = $(".comment_textarea").val();

	if (comment_content == "") {
		alert('댓글을 입력해주세요!');
	}

	else {

		var index = $("#index").val()
		var userid = $("#userid").val();
		var nick = $("#nick").val();

		var trans_object =
		{
			'index': index,
			'userid': userid,
			'nick': nick,
			'content': comment_content
		}

		var trans_json = JSON.stringify(trans_object);

		$.ajax({
			url: "./insertComment",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal) {

				$(".comment_textarea").val("");

				var dlist = '<div id="comment' + retVal.index + '" class="comment">'
					+ '<div class="comment_title">'
					+ '<div class="comment_nick"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;' + retVal.nick + '</div>'
					+ '<div class="comment_date">' + retVal.date
					+ '&nbsp;&nbsp;&nbsp;<a onclick="deleteComment(' + retVal.index + ')">X</a></div>'
					+ '</div>'
					+ '<div class="comment_content">'
					+ retVal.content
					+ '</div>'
					+ '</div>'


				$(".comment_container").append(dlist);


			},
			error: function(retVal, status, er) {
				alert("Error! 다시 시도해주세요.");
			}
		});


	}
}


function deleteComment(comment_index) {

	var parent_index = $("#index").val()
	var comment_index = comment_index;

	var trans_object =
	{
		'parent_index': parent_index,
		'comment_index': comment_index
	}

	var trans_json = JSON.stringify(trans_object);

	$.ajax({
		url: "./deleteComment",
		type: 'POST',
		dataType: 'json',
		data: trans_json,
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function(retVal) {


			$("#comment" + comment_index).remove();


		},
		error: function(retVal, status, er) {
			alert("Error! 다시 시도해주세요.");
		}
	});


}



$(function() {
	var id = $('#userid').val();
	//console.log(flag + "1");


	$("#btn_likeUp").click(function() {

		if (id == null || id == '') {
			alert("좋아요는 회원만 가능한 기능입니다.\n로그인을 해주세요!");
			location.href = "./login";
			return false;


		}

		else {

			var index = $("#index").val();

			var trans_object =
			{
				"index": index,
				"userid": id

			}

			console.log(index);
			var trans_json = JSON.stringify(trans_object);
			console.log(trans_json);

			$.ajax({
				url: "./BoardlikeUp",
				type: 'POST',
				dataType: 'json',
				data: trans_json,
				contentType: 'application/json',
				mimeType: 'application/json',
				success: function(retVal) {
					//alert("success ajax.." + '/' + retVal.like);
					document.getElementById("likeNum").innerHTML = retVal.like + "&nbsp;&nbsp";

					if (retVal.flag == false) {
						$('#btn_likeUp').html('');
						$('#btn_likeUp').append('<i class="fa fa-heart" aria-hidden="true"></i> 좋아요');
						$('#btn_likeUp').children('.fa-heart').removeClass('animate-like');
					} else {
						$('#btn_likeUp').html('');
						$('#btn_likeUp').append('<i class="fa fa-heart" aria-hidden="true"></i> 이 글을 좋아합니다!');
						$('#btn_likeUp').children('.fa-heart').addClass('animate-like');
					}

				},
				error: function(retVal, status, er) {
				}
			});

		}
	});
});