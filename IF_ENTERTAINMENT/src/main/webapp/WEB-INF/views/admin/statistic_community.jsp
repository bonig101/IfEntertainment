<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/animate.min.css">
<script src="${pageContext.request.contextPath }/resources/js1/jquery.js"></script> 
<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script> 
<%-- <script src="${pageContext.request.contextPath }/resources/js1/nice-select.js"></script>  --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js1/custom2.js"></script>  --%>
<script src="${pageContext.request.contextPath }/resources/js1/custom.js"></script>
<style>
.quick-all-report{
	min-height: 100px;
	padding-left: 80px;
    left: 246px;
    top: 78px;
    z-index: 10;
    position: fixed;
    background: white;
    width: 1675px;
}

.btn2{
	width: 100px;
	font-size: large;
	font-weight: bold;
}

.adjust {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.slc {
	position: relative;
	right: 100px;
	z-index: 10;
}

.nice-select{
	min-width: 300px;
	height: 43px;
}

.quick-all-report .duration .btn2 {
    transition: background-color 0.5s ease; 
}

.quick-all-report .duration .btn2:active,
.quick-all-report .duration .btn2:focus {
    background-color: white;
}

#container_register {
    width: 1525px;
    height: 600px;
    overflow: hidden;
}

#container_keyword_male, 
#container_keyword_female {
	min-height: 410px;
	max-height: 410px;
}
.widget-body, .widget-all {
	height: 410px;
}
 
/* .keyChart { */
/*     position: relative; */
/*     top: -150px; */
/*     width: 100%; */
/*     float: none; */
/* } */

.kewordsChart {
	max-height: 410px;
}

.highcharts-credits {
    display: none !important;
}
.pngBtn{
	position: relative;
	left: 30%;
	border-radius: 5px; 
	border: 2px solid #55acee;
	color: #55acee;
	background-color: white;
}

.wholeSize {
	position: relative;
	left: 40%;
	border-radius: 5px;
	border: 2px solid #55acee;
	color: #55acee;
	background-color: white;
}

.allDown {
	position: relative;
	left: -75%;
	border-radius: 5px;
	z-index: 20;
	height: 43px;
	border: 2px solid #55acee;
	color: #55acee;
	background-color: white;
}

</style>

<div class="widget">
	<div class="quick-all-report">
		<div class="row adjust">
			<div class="duration">
				<a href="#" data-dur="all" class="btn2 brd-5 twitter-clr">전체기간</a>			
				<a href="#" data-dur="7DAY" class="btn2 brd-5 twitter-clr">1주일</a>			
				<a href="#" data-dur="1MONTH" class="btn2 brd-5 twitter-clr">1개월</a>			
				<a href="#" data-dur="3MONTH" class="btn2 brd-5 twitter-clr">3개월</a>			
				<a href="#" data-dur="6MONTH" class="btn2 brd-5 twitter-clr">6개월</a>			
				<a href="#" data-dur="1YEAR" class="btn2 brd-5 twitter-clr">12개월</a>			
			</div>

			<div class="slc">
				<select id="agList" style="behavior: url('/inc/selectBox.htc');">
					<option value="">아티스트를 선택하세요</option>
					<c:forEach items="${agIdList }" var="agId">
						<option value="${agId }">${agId }</option>
					</c:forEach>
				</select>
			</div>
			
			<div>
				<button class="pdfBtn allDown" data-element="allChart">PDF Download</button>
			</div>
			
		</div>
	</div>
</div>

<!-- 기간별 가입자 분석 -->
<div id="allChart">
	<div class="widget register-chart">
		<div class="widget-title">
			<h4 class="sub-title">가입자 현황</h4>
			<button class="pngBtn wholeSize" data-element="container_register">PNG Download</button>
		</div>
		<div class="widget-peding">
			<div class="revenue-chart">
				<!-- 그래프 추가 영역 -->
				<div id="container_register"></div>
			</div>
		</div>
	</div>
	<!-- 기간별 가입자 분석 끝 -->
	
	<!-- 가입자 파이차트 -->
	<div class="col-lg-12">
		<div class="row">
			<!--  -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">가입 성별</h4>
						<button class="pngBtn" data-element="container_gender">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line">
							<!-- 그래프 추가 영역 -->
							<div id="container_gender"></div>
						</div>
					</div>
				</div>
			</div>
	
			<!--  -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">가입 연령</h4>
						<button class="pngBtn" data-element="container_age">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line">
							<!-- 그래프 추가 영역 -->
							<div id="container_age"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 키워드분석 -->
	<div class="col-lg-12">
		<div class="row">
			<!-- 남성 회원 아티스트별 키워드 -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">남성회원 관심사</h4>
						<button class="pngBtn" data-element="container_keyword_male">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line keyChart">
							<!-- 그래프 추가 영역 -->
							<div id="container_keyword_male" class="kewordsChart"></div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 여성 회원 아티스트별 키워드 -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">여성회원 관심사</h4>
						<button class="pngBtn" data-element="container_keyword_female">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line keyChart">
							<!-- 그래프 추가 영역 -->
							<div id="container_keyword_female" class="kewordsChart"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- highcharts cdn추가 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/pictorial.js"></script> 
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>

<!-- pdf다운로트 cdn추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script>
	$(function(){
		$(".highcharts-credits").hide();
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var durationText = "전체기간"; 		     // 차트 제목에 표기될 기간
		var artistText = "[ ALL ARTIST ]";	     // 차트 제목에 표기될 아티스트명
		
	    var agIdSelectBox = $('#agList');
	    var duration = "";
	    var agId = "";
	    
	    var data_age = [];			 // 연령 데이터를 담을 배열 선언
	    var agIdArr = [];            // 그룹아이디를 담을 배열 선언
	    var maleCountArr = [];       // 남성 회원수를 담을 배열 선언
	    var femaleCountArr = [];     // 여성 회원수를 담을 배열 선언
	    
	    agIdSelectBox.niceSelect(); // nice-select 플러그인을 초기화
	    
	    // 리스트가 너무 길어져 스크롤 기능을 추가
	    $('#agList').parent().find('.list').css({
	        'max-height': '200px', // 드롭다운 리스트의 최대 높이 설정
	        'overflow-y': 'auto' // 스크롤이 필요할 경우 스크롤 추가
	    });

	    // 페이지 로드 시 기본 데이터 로드
	    $.ajax({
	        url: "/admin/statistics/communityAjax.do",
	        type: "get",
	        beforeSend: function(xhr){
	            xhr.setRequestHeader(header, token);
	        },
	        success: function(defaultData){
	            for(var i = 0; i < defaultData.mrList.length; i++){
	                agIdArr.push(defaultData.mrList[i].agId);
	                maleCountArr.push(defaultData.mrList[i].maleCount);
	                femaleCountArr.push(defaultData.mrList[i].femaleCount);
	            }
	            // 그래프 생성
	            createChart(agIdArr, maleCountArr, femaleCountArr, defaultData);
	        }, 
	        error: function(xhr, status, error) {
	            // 오류가 발생한 경우 실행할 코드
	            console.error("AJAX 오류: ", status, error);
	        }
	    });
	    
	    // 아티스트 셀렉트박스를 선택할 때 데이터 로드
	    agIdSelectBox.on("change", function(event){
	    	event.preventDefault();
	        agIdArr = [];    
	        maleCountArr = [];
	        femaleCountArr = [];
	        
	        if($(this).val() != ""){
		        artistText = "[ " + $(this).val() + " ]";
	        } else  {
	        	artistText = "[ ALL ARTIST ]";
	        }
	        
	        agId = $(this).val();
	        loadData(duration, agId);
	    });
	    
	 	
	    
	    // 기간 선택 시 데이터 로드
	    $(".brd-5").on("click", function(event){
	        event.preventDefault();
	        
	     	// 기간 버튼 클릭시 toggle로 인해 아티스트 변경시 색 사라지는 점 보완
	     	$(".brd-5").each(function(idx, item){
	     		$(item).css("background-image", "none").css("color", "#55acee");
	     	});
	        $(this).css("background-image", "linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%)").css("color", "white");
	        
	        agIdArr = [];    
	        maleCountArr = [];
	        femaleCountArr = [];
	        
	        duration = $(this).data("dur");
	        
	        // 기존 차트 초기화
	        $('#container_register').empty();
	        $('#container_keyword_male').empty();
	        $('#container_keyword_female').empty();
	        $('#container_age').empty();
	        
	        loadData(duration, agId);
	        
	        switch(duration) {
	        case '7DAY':  
	        	durationText = "최근 1주일";
	        	break;
	        case '1MONTH': 
	        	durationText = "최근 1개월";
	        	break;
	        case '3MONTH': 
	        	durationText = "최근 3개월";
	        	break;
	        case '6MONTH': 
	        	durationText = "최근 6개월";
	        	break;
	        case '1YEAR': 
	        	durationText = "최근 12개월";
	        	break;
	        default :
	        	durationText = "전체기간";
	        }
	        
	    });
	    
	    // 그래프 생성 함수
	    function createChart(agIdArr, maleCountArr, femaleCountArr, data) {
	    	// 가입자 현황 차트 시작
	        Highcharts.chart('container_register', {
	            chart: {
	                type: 'column'
	            },
	            title: {
	                text: durationText + ' 아티스트별 가입자 현황',
	                align: 'center'
	            },
	            subtitle: {
	                text: '',
	                align: 'left'
	            },
	            xAxis: {
	                categories: agIdArr,
	                crosshair: true,
	                accessibility: {
	                    description: 'Countries'
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: ''
	                }
	            },
	            tooltip: {
	                valueSuffix: ''
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
	                }
	            },
	            series: [
	                {
	                    name: '남성',
	                    data: maleCountArr,
	                    color: {
	                        linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
	                        stops: [
	                            [0, '#4facfe'],
	                            [1, '#00f2fe']
	                        ]
	                    }
	                },
	                {
	                    name: '여성',
	                    data: femaleCountArr,
	                    color: {
	                        linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
	                        stops: [
	                            [0, '#f093fb'],
	                            [1, '#f5576c']
	                        ]
	                    }
	                }
	            ]
	        });
	    	// 가입자 현황 차트 끝
	    	
	    	console.log("keywords : ", data);
	    	
	     	// 남성 단어 빈도수 차트 시작
	        const text_male = data.maleKeywords;
	     	
	        if(text_male.length < 200){ // 키워드가 너무 적을 경우에는 분석할 데이터가 부족하다는 멘트로 대체한다.
	        	$("#container_keyword_male").text("분석할 데이터가 부족합니다.").css({
	    	        "font-size": "20px",
	    	        "position": "relative",
	    	        "top": "160px",
	    	        "text-align": "center",
	    	        "font-weight": "bold",
	    	        "min-height" : "400px"
	    	    });
	        } else {
	        	$("#container_keyword_male").css("top", "0"); 
	        	
	        	lines_male = text_male.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
		        data_male = lines_male.reduce((arr, word) => {
				    // 단어의 길이가 2 이상이고, 빈도수가 3 이상인 경우에만 처리
				    if (word.length >= 2 && lines_male.filter(w => w === word).length >= 3) {
				        let obj = Highcharts.find(arr, obj => obj.name === word);
				        if (obj) {
				            obj.weight += 1;
				        } else {
				            obj = {
				                name: word,
				                weight: 1
				            };
				            arr.push(obj);
				        }
				    }
				    return arr;
				}, []);

		        Highcharts.chart('container_keyword_male', {
		            accessibility: {
		                screenReaderSection: {
		                    beforeChartFormat: '<h5>{chartTitle}</h5>' +
		                        '<div>{chartSubtitle}</div>' +
		                        '<div>{chartLongdesc}</div>' +
		                        '<div>{viewTableButton}</div>'
		                }
		            },
		            series: [{
		                type: 'wordcloud',
		                data: data_male, // 수정: 데이터 변수명 오타 수정
		                name: 'Occurrences'
		            }],
		            title: {
		                text:  artistText + ' ' + durationText + ' 팬피드 빈도 키워드 분석 ',
		                align: 'center'
		            },
		            subtitle: {
		                text: '',
		                align: 'left'
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
		            }
		        });
		        // 남성 단어 빈도수 차트 끝
	        }
	    	
	     	// 여성 단어 빈도수 차트 시작
	        const text_female = data.femaleKeywords;
	        
	        if(text_female.length < 200){ // 키워드가 너무 적을 경우에는 분석할 데이터가 부족하다는 멘트로 대체한다.
	        	$("#container_keyword_female").text("분석할 데이터가 부족합니다.").css({
	    	        "font-size": "20px",
	    	        "position": "relative",
	    	        "top": "160px",
	    	        "text-align": "center",
	    	        "font-weight": "bold",
	    	        "min-height" : "410px"
	    	    });
	        } else {
	        	 $("#container_keyword_female").css("top", "0");
	        	 $("#container_keyword_female").text(""); 
	        	
	        	lines_female = text_female.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
		        data_female = lines_female.reduce((arr, word) => {
				    // 단어의 길이가 2 이상이고, 빈도수가 3 이상인 경우에만 처리
				    if (word.length >= 2 && lines_female.filter(w => w === word).length >= 3) {
				        let obj = Highcharts.find(arr, obj => obj.name === word);
				        if (obj) {
				            obj.weight += 1;
				        } else {
				            obj = {
				                name: word,
				                weight: 1
				            };
				            arr.push(obj);
				        }
				    }
				    return arr;
				}, []);

		        Highcharts.chart('container_keyword_female', {
		            accessibility: {
		                screenReaderSection: {
		                    beforeChartFormat: '<h5>{chartTitle}</h5>' +
		                        '<div>{chartSubtitle}</div>' +
		                        '<div>{chartLongdesc}</div>' +
		                        '<div>{viewTableButton}</div>'
		                }
		            },
		            series: [{
		                type: 'wordcloud',
		                data: data_female, // 수정: 데이터 변수명 오타 수정
		                name: 'Occurrences'
		            }],
		            title: {
		                text:  artistText + ' ' + durationText + ' 팬피드 빈도 키워드 분석 ',
		                align: 'center'
		            },
		            subtitle: {
		                text: '',
		                align: 'left'
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
		            }
		        });
		        // 여성 단어 빈도수 차트 끝
	        }
	        
	        // 가입 연령 도넛차트
	        console.log("#### maList : ", data.maList);
	        
	        data_age = [];
	        var dataAge = []
	        
	        for(var i = 0; i < data.maList.length; i++){
	        	dataAge = [];
	        	dataAge.push(data.maList[i].ageGroup);	
	        	dataAge.push(data.maList[i].maleCount + data.maList[i].femaleCount);
	        	data_age.push(dataAge);
	        }
	        
	        Highcharts.chart('container_age', {
	            chart: {
	                type: 'pie',
	                options3d: {
	                    enabled: true,
	                    alpha: 45
	                }
	            },
	            title: {
	                text: artistText + ' ' + durationText +' 가입 연령',
	                align: 'center'
	            },
	            subtitle: {
	                text: '',
	                align: 'left'
	            },
	            plotOptions: {
	                pie: {
	                    innerSize: 100,
	                    depth: 45,
	                    colors: [
	                        '#95ff82', // 10대 이하
	                        '#ffee57', // 20대
	                        '#c2e9fb', // 30대
	                        '#fdcbf1', // 40대
	                        '#e6dee9'  // 50대 이상
	                    ]
	                }
	            },
	            series: [{
	                name: '명',
	                data: data_age
	            }]
	        });

	        // 가입연령 도넛차트 끝
	        
	        // 가입성별 파이차트 시작
	        console.log("## mgList", data.mgList);
	        Highcharts.chart('container_gender', {
	            chart: {
	                type: 'pie',
	                options3d: {
	                    enabled: true,
	                    alpha: 45,
	                    beta: 0
	                }
	            },
	            title: {
	                text: artistText + ' ' + durationText +' 가입 성별',
	                align: 'center'
	            },
	            subtitle: {
	                text: '',
	                align: 'left'
	            },
	            accessibility: {
	                point: {
	                    valueSuffix: '%'
	                }
	            },
	            tooltip: {
	                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    depth: 35,
	                    dataLabels: {
	                        enabled: true,
	                        format: '{point.name}'
	                    },
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: 'Share',
	                data: [
	                    {
	                        name: '남성 : ' + data.mgList[0].maleCount +"명",
	                        y: data.mgList[0].maleCount,
	                        color: {
	                            linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
	                            stops: [
	                                [0, '#a1c4fd'],
	                                [1, '#c2e9fb']
	                            ]
	                        }
	                    },
	                    {
	                        name: '여성 : ' + data.mgList[0].femaleCount +"명",
	                        y: data.mgList[0].femaleCount,
	                        color: {
	                            linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
	                            stops: [
	                                [0, '#fdcbf1'],
	                                [1, '#e6dee9']
	                            ]
	                        }
	                    }
	                ]
	            }]

	        });
	        // 가입성별 파이차트 끝 
	        
	    }
	    
	    // 데이터 로드 함수
	    function loadData(duration, agId) {
	        $.ajax({
	            url: "/admin/statistics/communityAjax.do?duration=" + duration + "&agId=" + agId,
	            type: "get",
	            beforeSend: function(xhr){
	                xhr.setRequestHeader(header, token);
	            },
	            success: function(data){
	            	// 아티스트별 커뮤니티 가입내역 차트 데이터 세팅
	                for(var i = 0; i < data.mrList.length; i++){
	                    agIdArr.push(data.mrList[i].agId);
	                    maleCountArr.push(data.mrList[i].maleCount);
	                    femaleCountArr.push(data.mrList[i].femaleCount);
	                }
	                // 그래프 생성
	                createChart(agIdArr, maleCountArr, femaleCountArr, data);
	            },
	            error: function(xhr, status, error) {
		            console.error("데이터 로드 AJAX 오류: ", status, error);
		        }
	        });
	    }
	    
	    
	    var pngBtn = $(".pngBtn");
	    var pdfBtn = $(".pdfBtn");
	    
	    pngBtn.on("click", function(){
	    	var element = $(this).data("element");
	    	downloadPNG(element);
	    });
	    
	    pdfBtn.on("click", function(){
	    	var element = $(this).data("element");
	    	downloadPDF(element);
	    });
	    
	    // 이미지로 다운로드
	    function downloadPNG(ele) {
	        const element = document.getElementById(ele); // PNG로 변환하고자 하는 HTML 요소를 선택. 예: document.getElementById('your-element-id')

	        html2canvas(element).then((canvas) => {
	            const imgData = canvas.toDataURL('image/png'); // 이미지 데이터로 변환합니다.
	            
	            // PNG로 다운로드합니다.
	            const a = document.createElement('a');
	            a.href = imgData;
	            a.download = 'download.png';
	            document.body.appendChild(a);
	            a.click();
	            document.body.removeChild(a);
	        });

	    }
	    
	 	// PDF로 다운로드
	    function downloadPDF(ele) {
	        const element = document.getElementById(ele); // PDF로 변환하고자 하는 HTML 요소를 선택. 예: document.getElementById('your-element-id')

	        // 선택한 요소에서 pngBtn 클래스를 임시로 저장해두고, 다운로드 후에는 다시 추가
	        const hasPngBtnClass = element.classList.contains("pngBtn");
	        if (hasPngBtnClass) {
	            element.classList.remove("pngBtn");
	        }

	        // CSS를 통해 숨겨진 버튼을 추가
	        const pngBtns = document.querySelectorAll(".pngBtn");
	        pngBtns.forEach(btn => {
	            btn.style.display = "none";
	        });

	        html2canvas(element).then((canvas) => {
	            const imgData = canvas.toDataURL('image/png');
	            const pdf = new jspdf.jsPDF();
	            const imgProps= pdf.getImageProperties(imgData);
	            const pdfWidth = pdf.internal.pageSize.getWidth();
	            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;

	            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
	            pdf.save("download.pdf");

	            // 숨겼던 버튼을 복원
	            pngBtns.forEach(btn => {
	                btn.style.display = "";
	            });

	            // 다운로드 후에는 다시 pngBtn 클래스를 추가
	            if (hasPngBtnClass) {
	                element.classList.add("pngBtn");
	            }
	        });
	    }	    
	    
	    
	    
	    
	    
	    
	    
	   
	});
	
	

</script>