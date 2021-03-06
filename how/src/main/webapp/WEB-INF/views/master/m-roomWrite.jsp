<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<style type="text/css">


.imgs_wrap {
	border: 2px solid #A8A8A8;
	margin-top: 30px;
	margin-bottom: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
}
.imgs_wrap img {
	max-width: 150px;
	margin-left: 10px;
	margin-right: 10px;
}
</style>

<main id="main">

<div class="container">

	<form enctype="multipart/form-data" onsubmit="submitAction()">
		<!-- 숙박업소 입력란 --->
		<div style="padding: 10px; margin-top: 50px;">
			<label>호수:</label> <input type="text" id="name">
		</div>


		<div id="detailBox">

			<div class="form-group" style="padding: 10px; margin-bottom: 30px">
				<div class="form-group">
					<label>가격:</label> <input type="text" class="form-control"
					 id="price"
						 style="width: 400px" />
				</div>
				
			</div>

			<div class="input_wrap">
	
					<input type="file" id="input_imgs" multiple />
								<a href="javascript:" onclick="fileUploadAction();"
					class="my_button">사진 선택</a> 
			</div>
			
			<div class="imgs_wrap">
				<img id="img" />
			</div>

		</div>
		<button>저장</button>
	</form>

</div>

</main>
<!-- End #main -->


<script>
//이미지 정보들을 담을 배열
var sel_files = [];

$(document).ready(function () {
	$("#input_imgs").on("change", handleImgFileSelect);
});

function fileUploadAction() {
	console.log("fileUploadAction");
	$("#input_imgs").trigger('click');
}

function handleImgFileSelect(e) {

	// 이미지 정보들을 초기화
	sel_files = [];
	$(".imgs_wrap").empty();

	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	var index = 0;
	filesArr
		.forEach(function (f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_files.push(f);

			var reader = new FileReader();
			reader.onload = function (e) {
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
					+ index
					+ ")\" id=\"img_id_"
					+ index
					+ "\"><img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='selProductFile' title='Click to remove'></a>";
				$(".imgs_wrap").append(html);
				index++;

			}
			reader.readAsDataURL(f);

		});
}

function deleteImageAction(index) {
	console.log("index : " + index);
	console.log("sel length : " + sel_files.length);

	sel_files.splice(index, 1);

	var img_id = "#img_id_" + index;
	$(img_id).remove();
}

function fileUploadAction() {
	console.log("fileUploadAction");
	$("#input_imgs").trigger('click');
}

function submitAction() {
	event.preventDefault();
	console.log("업로드 파일 갯수 : " + sel_files.length);
	var formData = new FormData(); // multipart/form-data     (사진+x-www-form-urlencoded)

	for (var i = 0, len = sel_files.length; i < len; i++) {
		//var name = "files" + i;
		formData.append("files", sel_files[i]);
	}
	formData.append("image_count", sel_files.length);
	formData.append("name", $("#name").val());
	formData.append("price", $("#price").val());
	
	
	
	

	if (sel_files.length < 1) {
		alert("한개이상의 파일을 선택해주세요.");
		return;
	}

	console.log(formData);
	
	fetch("/master/roomswrite/rooms", {
		method: "post",
		body: formData
	}).then(function (res) {
		return res.text();
	}).then(function (res) {
		console.log("success", res);
		alert("사진 업로드 완료");
		location.href = "/home";
	});


}
</script>


<script>
	function goPopup() {
		var pop = window.open("/juso", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

	}
	function jusoCallBack(roadFullAddr) {
		let addressEL = document.querySelector("#address");
		addressEL.value = roadFullAddr; // 값을 address 폼에 넣는 코드
		console.log(addressEL);

	}
</script>
<%@ include file="../layout/footer.jsp"%>