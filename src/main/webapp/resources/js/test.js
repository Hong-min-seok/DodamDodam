$(function() {
    $( "#datepicker" ).datepicker({ 
    	dateFormat:'yy-mm-dd',
    	onSelect:function(d){

			var trans_object =
			{
				"date": d

			}

			console.log("선택한 날짜: "+d);
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
				alert("success ajax.." + '/'+retVal.photoName);
				
				
				 $("div#image_container").empty();

			      var img = document.createElement("img");
			      img.setAttribute("src", "resources/f_Photo/"+retVal.photoName+"");
			      document.querySelector("div#image_container").appendChild(img);
					

				},
				error: function(retVal, status, er) {
					alert("error발생");
				}
			});
    	 
    	 
    	 
    	}
    });
   
    
});
/*
function getMultiPhoto() {

	var device_id = document.getElementById("device_id");
	var startdate = document.getElementById("startdate");
	var enddate = document.getElementById("enddate");


	var trans_object =
	{
		'device_id': device_id,
		'startdate': startdate,
		'enddate': enddate
	}

	var trans_json = JSON.stringify(trans_object);

	$.ajax({
		url: "./getMultiPhoto",
		type: 'POST',
		dataType: 'json',
		data: trans_json,
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function(retVal) {

		

		},
		error: function(retVal, status, er) {
			alert("Error! 다시 시도해주세요.");
		}
	});
}*/