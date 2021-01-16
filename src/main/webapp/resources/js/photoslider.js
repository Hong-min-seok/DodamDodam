$.datepicker._defaults.onAfterUpdate = null;

var datepicker__updateDatepicker = $.datepicker._updateDatepicker;
$.datepicker._updateDatepicker = function(inst) {
	datepicker__updateDatepicker.call(this, inst);

	var onAfterUpdate = this._get(inst, 'onAfterUpdate');
	if (onAfterUpdate)
		onAfterUpdate.apply((inst.input ? inst.input[0] : null),
			[(inst.input ? inst.input.val() : ''), inst]);
}


$(function() {

	var cur = -1, prv = -1;
	$('#jrange div').datepicker({
		//numberOfMonths: 3,
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		maxDate: new Date,

		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년',

		//선택한 특정날짜를 disable되도록 함 (선택 못하게)
		beforeShowDay: function(date) {

			return [true, ((date.getTime() >= Math.min(prv, cur) && date.getTime() <= Math.max(prv, cur)) ? 'date-range-selected' : '')];
		},

		onSelect: function(dateText, inst) {
			var d1, d2;

			prv = cur;
			cur = (new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay)).getTime();
			if (prv == -1 || prv == cur) {
				prv = cur;
				$('#jrange input').val(dateText);
			} else {
				d1 = $.datepicker.formatDate('yy-mm-dd', new Date(Math.min(prv, cur)), {});
				d2 = $.datepicker.formatDate('yy-mm-dd', new Date(Math.max(prv, cur)), {});
				$('#jrange input').val(d1 + ' ~ ' + d2);

			}
		},

		onChangeMonthYear: function(year, month, inst) {
			//prv = cur = -1;
		},

		onAfterUpdate: function(inst) {
			$('<button type="button" class="ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all" data-handler="hide" data-event="click">Done</button>')
				.appendTo($('#jrange div .ui-datepicker-buttonpane'))
				.on('click', function() {
					$('#jrange div').hide();
					$('#discription').hide();

					var selectDate = $("#date").val();
					var device_id = $("#device_id").val();
					
					var trans_object =
					{
						'date': selectDate,
						'device_id': device_id
					}

					console.log("보낼 데이터: " + selectDate);
					var trans_json = JSON.stringify(trans_object);
					console.log(trans_json);

					$.ajax({
						url: "./f_PhotoGet",
						type: 'POST',
						dataType: 'json',
						data: trans_json,
						contentType: 'application/json',
						mimeType: 'application/json',
						success: function(retVal) {
/*							alert("success ajax.." + '/' + retVal.photoList);*/
							$(".swiper-wrapper").empty();
							var htmlTeg = '';

							/*for (var i = 0 in retVal.photoList) {*/
							for (var i in retVal.photoList) {
								///////////////////////////
								console.log("data- " + retVal.photoList[i]);
								var dateview = retVal.photoList[i].split("$")[1].split(".")[0];
								htmlTeg = '<div class="swiper-slide"><p>'+dateview+'</p><img src="resources/f_Photo/' + retVal.photoList[i] + '"></div>';
								console.log(htmlTeg)
								$(".swiper-wrapper").append(htmlTeg);
							}


							//$(".swiper-wrapper").append(htmlTeg);

							var swiper = new Swiper('.swiper-container', {
								slidesPerView: 3,
								spaceBetween: 30,
								slidesPerGroup: 3,
								loop: true,
								loopFillGroupWithBlank: true,
								pagination: {
									el: '.swiper-pagination',
									clickable: true,
								},
								navigation: {
									nextEl: '.swiper-button-next',
									prevEl: '.swiper-button-prev',
								},
							});



						},
						error: function(retVal, status, er) {
							alert("error: " + retVal + " status: " + status + " er: " + er);
						}
					});


				});
		}
	})
		.position({
			my: 'left top',
			at: 'left bottom',
			of: $('#jrange input')
		})
		.hide();

	$('#jrange input').on('focus', function(e) {
		var v = this.value,
			d;

		try {
			if (v.indexOf(' - ') > -1) {
				d = v.split(' - ');
				console.log("if");
				prv = $.datepicker.parseDate('yy - mm - dd', d[0]).getTime();
				cur = $.datepicker.parseDate('yy - mm - dd', d[1]).getTime();
				console.log("prv: " + prv);
				console.lof("cur: " + cur);

			} else if (v.length > 0) {
				console.log("else if");
				prv = cur = $.datepicker.parseDate('yy - mm - dd', v).getTime();

			}
		} catch (e) {
			cur = prv = -1;
		}

		if (cur > -1)
			$('#jrange div').datepicker('setDate', new Date(cur));

		$('#jrange div').datepicker('refresh').show();

	});



});