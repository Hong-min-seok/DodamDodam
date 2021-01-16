var flag = true;
var flag2 = true;

$(function() {


	$("#nick").blur(function() {
		flag = true;
		var nick = $("#nick").val();

		if (nick == "") {
			flag = false;
			$("#nick").focus();
			$("#nickvalid").text("닉네임을 입력해주세요.");
			return;
		}

		else {
			flag = true;
			var trans_object =
			{
				"nick": nick
			}

			var trans_json = JSON.stringify(trans_object);

			$.ajax({
				url: "./nickduplicationajax",
				type: 'POST',
				dataType: 'json',
				data: trans_json,
				async: false,
				contentType: 'application/json',
				mimeType: 'application/json',
				success: function(retVal) {

					var nickPattern = /^[가-힣A-za-z0-9]{0,50}$/g;
					var chk_num = nick.search(/[0-9]/g);
					var chk_eng = nick.search(/[가-힣a-zA-Z]/ig);

					if (retVal == true) {
						flag = false;
						$("#nick").focus();
						$("#nickvalid").text("이미 존재하는 닉네임입니다.");
						return;
					}

					else {
						flag = true;
						if (nick.length < 2 || nick.length > 10) {
							flag = false;
							$("#nick").focus();
							$("#nickvalid").text("닉네임은 2자 이상 10자 이하의 한글, 영문, 숫자만 사용할 수 있습니다.");
							return;
						}

						else if (nickPattern.test(joinnick) == false) {
							$(".nickvalidate").text("닉네임은 특수문자를 포함할 수 없습니다.");
							flag2 = false;
						}

						else if (chk_num < 0 && chk_eng < 0) {
							flag = false;
							$("#nickvalid").text("닉네임은 문자 또는 숫자를 한글자 이상 포함해야합니다.");
						}

						else {
							flag = true;
							$("#nickvalid").text("");
						}
					}

				},
				error: function(retVal, status, er) {
					alert("Error! 다시 시도해주세요.");
				}
			});

		}

	});

});


$(function() {
	$("#mail").blur(function() {
		flag2 = true;
		var mail = $("#mail").val();
		var mailPattern = /^[\w.%+\-]+@[\w.\-]+\.[A-Za-z]{2,3}$/;

		if (mail == "") {
			flag2 = false;
			$("#mail").focus();
			$("#mailvalid").text("이메일을 입력해주세요");
			return;
		}
		else {
			flag2 = true;
			if (!mailPattern.test(mail)) {
				flag2 = false;
				$("#mail").focus();
				$("#mailvalid").text("잘못된 이메일 형식입니다.");
				return;
			}
			else {
				flag2 = true;
				$("#mailvalid").text("※ 이메일로 인증 번호를 전송하니, 정확히 입력해주세요!");
			}
		}
	});
});

$(function() {

	$("#frmbtn").click(function() {
		var nick = $("#nick").val();
		var mail = $("#mail").val();

		if (nick == "" || mail == "" || flag != true || flag2 != true) {
			alert("잘못된 입력입니다.");
			console.log('flag ' + flag);
			console.log('flag2 ' + flag2);
		}
		else {
			console.log('flag ' + flag);
			console.log('flag2 ' + flag2);
			var form = document.getElementById("infochangeform");
			form.submit();
		}

	});
});