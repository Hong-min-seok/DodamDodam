var flag = false;

$(function() {

	$("#newpw").blur(function() {

		var currentpw = $("#currentpw").val();
		var newpw = $("#newpw").val();
		var pwPattern = /^[A-za-z0-9]{4,12}$/g;

		var chk_num = newpw.search(/[0-9]/g);
		var chk_eng = newpw.search(/[a-z]/ig);

		if (newpw == "") {
			$("#newpwvalid").text("새 비밀번호를 입력해주세요.");
			$("#newpw").focus();
			flag = false;

		}

		else {

			if (!pwPattern.test(newpw)) {
				$("#newpwvalid").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
				$("#newpw").focus();
				flag = false;

			}

			else if (chk_num < 0 || chk_eng < 0) {
				$("#newpwvalid").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
				flag = false;
			}
			
			else if (currentpw == newpw) {
				$("#newpwvalid").text("현재 비밀번호와 새 비밀번호는 같을 수 없습니다.");
				flag = false;
			}


			else {
				$("#newpwvalid").text("");
				flag = true;
			}
		}
	});

});


$(function() {
	$("#frmbtn").click(function() {
		
		console.log("flag : " + flag);

		var newpw = $("#newpw").val();
		var newpwchk = $("#newpwchk").val();

		if (newpw == "" || newpwchk == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}

		else {

			if (flag != true) {
				alert("잘못된 비밀번호 양식입니다.");
				return;
			}

			else if (newpw != newpwchk) {
				alert("새 비밀번호를 다시 확인해주세요");
				return;
			}


			else {
				console.log("들어옴");
				var form = $("#pwchangeform");
				form.submit();
			}
		}

	});
});