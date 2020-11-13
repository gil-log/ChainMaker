// unblock when ajax activity stops 
$(document).ajaxStop($.unblockUI);

/**
 * ajax 공통 호출 함수
 *
 * @param
 *   url : 서비스 호출URL
 *   method : post, get
 *   async : true, false
 *   param : data parameter
 *   callback : callback function name
 */
function callAjax(url, method, dataType, async, param, callback) {
	//console.log('>>>>>>param일떄',param);
	
	//method는 post 이다. async는 true/false이다.
	if (method == null || method == "") method = "post";
	
	$.ajax({
		url : url,
		type : method,
		dataType : dataType,
		async : async,
		data : param,
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
			$.blockUI({ message: '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>', T:99999 });
		},
		success : function(data) {
			callback(data);
		},
		error : function(xhr, status, err) {
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
      			
			if (xhr.status == 901) {
				alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
				location.replace('/login.do');
			} else {
				alert('A system error has occurred.' + err);
			}
		},
		complete: function(data) {
			$.unblockUI();
		}
	});
}

/**
 * ajax 공통 호출 함수 - 파일 업로드 포함
 *
 * @param
 *   url : 서비스 호출URL
 *   method : post, get
 *   async : true, false
 *   formName : form name
 *   callback : callback function name
 */
function callAjaxFileUpload(url, method, dataType, async, formName, callback) {
	
	if (method == null || method == "") method = "post";
	
	var frm = document.getElementById(formName);
	var fileData = null;
	if(frm == null){
		fileData = formName;
	}else{
		frm.enctype = 'multipart/form-data';
		fileData = new FormData(frm);
	}
	
	// 익스플로어에서 데이터를 못담는 현상이 발견되어 아래행 삽입 
	fileData.append("empty", "empty"); 
	
	$.ajax({
		url : url,
		type : method,
		dataType : dataType,
		async : async,
		data : fileData,
		contentType: false,
		processData: false,
		cache : false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
			$.blockUI({ message: '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>', T:99999 });
		},
		success : function(data) {
			callback(data);
		},
		error : function(xhr, status, err) {
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
			
			if (xhr.status == 901) {
				alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
				location.replace('/login.do');
			} else {
				alert('A system error has occurred.' + err);
			}
		},
		complete: function(data) {
			$.unblockUI();
		}
	});
}


/**
 * ajax 공통 호출 함수 - 다수 파일 업로드 포함
 * (제작의뢰 전용)
 *
 * @param
 *   url : 서비스 호출URL
 *   method : post, get
 *   async : true, false
 *   formName : form name
 *   callback : callback function name
 */
function callAjaxFileUploadSetFormData(url, method, dataType, async, formData, callback) {
	
	if (method == null || method == "") method = "post";
	formData.append("empty", "empty");
	
	$.ajax({
		url : url,
		type : method,
		dataType : dataType,
		async : async,
		data : formData,
		contentType: false,
		processData: false,
		cache : false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
			$.blockUI({ message: '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>', T:99999 }); 
		},
		success : function(data) { 
			callback(data); 
		},
		error : function(xhr, status, err) { 
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
			
			if (xhr.status == 901) {
				alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
				location.replace('/login.do');
			} else {
				alert('A system error has occurred.' + err);
			}
		},
		complete: function(data) {
			$.unblockUI();
		}
	});
}