
$(function() {
	$("#f_date").keypress(function(event) {event.preventDefault();});
	var current_shape = document.getElementById("current_shape").value;

	var f_shape = document.getElementsByName("f_shape");

	for (var i = 0; i < f_shape.length; i++) {

		if (f_shape[i].value == current_shape) {
			f_shape[i].checked = true;
		}
	}
});


function formsubmit() {

	var form = document.getElementById("modifyform");

	if (check_f_name() == false) {
		$("#f_name").focus();
		return;
	}

	if (check_f_nick() == false) {
		$("#f_nick").focus();
		return;
	}

	if (check_f_shape() == false) {
		alert("화분 모양을 선택해주세요");
		$("#f_shape").focus();
		return;
	}

	if (check_f_date() == false) {
		alert("심은 날짜를 선택해주세요");
		$("#f_date").focus();
		return;
	}

	form.submit();

}

function check_f_name() {

	var f_name = document.getElementById("f_name").value;
	var f_namePattern = /^[가-힣A-za-z0-9]/g;


	if (f_name == "") {
		alert("식물 종을 입력해주세요");
		return false;
	}

	else if (!f_namePattern.test(f_name)) {
		alert("잘못된 식물 종 양식입니다.");
		return false;
	}

	return true;
}

function check_f_nick() {

	var flag = true;
	var f_nick = document.getElementById("f_nick").value;
	var now_device = document.getElementById("device_id").value;
	var nickPattern = /^[가-힣A-za-z0-9]{1,4}$/g;

	if (f_nick == "") {
		alert("화분 닉네임을 입력해주세요");
		return false;
	}

	if (nickPattern.test(f_nick) == false) {
		alert("화분 닉네임은 특수문자를 포함할 수 없으며 4자를 넘을 수 없습니다.");
		return false;
	}

	var trans_object =
	{
		'f_nick': f_nick,
		'now_device': now_device
	}

	var trans_json = JSON.stringify(trans_object);

	$.ajax({
		url: "./f_nickDuplicationCheck",
		type: "POST",
		dataType: "json",
		data: trans_json,
		async: false,
		contentType: "application/json",
		mimeType: "application/json",
		success: function(retVal) {


			if (retVal == true) {
				alert("중복된 화분 닉네임입니다!");
				flag = false;
			}

		},
		error: function(retVal, status, er) {
			alert("화분 닉네임 중복체크 실패");
		}
	});

	return flag;

}

function check_f_shape() {

	var flag = false;
	var f_shape = document.getElementsByName("f_shape");

	for (var i = 0; i < f_shape.length; i++) {
		if (f_shape[i].checked == true) {
			flag = true;
		}
	}

	if (flag == false) {
		return false;
	}

	return true;
}

function check_f_date() {

	var f_date = document.getElementById("f_date").value;

	if (f_date == "") {
		return false;
	}

	return true;
}