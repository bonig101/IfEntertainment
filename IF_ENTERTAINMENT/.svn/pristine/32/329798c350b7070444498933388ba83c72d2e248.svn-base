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
    background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
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

#container_artistSales, #container_topSales {
    width: 1525px;
    height: 600px;
    overflow: hidden;
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

<div id="allChart">	
	<!-- 기간별 가입자 분석 -->
	<div class="widget register-chart">
		<div class="widget-title">
			<h4 class="sub-title">굿즈 판매 통계</h4>
			<button class="pngBtn wholeSize" data-element="container_artistSales">PNG Download</button>
		</div>
		<div class="widget-peding">
			<div class="revenue-chart">
				<!-- 그래프 추가 영역 -->
				<div id="container_artistSales"></div>
			</div>
		</div>
	</div>
	<!-- 기간별 가입자 분석 끝 -->
	
	<!-- 기간별 가입자 분석 -->
	<div class="widget register-chart">
		<div class="widget-title">
			<h4 class="sub-title">굿즈 판매 통계</h4>
			<button class="pngBtn wholeSize" data-element="container_topSales">PNG Download</button>
		</div>
		<div class="widget-peding">
			<div class="revenue-chart">
				<!-- 그래프 추가 영역 -->
				<div id="container_topSales"></div>
			</div>
		</div>
	</div>
	<!-- 기간별 가입자 분석 끝 -->
	
	<!-- 가입자 파이차트 -->
	<div class="col-lg-12">
		<div class="row">
			<!-- 남녀별 매출 -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">남녀별 매출</h4>
						<button class="pngBtn" data-element="container_genderSales">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line">
							<!-- 그래프 추가 영역 -->
							<div id="container_genderSales"></div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 연도별 매출 추이 -->
			<div class="col-lg-6">
				<div class="widget widget-all">
					<div class="widget-title no-margin">
						<h4 class="sub-title">연도별 매출 추이</h4>
						<button class="pngBtn" data-element="container_yearSales">PNG Download</button>
					</div>
					<div class="widget widget-body">
						<div class="revenue-chart line">
							<!-- 그래프 추가 영역 -->
							<div id="container_yearSales"></div>
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
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<!-- pdf다운로트 cdn추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script>
$(function(){
	
	var artistAmounts = [];		// 아티스트별 매출금액을 담을 배열 선언 [artist, price]
	var artistAmountsArr = [];	// 아티스트별 매출금액을 담을 배열을 담을 배열 선언 [[artist1, price1], [artist2, price2]...]
	
    var duration = "";			// ajax 통신시 전송할 기간 변수선언
    var agId = "";				// ajax 통신시 전송할 아티스트 변수선언
    
	var durationText = "전체기간"; 		     // 차트 제목에 표기될 기간
	var artistText = "[ ALL ARTIST ]";	     // 차트 제목에 표기될 아티스트명
	
	$(".highcharts-credits").hide();
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	 var agIdSelectBox = $('#agList');
	 agIdSelectBox.niceSelect(); // nice-select 플러그인을 초기화
	
	 // 리스트가 너무 길어져 스크롤 기능을 추가
    $('#agList').parent().find('.list').css({
        'max-height': '200px', // 드롭다운 리스트의 최대 높이 설정
        'overflow-y': 'auto' // 스크롤이 필요할 경우 스크롤 추가
    });
	 
    // 페이지 로드 시 기본 데이터 로드
    $.ajax({
        url: "/admin/statistics/goodsAjax.do",
        type: "get",
        beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);
        },
        success: function(defaultData){
            // 그래프 생성
            createChart(defaultData);
        }, 
        error: function(xhr, status, error) {
            // 오류가 발생한 경우 실행할 코드
            console.error("AJAX 오류: ", status, error);
        }
    });
    
    // 아티스트 셀렉트박스를 선택할 때 데이터 로드
    agIdSelectBox.on("change", function(event){
    	event.preventDefault();
        
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
        
        duration = $(this).data("dur");
        
        // 기존 차트 초기화
        $('#container_artistSales').empty();
        
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
    function createChart(data) {
		
		/* 아티스트별, 기간별 판매 금액이 담겨 있는 리스트 */
		var artistSales = data.artistSalesList;
		
		artistAmounts = [];		
		artistAmountsArr = [];
		
		console.log("## data : ", data.artistSalesList);
		for (var i = 0; i < artistSales.length; i++) {
			artistAmounts = []
			artistAmounts.push(artistSales[i].goodsArtist);
			artistAmounts.push(artistSales[i].totalPrice);
			artistAmountsArr.push(artistAmounts);
		}
		console.log("## artistAmountsArr : ", artistAmountsArr);
		
		// 아티스트별 기간 별 굿즈샵 매출액
    	Highcharts.chart('container_artistSales', {
    	    chart: {
    	        type: 'column'
    	    },
    	    title: {
    	        text: durationText + ' 아티스트별 판매내역'
    	    },
    	    subtitle: {
    	        text: '단위 : 원',
    	        align: 'right'
    	    },
    	    xAxis: {
    	        type: 'category',
    	        labels: {
    	            autoRotation: [-45, -90],
    	            style: {
    	                fontSize: '13px',
    	                fontFamily: 'Verdana, sans-serif'
    	            }
    	        }
    	    },
    	    yAxis: {
    	        min: 0,
    	        title: {
//     	            text: 'Population (millions)'
    	            text: ''
    	        }
    	    },
    	    legend: {
    	        enabled: false
    	    },
    	    tooltip: {
    	        formatter: function() {
    	            return '<b>' + this.point.name + '</b><br/>판매액: ' + Highcharts.numberFormat(this.point.y, 0, '', ',') + '원'; // #,### 포맷팅 적용
    	        }
    	    },
    	    series: [{
    	        name: 'Population',
    	        colors: [
    	            '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
    	            '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
    	            '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
    	            '#03c69b',  '#00f194'
    	        ],
    	        colorByPoint: true,
    	        groupPadding: 0,
    	        data: artistAmountsArr,
    	        dataLabels: {
    	            enabled: true,
    	            rotation: -90,
    	            color: '#FFFFFF',
    	            inside: true,
    	            verticalAlign: 'top',
    	            format: '{point.name}', // 아티스트 이름 표시
    	            y: 10, // 10 pixels down from the top
    	            style: {
    	                fontSize: '13px',
    	                fontFamily: 'Verdana, sans-serif'
    	            }
    	        }
    	    }]
    	});
		/* 아티스트별 기간 별 굿즈샵 매출액 끝 */
		
		/* 탑 세일즈 통계 시작 */
		console.log("### topSalesList : ", data.topSalesList);
		
		var topSalesList  = data.topSalesList;
		var totalPrice = 0;		// 상위 5명의 아티스트의 판매액 총합
		var topArtistsArr = []; // 차트에 들어갈 탑 5 아티스트
		
		var topGoodsArr = []; 	// 차트에 들어갈 각 아티스트의 탑 5 굿즈
		var topGoods = [];
		
		for (var i = 0; i < topSalesList.length; i++) {
			// 기본 데이터
			totalPrice = 0;
			var topArtistObject = {};
			topArtistObject.name = topSalesList[i].goodsArtist;
			var goodsList = topSalesList[i].goodsList;
			
// 			// drilldown 데이터
// 			var topGoodsObject = {};
// 			topGoodsObject.name = topSalesList[i].goodsArtist;
// 			topGoodsObject.id = topSalesList[i].goodsArtist;
			
			for (var j = 0; j < goodsList.length; j++) {
				totalPrice += goodsList[j].goodsTotalPrice;
// 				topGoods = [];
// 				topGoodsArr = [];
// 				var name = '<a href="/goods/update.do?goodsNo=' + goodsList[j].goodsNo + '">' + goodsList[j].goodsName + '</a>';
// 				topGoods.push(name)
// 				topGoods.push(goodsList[j].goodsTotalPrice);
			}
// 			topGoodsObject.data = topGoods;
// 			topGoodsArr.push(topGoodsObject);
			
			topArtistObject.y = totalPrice;
			topArtistObject.drilldown = topSalesList[i].goodsArtist;
			topArtistsArr.push(topArtistObject);
		}
		
		// drilldown 데이터 세팅
		var drilldownData = [];
		for (var i = 0; i < topSalesList.length; i++) {
		    var goodsList = topSalesList[i].goodsList;
		    var goodsData = [];
		    for (var j = 0; j < goodsList.length; j++) {
		        var name = '<a href="/goods/update.do?goodsNo=' + goodsList[j].goodsNo + '">' + goodsList[j].goodsName + '</a>';
		        goodsData.push([name, goodsList[j].goodsTotalPrice]);
		    }
		    drilldownData.push({
		        name: topSalesList[i].goodsArtist,
		        id: topSalesList[i].goodsArtist,
		        data: goodsData
		    });
		}
		
		console.log("첫번째는 이렇게 셋팅?", topArtistsArr);
		console.log("두번째는 이렇게 셋팅?", drilldownData);
		
		Highcharts.chart('container_topSales', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        align: 'center',
		        text: durationText + ' 판매 TOP 7 아티스트'
		    },
		    subtitle: {
		        align: 'right',
		        text: '단위 : 원'
		    },
		    accessibility: {
		        announceNewData: {
		            enabled: true
		        }
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: ''
		        }
		
		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true,
		                format: '{point.y:,.0f}'
		            }
		        }
		    },
		
		    tooltip: {
		        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:,.0f}</b> 원<br/>'
		    },
		
		    series: [
		        {
		            name: 'ARTIST TOP 7',
		            colorByPoint: true,
		            data: topArtistsArr
		        }
		    ],
		    drilldown: {
		        breadcrumbs: {
		            position: {
		                align: 'right'
		            }
		        },
		        series: drilldownData
		    }
		});
		/* 탑 세일즈 통계 끝 */
		
		/* 성별 매출 파이차트 시작 */
		console.log("## gsList", data.gsList);
		Highcharts.chart('container_genderSales', {
		    chart: {
		        type: 'pie',
		        options3d: {
		            enabled: true,
		            alpha: 45,
		            beta: 0
		        }
		    },
		    title: {
		        text: artistText + ' ' + durationText + ' 판매내역' ,
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
		        data: [{
		            name: '남성 : ' + new Intl.NumberFormat('ko-KR').format(data.gsList[0].maleSales) + "원",
		            y: data.gsList[0].maleSales,
		            color: {
		                linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
		                stops: [
		                    [0, '#a1c4fd'],
		                    [1, '#c2e9fb']
		                ]
		            }
		        },
		        {
		            name: '여성 : ' + new Intl.NumberFormat('ko-KR').format(data.gsList[0].femaleSales) + "원",
		            y: data.gsList[0].femaleSales,
		            color: {
		                linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
		                stops: [
		                    [0, '#fdcbf1'],
		                    [1, '#e6dee9']
		                ]
		            }
		        }]
		    }]
		});
		/* 성별 매출 파이차트 끝 */
		
  		/* 연도별 매출 시작 */
  		console.log("## last List...", data.ysList);
		
		var ysList = data.ysList; // 연도별 매출액 리스트
		var salesData = [];
		var yearSales = {};
		
		// 연도별 매출 데이터
		for (var i = 0; i < ysList.length; i++) {
			yearSales = {};
			yearSales.year = ysList[i].orderYear;
			yearSales.sales = ysList[i].totalPrice;
			salesData.push(yearSales);
		}

        // Highcharts 바 차트 생성
        Highcharts.chart('container_yearSales', {
            chart: {
                type: 'column'
            },
            title: {
                text: ysList[0].orderYear + '년 ~ ' + ysList[ysList.length - 1].orderYear +'년 매출 통계'
            },
            xAxis: {
                categories: salesData.map(data => data.year),
                title: {
                    text: 'Year'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Sales (KRW)'
                },
                labels: {
                    formatter: function() {
                        return new Intl.NumberFormat('ko-KR').format(this.value) + ' 원';
                    }
                }
            },
            series: [{
                name: 'Sales',
                data: salesData.map(data => ({
	                y: data.sales,
	                color: '#fabbb6' 
                }))
            }],
            tooltip: {
                pointFormatter: function() {
                    return '<span style="color:' + this.series.color + '">\u25CF</span> ' + this.series.name + ': <b>' + new Intl.NumberFormat('ko-KR').format(this.y) + ' 원</b><br/>';
                }
            },
            legend: {
                enabled: false // 범례 비활성화
            }
        });
  		/* 연도별 매출 끝 */


	}
	
    // 데이터 로드 함수
    function loadData(duration, agId) {
        $.ajax({
            url: "/admin/statistics/goodsAjax.do?duration=" + duration + "&agId=" + agId,
            type: "get",
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function(data){
                // 그래프 생성
                createChart(data);
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