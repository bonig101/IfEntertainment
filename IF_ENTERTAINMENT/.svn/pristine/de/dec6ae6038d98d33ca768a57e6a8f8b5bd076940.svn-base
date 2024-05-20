<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
  .jusicName {
    position: relative;
    padding-bottom: 0px;
    font-size: 40px;
    left: 10px;
    font-weight: 500;
  }

  .col-lg-6 {
    display: flex;
    vertical-align: middle;
    justify-content: center;
    align-items: center;
    right: 30px;
  }

  #jusic_summary{
    width: 90%;
    margin: 15px;
    display: flex;
    padding-bottom: 13px;
  }
  
  #threeInfo{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    position: relative;
    left: 45px;
  }
  
  #twoInfo{
    display: flex;
  }
  
  .yesterday{
    margin: 20px;
    text-align: center;
  }
  
  .smallTitle {
    font-weight: bolder;
  }
  
  #fourInfo {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    text-align: center;
  }
  
  .giveMeGap {
    border-left: 1px solid lightgray;
    margin-left: 20px;
    padding-left: 15px;
  }
  
  #curPrice{
    font-size: xx-large;
  }
  
  #border-right{
    padding-right: 23px;
    padding-left: 23px;
    border-right: 1px solid lightgray;
  }
  
  #updownMark{
    width: 20px;
  }
  
  #updownMark_small{
    width: 10px;
  }
  
  #IFchart{
  	margin-left: 10px;
  	margin-bottom: 10px;
  	width: 1000px;
  }
  
  #img_chart_area {
    height: auto;
    width: 833px;
  }
  
  /* 테이블 관련 스타일 */
  table.type2 {
    clear: both;
    width: 100%;
    border-bottom: 1px solid #e1e1e1;
    font-family: dotum;
    font-size: 12px;
  }
  
  table {
  	border-collapse: collapse;
    display: table;
    text-indent: initial;
    unicode-bidi: isolate;
    line-height: normal;
    font-weight: normal;
    font-size: medium;
    font-style: normal;
    color: -internal-quirk-inherit;
    border-color: gray;
    white-space: normal;
    font-variant: normal;
    text-align: center;
    vertical-align: middle;
    border-radius: 20px;
  }
  
  .table th {
  	padding: 0;
  	margin: 0;
  }
  .table td {
  	border: none;
  	padding: 0;
  	margin: 0;
  }
  
  #tables {
  	display: flex;
  	margin-top: 30px;
  }
  
  th {
  	background-color: #e9e9e9;
  }
  
  #jumun th, #jumun td {
  	border: 1px solid lightgray;
  }
  
  hr.hr-13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8c8c inset;
  }
  
  .stockWarn{
  	color: red;
  	margin-left: 10px;
  	margin-top: 5px;
  }

  
</style>
<!-- 주가 요약정보 시작 -->
	<div class="row">
			<div class="jusicName">이프엔터테인먼트(940205)</div>
			<div id="jusic_summary">
				<div class="col-lg-6">
					<div>
						<div id="threeInfo">
							<div id="curPrice">
								<img id="updownMark" src="${pageContext.request.contextPath }/resources/stock/${upDownMark}.png" alt="updownMark">
								${map.get("curPrice") }
							</div>
							<div id="twoInfo">
								<span class="yesterday"><span class="smallTitle">전일대비 </span>
									<img id="updownMark_small" src="${pageContext.request.contextPath }/resources/stock/${upDownMark}.png" alt="updownMark"> 
									${map.get("upDown") }
								</span> 
								<span class="yesterday"><span class="smallTitle">등락률(%) </span> ${map.get("percent") }</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div id="fourInfo">
						<span class="giveMeGap">
							<p class="smallTitle">시가</p>
							<p>${map.get("open") }</p>
						</span> <span class="giveMeGap">
							<p class="smallTitle">고가</p>
							<p id="high"><font color="#D90400">${map.get("high") }</font></p>
						</span> <span class="giveMeGap">
							<p class="smallTitle">저가</p>
							<p><font color="#005DDE">${map.get("low") }</font></p>
						</span> <span class="giveMeGap" id="border-right">
							<p class="smallTitle">거래량</p>
							<p>${map.get("volume") }</p>
						</span>
					</div>
				</div>
			</div>
		</div>
<!-- 주가 요약정보 끝 -->

<!-- 차트 이미지 시작 -->
<div id="IFchart">
	${chart }
</div>
<!-- 차트 이미지 끝 -->

<!-- 주가 정보 테이블 시작 -->
<div id="tables">
	<table class="table" id="jumun">
		${table_jumun }
	</table>
	<table class="table" id="hoga">
		${table_hoga }
	</table>
	<!-- 주가 정보 테이블 끝 -->
</div>

<div class="stockWarn">
	※ 위 주식 정보는 네이버 페이 증권정보를 불러오며 최대 20분까지의 지연시간이 발생할 수 있으니 이 점 참고하시기 바랍니다.
</div>

<script>
	$(function(){
		$("td").removeAttr("align");
		$("td").removeAttr("class");
		$("th").removeAttr("class");
		$("tr").removeAttr("class");
		$("td[colspan=4]").hide();
		
		$("th").css("vertical-align", "middle");
		$("tr").css("vertical-align", "middle");
		$("td").css("vertical-align", "middle");
		
		$("table").css("width", "45%");
		$("table").css("height", "400px");
		$("table").css("margin-left", "1%");
		$("table").css("border","1px solid lightgray");
		
		$("table").eq(1).css("border","1px solid lightgray");
		
		$("#hoga th").css("font-weight", "900");
		
		for (var i = 1; i <= 7; i++) {
		    $("#hoga tr").eq(i).find("td:not(:empty)").css({
		        "background-color": "#EBF2FC",
		        "color": "#005DDE"
		    });
		}

		for (var i = 8; i <= 15; i++) {
		    $("#hoga tr").eq(i).find("td:not(:empty)").css({
		        "background-color": "#FCEBEB",
		        "color": "#D90400"
		    });
		}
		
		
		
		
	});
	
</script>