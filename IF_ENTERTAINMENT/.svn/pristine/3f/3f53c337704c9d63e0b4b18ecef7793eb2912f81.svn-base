// 스위트 알러트 함수
function swal(title, text, confirmMsg, cancelMsg, requestUrl){
    Swal.fire({
        title: title, 
        text: text, 
        icon: 'warning', 
        showCancelButton: true, // 취소 버튼 보이도록 설정
        confirmButtonColor: '#d33', // 삭제 버튼 색상 설정
        cancelButtonColor: '#3085d6', // 취소 버튼 색상 설정
        confirmButtonText: confirmMsg, // 삭제 버튼 텍스트 설정
        cancelButtonText: cancelMsg // 취소 버튼 텍스트 설정
    }).then((result) => {
        setTimeout(() => {
            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
        }, 20000); // 2000ms(2초) 후에 경고창 닫기
        if (result.isConfirmed) { 
        	// 삭제 버튼을 눌렀을 때
        	location.href = requestUrl;
        } 
    });
}