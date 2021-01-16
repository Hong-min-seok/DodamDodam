
var chartDrowFun = {

	chartDrow: function(dataTHM) {
		var chartData = '';

		console.log(dataTHM);

		//날짜형식 변경하고 싶으시면 이 부분 수정하세요.
		var chartDateformat = 'yyyy년MM월dd일';
		//라인차트의 라인 수
		var chartLineCount = 10;
		//컨트롤러 바 차트의 라인 수
		var controlLineCount = 10;


		function drawDashboard() {

			var data = new google.visualization.DataTable();
			//그래프에 표시할 컬럼 추가
			data.addColumn('datetime', '날짜');
			data.addColumn('number', '온도');
			data.addColumn('number', '습도');
			data.addColumn('number', '수분');

			//그래프에 표시할 데이터
			var dataRow = [];

			console.log(dataTHM.length);

			for (var i = 0; i < dataTHM.length; i++) { //랜덤 데이터 생성
				var temp = dataTHM[i].temp;
				var humi = dataTHM[i].humi;
				var mois = dataTHM[i].mois;
				var dateArr = dataTHM[i].date.split('-');
				console.log(dateArr[0] + dateArr[1] + dateArr[2]);

				dataRow = [new Date(dateArr[0], dateArr[1], dateArr[2], dataTHM[i].time), temp, humi, mois];
				data.addRow(dataRow);
			}


			var chart = new google.visualization.ChartWrapper({
				chartType: 'LineChart',
				containerId: 'lineChartArea', //라인 차트 생성할 영역
				options: {
					isStacked: 'percent',
					focusTarget: 'category',
					height: 500,
					width: '100%',
					legend: { position: "top", textStyle: { fontSize: 13 } },
					pointSize: 5,
					tooltip: { textStyle: { fontSize: 12 }, showColorCode: true, trigger: 'both' },
					hAxis: {
						format: chartDateformat, gridlines: {
							count: chartLineCount, units: {
								years: { format: ['yyyy년'] },
								months: { format: ['MM월'] },
								days: { format: ['dd일'] },
								hours: { format: ['HH시'] }
							}
						}, textStyle: { fontSize: 12 }
					},
					vAxis: { minValue: 100, viewWindow: { min: 0 }, gridlines: { count: -1 }, textStyle: { fontSize: 12 } },
					animation: { startup: true, duration: 1000, easing: 'in' },
					annotations: {
						pattern: chartDateformat,
						textStyle: {
							fontSize: 15,
							bold: true,
							italic: true,
							color: '#871b47',
							auraColor: '#d799ae',
							opacity: 0.8,
							pattern: chartDateformat
						}
					}
				}
			});

			var control = new google.visualization.ControlWrapper({
				controlType: 'ChartRangeFilter',
				containerId: 'controlsArea',  //control bar를 생성할 영역
				options: {
					ui: {
						chartType: 'LineChart',
						chartOptions: {
							chartArea: { 'width': '60%', 'height': 80 },
							hAxis: {
								'baselineColor': 'none', format: chartDateformat, textStyle: { fontSize: 12 },
								gridlines: {
									count: controlLineCount, units: {
										years: { format: ['yyyy년'] },
										months: { format: ['MM월'] },
										days: { format: ['dd일'] },
										hours: { format: ['HH시'] }
									}
								}
							}
						}
					},
					filterColumnIndex: 0
				}
			});

			var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat });
			date_formatter.format(data, 0);

			var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
			window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
			dashboard.bind([control], [chart]);
			dashboard.draw(data);

		}
		google.charts.setOnLoadCallback(drawDashboard);

	}
}


$(function() {
	$("#target").hide();
	$("#target").click(function() {

		$.ajax({
			url: "./getTHM?device_id=" + document.getElementById('d_id').value,
			type: 'POST',
			success: function(retVal) {
				//alert("success ajax.." + '/' + retVal.val);
				google.charts.load('current', { 'packages': ['line', 'controls'] });
				chartDrowFun.chartDrow(retVal); //chartDrow() 실행
			},
			error: function(retVal, status, er) {
			}
		});

	});
	$('#target').trigger("click");

});

$(function() {

	$.ajax({
		url: "./getTHM_myavg?device_id=" + document.getElementById('d_id').value,
		type: 'POST',
		success: function(retVal) {
			//alert("temp : " + retVal.tempavg + "  humiavg : " + retVal.humiavg + "  moisavg : " + retVal.moisavg);
			$(".mytemp").text(retVal.tempavg + "℃");
			$(".myhumi").text(retVal.humiavg + "%");
			$(".mymois").text(retVal.moisavg + "%");
		},
		error: function(retVal, status, er) {
		}
	});
});

$(function() {
	
	var f_name = $("#f_name").val();
	
	var trans_object =
		{
			'f_name': f_name
		}
	
	console.log(trans_object);
		
	var trans_json = JSON.stringify(trans_object);

	$.ajax({
		url: "./getTHM_othersavg",
		type: 'POST',
		dataType: 'json',
		data: trans_json,
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function(retVal) {
			//alert("getTHM_othersavg ajax");
			$(".otherstemp").text(retVal.tempavg + "℃");
			$(".othershumi").text(retVal.humiavg + "%");
			$(".othersmois").text(retVal.moisavg + "%");
			
			
			var mytemp = $(".mytemp").text().slice(0,-1);
			var myhumi = $(".myhumi").text().slice(0,-1);
			var mymois = $(".mymois").text().slice(0,-1);
			
			
			if (mytemp - retVal.tempavg > 3){
				$(".tempbox").addClass("lightred");
				$(".difftemp").text("전체 평균보다 " + Number(mytemp - retVal.tempavg) + "℃ 높아요");
				}
			else if (retVal.tempavg - mytemp > 3) {
				$(".tempbox").addClass("lightblue");
				$(".difftemp").text("전체 평균보다 " + Number(retVal.tempavg - mytemp) + "℃ 낮아요");
				}
			else {
				$(".tempbox").addClass("lightgreen");
				$(".difftemp").text("전체 평균과 비슷해요");
				}
				
			if (myhumi - retVal.humiavg > 3) {
				$(".humibox").addClass("lightred");
				$(".diffhumi").text("전체 평균보다 "+ Number(myhumi - retVal.humiavg) + "% 높아요");
				}
			else if (retVal.humiavg - myhumi > 3) {
				$(".humibox").addClass("lightblue");
				$(".diffhumi").text("전체 평균보다 " + Number(retVal.humiavg - myhumi) + "% 낮아요");
				}
			else {
				$(".humibox").addClass("lightgreen");
				$(".diffhumi").text("전체 평균과 비슷해요");
				}
				
			if (mymois - retVal.moisavg > 3) {
				$(".moisbox").addClass("lightred");
				$(".diffmois").text("전체 평균보다 " + Number(mymois - retVal.moisavg) + "% 높아요");
				}
			else if (retVal.moisavg - mymois > 3) {
				$(".moisbox").addClass("lightblue");
				$(".diffmois").text("전체 평균보다 " + Number(retVal.moisavg - mymois) + "% 낮아요");
				}
			else{		
				$(".moisbox").addClass("lightgreen");
				$(".diffmois").text("전체 평균과 비슷해요");
			}

		},
		error: function(retVal, status, er) {
			alert("데이터를 불러올 수 없습니다. 기기 연결 상태를 확인해주세요!");
		}
	});

});
