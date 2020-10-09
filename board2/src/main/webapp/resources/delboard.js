
var boardno = $('#boardno').val();
$("#delok").click(function(){
	if(confirm("삭제하시겠습니까?")==true){
		document.location = 'http://localhost/board.com/delboard?boardno='+boardno+'';
	}else{
		aleert("아니오를 클릭하셨습니다.")
	}
});



