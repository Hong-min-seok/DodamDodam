
$(function() {

	$.ajax({
		url: "./getregisterplantsajax",
		type: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function(retVal) {

			if (retVal.length == 0) {
				var plus = "div.element1";
				$(plus).empty();
				$(plus).append(
					"<img class='plus' alt='add' src='resources/img/icon/plus.png' " +
					"style='width:50px; height:50px; margin-left:40px; margin-top:40px' " +
					"onclick=location.href=" + "'regismyplants'" + ">"
				);
			}

			else {
				var plus = "div.element" + (retVal.length + 1);
			}

			for (var i = 0; i < retVal.length; i++) {


				var f_shape = retVal[i].flower.f_shape;
				var f_nick = retVal[i].flower.f_nick;
				var device_id = retVal[i].device_id;
				var element = "div.element" + (i + 1);
				var namesign = "div.namesign" + (i + 1);

				$(element).empty();
				$(element).append(
					"<img alt='pot' src='resources/img/flowerselect/" + f_shape + ".png' onclick=location.href='mygarden?device_id=" + device_id + "'>"
				);
				$(namesign).empty();
				$(namesign).append(
					"<img alt='pot' src='resources/img/icon/sign2.png'>"
				);
				$(namesign).append(
					"<div class='name" + (i + 1) + "'>" + f_nick + "</div>"
				);
				$(plus).empty();
				$(plus).append(
					"<img class='plus' alt='add' src='resources/img/icon/plus.png' " +
					"style='width:50px; height:50px; margin-left:40px; margin-top:40px' " +
					"onclick=location.href=" + "'regismyplants'" + ">"
				);

			}


		},
		error: function(retVal, status, er) {
			alert("Error! 다시 시도해주세요.");
		}
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
						+ '<img class="shake" src="resources/img/shakeflower.png" style="width:55px; height:55px; ">'
						+ de.f_name
						+ '<img class="shake" src="resources/img/shakeflower.png" style="width:55px; height:55px; ">'
						+ '</div>'
						+ '<hr style="background-color: gray; height: 1.5px;">'
						+ '</div>'
						+ '<div class="detailcontent02">'
						+ '<div class="detailtxt02">'
						+ '<img src="resources/img/flowerIcon2.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;학명</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_sciname
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;꽃말</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_lang
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon2.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;성장</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_grow
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;물주기</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_water
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon2.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;햇빛</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_sun
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;습도</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_hum
						+ '</div><br>'
						+ '<img src="resources/img/flowerIcon2.png" style="width:25px; height:50px;">'
						+ '<b>&nbsp;사용법</b><div style="color:darkgray; font-family: HoonDdukbokki">'
						+ de.f_use
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
						+ '<span class="close">x</span>'
						+ '<div class="detailcontent01">'
						+ '<img class="detailimg" src="resources/img/flowerselect/BasicPlant.png"/>'
						+ '</div>'
						+ '<div style="text-align: cetner; font-family: HangeulNuri-Bold;">'
						+ '<br>' + '<h1 style="text-align: center">정보를 불러오지 못했습니다.</h1>' + '<br>'
						+ '<h3 style="text-align: center">더 많은 식물 정보를 준비중입니다.</h3>'
						+ '<br>' + '</div>' + '</div>'
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
		$("#imModal").css({
			display: "none"
		});
	}
});