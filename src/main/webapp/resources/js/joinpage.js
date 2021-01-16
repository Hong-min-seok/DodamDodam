
var flag = false;
var flag2 = false;
var flag3 = false;
var flag4 = false;


$(function() {

	$("#joinid").blur(function() {

		var joinid = $("#joinid").val();
		var joinnick = $("#joinnick").val();
		var joinmail = $("#joinmail").val();
		var joinpw = $("#joinpw").val();
		var joinpwchk = $("#joinpwchk").val();
		var idPattern = /^[A-za-z0-9]{4,16}$/g;

		var trans_object =
		{
			'userid': joinid,
			'pw': joinpw,
			'nick': joinnick,
			'email': joinmail
		}

		var trans_json = JSON.stringify(trans_object);

		$.ajax({
			url: "./memberduplicationajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal) {

				var chk_num = joinid.search(/[0-9]/g);
				var chk_eng = joinid.search(/[a-zA-Z]/ig);


				if (retVal.id_exist == true) {
					$(".idvalidate").text("중복된 아이디입니다.");
					flag = false;
				}

				else if (joinid == "") {
					$(".idvalidate").text("아이디를 입력해주세요.");
					flag = false;
				}

				else if (chk_num < 0 || chk_eng < 0) {
					$(".idvalidate").text("아이디는 4자 이상 16자 이하 영문과 숫자로 구성되어야합니다.");
					flag = false;
				}

				else if (!idPattern.test(joinid)) {
					$(".idvalidate").text("아이디는 4자 이상 16자 이하 영문과 숫자로 구성되어야합니다.");
					flag = false;
				}

				else {
					$(".idvalidate").text("");
					flag = true;
				}

			},
			error: function(retVal, status, er) {
				alert("Error! 다시 시도해주세요.");
			}
		});
	});

});

$(function() {

	$("#joinnick").blur(function() {

		var joinid = $("#joinid").val();
		var joinnick = $("#joinnick").val();
		var joinmail = $("#joinmail").val();
		var joinpw = $("#joinpw").val();
		var joinpwchk = $("#joinpwchk").val();

		var trans_object =
		{
			'userid': joinid,
			'pw': joinpw,
			'nick': joinnick,
			'email': joinmail
		}

		var trans_json = JSON.stringify(trans_object);

		$.ajax({
			url: "./memberduplicationajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal) {

				var nickPattern = /^[가-힣A-za-z0-9]{0,50}$/g;
				var chk_num = joinnick.search(/[0-9]/g);
				var chk_eng = joinnick.search(/[가-힣a-zA-Z]/ig);


				if (retVal.nick_exist == true) {
					$(".nickvalidate").text("중복된 닉네임입니다.");
					flag2 = false;
				}


				else if (joinnick == "") {
					$(".nickvalidate").text("닉네임을 입력해주세요.");
					flag2 = false;
				}
				
				else if (nickPattern.test(joinnick) == false) {
					$(".nickvalidate").text("닉네임은 특수문자를 포함할 수 없습니다.");
					flag2 = false;
				}

				else if (chk_num < 0 && chk_eng < 0) {
					$(".nickvalidate").text("닉네임은 문자 또는 숫자를 한글자 이상 포함해야합니다.");
					flag2 = false;
				}

				else if (joinnick.length < 2 || joinnick.length > 10) {
					$(".nickvalidate").text("닉네임은 2자 이상 10자 이하의 한글, 영문, 숫자만 사용할 수 있습니다.");
					flag2 = false;
				}

				else {
					$(".nickvalidate").text("");
					flag2 = true;
				}

			},
			error: function(retVal, status, er) {
				alert("Error! 다시 시도해주세요.");
			}
		});
	});

});

$(function() {

	$("#joinmail").blur(function() {

		var joinmail = $("#joinmail").val();
		var mailPattern = /^[\w.%+\-]+@[\w.\-]+\.[A-Za-z]{2,3}$/;

		if (joinmail == "") {
			$(".emailvalidate").text("이메일을 입력해주세요.");
			flag3 = false;
		}


		else if (!mailPattern.test(joinmail)) {
			$(".emailvalidate").text("잘못된 이메일 형식입니다");
			flag3 = false;
		}

		else {
			$(".emailvalidate").text("※ 이메일로 인증 번호를 전송하니, 정확히 입력해주세요!");
			flag3 = true;
		}
	});
});

$(function() {

	$("#joinpw").blur(function() {

		var joinpw = $("#joinpw").val();
		var joinid = $("#joinid").val();
		var pwPattern = /^[A-za-z0-9]{4,12}$/g;

		var chk_num = joinpw.search(/[0-9]/g);
		var chk_eng = joinpw.search(/[a-z]/ig);


		if (joinpw == "") {
			$(".pwvalidate").text("비밀번호를 입력해주세요.");
			flag4 = false;
		}


		else if (!pwPattern.test(joinpw)) {
			$(".pwvalidate").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
			flag4 = false;
		}

		else if (chk_num < 0 || chk_eng < 0) {
			$(".pwvalidate").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
			flag4 = false;
		}

		else if (joinid == joinpw) {
			$(".pwvalidate").text("아이디와 비밀번호는 같을 수 없습니다.");
			flag4 = false;
		}

		else {
			$(".pwvalidate").text("");
			flag4 = true;
		}
	});
});

$(function() {

	$("#joinbtn").click(function() {
		console.log(flag);

		var joinid = $("#joinid").val();
		var joinnick = $("#joinnick").val();
		var joinmail = $("#joinmail").val();
		var joinpw = $("#joinpw").val();
		var joinpwchk = $("#joinpwchk").val();

		if (joinpw != joinpwchk) {
			alert("비밀번호를 다시 확인해주세요.");
			return;
		}

		else if (joinid == "" || joinnick == "" || joinmail == "" || joinpw == "" || joinpwchk == "" || flag != true || flag2 != true || flag3 != true || flag4 != true) {
			alert("회원가입 양식이 잘못되었습니다. 다시 시도해주세요.");
			return;
		}

		else {
			flag = null;
			var joinform = document.getElementById("joinform");
			joinform.submit();
		}


	});



});