$(function() {
	/* 검색어  */
	$("#btn-dictionarySearch").click(function() {
		console.log("식물 검색 - function()");
		var searchname = $("#searchname").val();

		var form = {
			"searchname": searchname
		}
		console.log(form);

		var trans_json = JSON.stringify(form)

		$.ajax({
			url: "./dictionarysearch",
			type: "POST",
			data: trans_json,
			contentType: "application/json; charset=utf-8;",
			dataType: 'json',
			success: function(data, values) {

				$(".maincontainer").empty();
				$(".maincontainer").append('<div class="container" style="margin-top: 50px"></div>');
				$(".container").append('<div class="card-deck mb-3 text-center" id="result"></div>');

				var plist = data;
				var clist = '';


				for (var i = 0; i < plist.data.length; i++) {
					var flist = plist.data[i];

					console.log(flist.f_name);

					var f_name = flist.f_name;
					var f_img = flist.f_img;

					clist += '<div class="card mb-4 shadow-sm" style="cursor:pointer" onclick="modal('
						+ "'" + f_name + "')" + '">'
						+ '<div class="card-body">'
						+ '<div class="box" style="background: #BDBDBD;">'
						+ '<img class="flower_img" src="'
						+ f_img
						+ '"/>'
						+ '</div>'
						+ '</div>'
						+ '<button type="button" class="btn btn-info btn_detail">'
						+ f_name
						+ '</button>'
						+ '</div>'
					clist += "<br>";
					//console.log("i:", i);

				} if (plist.data.length == 0) {

					clist += "<div><h3>검색결과가 없습니다.</h3></div>";

				}
				$("#result").append(clist);
				$("#result").append('<div id="imModal"></div>');

				console.log("for문 끝");

			},
			error: function() {
				alert("검색 결과가 없습니다.");
			}
		});
	});
});




function modal(fname) {
	console.log(fname);
	$("#imModal").show();

	var form2 = {
		"detail_fname": fname
	}

	var trans_json2 = JSON.stringify(form2)

	$.ajax({
		url: "./dictionarydetail",
		type: "POST",
		data: trans_json2,
		contentType: "application/json; charset=utf-8;",
		dataType: 'json',
		success: function(detail, values) {
			console.log("detail: ", detail);

			$('#imModal').html('')

			var dlist = detail.detail[0];
			//console.log("dlist:", dlist);
			//console.log("f_name:", dlist.f_name);

			var mview = '';

			if (dlist != null) {
				console.log("dlist is NOTNULL :)");
				var de = dlist;

				mview += '<div id="imModal" class="modal">'
					+ '<div class="modal-content">'
					+ '<span class="close">&times;</span>'
					+ '<div class="detailcontent01">'
					+ '<img class="detailimg" src="'
					+ de.f_img
					+ '" alt="'
					+ de.f_name
					+ '이미지를 불러오지 못했습니다."/>'
					+ '<div class="detailtxt01">'
					+ '<img class="shake" src="resources/img/shakeflower.png">'
					+ de.f_name
					+ '<img class="shake" src="resources/img/shakeflower.png">'
					+ '</div>'
					+ '<hr style="background-color: gray; height: 1.5px;">'
					+ '</div>'
					+ '<div class="detailcontent02">'
					+ '<div class="detailtxt02">'
					+ '<div class="blocks">'
					+ '<div style="width:50%; float:left; margin-right: 3em;">'
					+ '<div style="display:flex; flex-direction:row; width:75.53px;">'
					+ '<img src="resources/img/pencil.png" style="width:23px; height:26px;">'
					+ '<b>&nbsp;학명</b>'
					+ '</div>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki">'
					+ de.f_sciname
					+ '</div>'
					+ '<br>'
					+ '</div>'
					+ '<div style="width:50%; float:right;">'
					+ '<div style="display:flex; flex-direction:row; width:75.53px;">'
					+ '<img src="resources/img/flowerlan.png" style="width:28px; height:30px;">'
					+ '<b>&nbsp;꽃말</b>'
					+ '</div>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki">'
					+ de.f_lang
					+ '</div><br>'
					+ '</div>'
					+ '</div>'
					+ '<img src="resources/img/sprout.png" style="width:30px; height:30px;">'
					+ '<b>&nbsp;성장</b>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki">'
					+ de.f_grow
					+ '</div><br>'
					+ '<img src="resources/img/question2.png" style="width:33px; height:36px;">'
					+ '<b>&nbsp;사용법</b>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki">'
					+ de.f_use
					+ '</div><br>'
					+ '<div class="blocks2">'
					+ '<div style="width: 200px; margin-right: 1.5em;">'
					+ '<div style="display:flex; flex-direction:row; width:97.86px;">'
					+ '<img src="resources/img/watercan03.png" style="width:30px; height:25px;">'
					+ '<b>&nbsp;물주기</b>'
					+ '</div>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki; font-size:15pt;">'
					+ de.f_water
					+ '</div><br>'
					+ '</div>'
					+ '<div style="margin-right: 1.5em;">'
					+ '<div style="display:flex; flex-direction:row; width:75.53px;">'
					+ '<img src="resources/img/sun.png" style="width:30px; height:33px;">'
					+ '<b>&nbsp;햇빛</b>'
					+ '</div>'
					+ '<div style="color:darkgray; font-family: HoonDdukbokki; font-size:15pt;">'
					+ de.f_sun
					+ '</div><br>'
					+ '</div>'
					+ '<div style="margin-right: 1.5em;">'
					+ '<div style="display: flex; flex-direction: row; width:75.53px;">'
					+ '<img src="resources/img/humidity.png"style="width: 25px; height: 36px;">'
					+ '<b>&nbsp;습도</b>'
					+ '</div>'
					+ '<div style="color: darkgray; font-family: HoonDdukbokki; font-size:15pt;">'
					+ de.f_hum
					+ '</div><br>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
				mview += '</div>';

				$("#imModal").append(mview);

			} else {
				console.log("dlist IS NULL :(");

				mview += '<div id="imModal" class="modal">'
					+ '<div class="modal-content">'
					+ '<span class="close"> </span>'
					+ '<div style="text-align: cetner;font-family: flower;">'
					+ '<br>'
					+ '<h1>정보를 불러오지 못했습니다.</h1>'
					+ '<br>'
					+ '</div>'
					+ '</div>'
				mview += '</div>'

				$("#imModal").append(mview);

			}

		},
		error: function() {
			alert("error");
		}
	});

};


$(document).on('click', 'span', function() {
	//console.log("im SPAN");
	//console.log(document);
	$("#imModal").hide();
});

$(document).on('click', function(event) {
	//console.log("window");

	if ($("#imModal.modal").is(event.target)) {
		//console.log("event.target");
		$("#imModal").css({ display: "none" });
	}
});

$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 500) {
			$('#MOVE_TOP_BTN').fadeIn();
		} else {
			$('#MOVE_TOP_BTN').fadeOut();
		}
	});

	$("#MOVE_TOP_BTN").click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 400);
		return false;
	});
});