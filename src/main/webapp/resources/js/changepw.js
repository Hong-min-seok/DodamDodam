var flag = false;
var flag2 = false;
var flag3 = false;

$(function() {
	$("#currentpw").blur(function() {

		var currentpw = $("#currentpw").val();

		var trans_object =
		{
			"currentpw": currentpw
		}

		var trans_json = JSON.stringify(trans_object);

		$.ajax({
			url: "./pwcheckajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			async: false,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal) {

				if (currentpw == "") {
					$("#curpwvalid").text("현재 비밀번호를 입력해주세요.");
					$("#currentpw").focus();
					flag = false;

				}

				else {
					flag = true;

					if (retVal == false) {
						$("#curpwvalid").text("비밀번호가 다릅니다.");
						$("#currentpw").focus();
						flag = false;

					}


					else {
						$("#curpwvalid").text("");
						flag = true;
					}
				}

			},
			error: function(retVal, status, er) {
				alert("Error! 다시 시도해주세요.");
			}
		});

	});
});

$(function() {

	$("#newpw").blur(function() {

		var currentpw = $("#currentpw").val();
		var newpw = $("#newpw").val();
		var pwPattern = /^[A-za-z0-9]{4,12}$/g;

		var chk_num = newpw.search(/[0-9]/g);
		var chk_eng = newpw.search(/[a-z]/ig);

		if (newpw == "" && flag == true) {
			$("#newpwvalid").text("새 비밀번호를 입력해주세요.");
			$("#newpw").focus();
			flag2 = false;

		}

		else {
			//flag2 = true;

			if (!pwPattern.test(newpw)) {
				$("#newpwvalid").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
				$("#newpw").focus();
				flag2 = false;

			}

			else if (chk_num < 0 || chk_eng < 0) {
				$("#newpwvalid").text("비밀번호는 4자 이상 12자 이하의 영문과 숫자로 이루어저야합니다.");
				flag2 = false;
			}
			
			else if (currentpw == newpw) {
				$("#newpwvalid").text("현재 비밀번호와 새 비밀번호는 같을 수 없습니다.");
				flag2 = false;
			}


			else {
				$("#newpwvalid").text("");
				flag2 = true;
			}
		}
	});

});


$(function() {
	$("#frmbtn").click(function() {
		
		console.log("flag : " + flag);
		console.log("flag2 : " + flag2);

		var currentpw = $("#currentpw").val();
		var newpw = $("#newpw").val();
		var newpwchk = $("#newpwchk").val();

		if (currentpw == "" || newpw == "" || newpwchk == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}

		else {
			//flag = true;

			if (flag != true || flag2 != true) {
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