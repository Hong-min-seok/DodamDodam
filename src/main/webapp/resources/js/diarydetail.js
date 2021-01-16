
/*$(document).one('click', '.like-review', function(e) {
	$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
	$(this).children('.fa-heart').addClass('animate-like');
});*/


$(function(){
	var id = $('.userid').val();
	console.log(flag + "1");


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
				url: "./likeUp",
				type: 'POST',
				dataType: 'json',
				data: trans_json,
				contentType: 'application/json',
				mimeType: 'application/json',
				success: function(retVal) {
					//alert("success ajax.." + '/' + retVal.like);
					document.getElementById("likeNum").innerHTML = retVal.like;
					
					if (retVal.flag == false) {
						$('#btn_likeUp').html('');
						$('#btn_likeUp').append('<i class="fa fa-heart" aria-hidden="true"></i> 좋아요');
						$('#btn_likeUp').children('.fa-heart').removeClass('animate-like');
					} else {
						$('#btn_likeUp').html('');
						$('#btn_likeUp').append('<i class="fa fa-heart" aria-hidden="true"></i> 이 글을 좋아합니다');
						$('#btn_likeUp').children('.fa-heart').addClass('animate-like');
					}

				},
				error: function(retVal, status, er) {
				}
			});

		}
	});
});


function modal() {
	$("#imModal").show();
};


$(document).on('click', 'span', function() {

	$("#imModal").hide();
});

$(document).on('click', function(event) {

	if ($("#imModal.modal").is(event.target)) {
		$("#imModal").css({ display: "none" });
	}
});