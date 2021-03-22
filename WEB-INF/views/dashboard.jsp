<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>대시보드</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(change_reportSignCnt);

$(document).ready(function(){
	
	$.ajax({
		url : "/signRequestList.do"
		, type : "post"
		, data: {"emp_no":${emp_no}}
		, success : function(signRequestList){
			//alert(1);
			//alert(signRequestList[0].report_code);
			//alert(signRequestList[0].report_no);

			
			var arr = [];
			arr.push("<table style='background-color:white' width=80%>");

			if(signRequestList.length == 0){
				arr.push("<tr><td><font size='3'>&nbsp;&nbsp;${emp_name} ${jikup_name}님에게 결재 요청된 보고서가 없습니다.</font><br>");
			}
			else if(signRequestList.length <= 4){
				for(var i=0 ; i<signRequestList.length ; i++){
					arr.push("<tr onClick='goContentForm("+signRequestList[i].report_no+","+signRequestList[i].report_code+");'><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + " 이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
					arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
					arr.push("<tr><td style='background-color:#eee'>&nbsp;");
					/*
					if( i != (signRequestList.length - 1) ){
						arr.push("<tr onClick='goContentForm("+signRequestList[i].report_no+","+signRequestList[i].report_code+");'><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + " 이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
						arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
						arr.push("<tr><td style='background-color:lightgray'>&nbsp;");
					}					
					else{
						arr.push("<tr><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + "이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
						arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
					}
					*/
				}
				arr.push("<tr><td><font size='2'>&nbsp;&nbsp;총 " + (signRequestList.length) + "건</font><br>");
			}
			else{
				for(var i=0 ; i<4 ; i++){
					arr.push("<tr onClick='goContentForm("+signRequestList[i].report_no+","+signRequestList[i].report_code+");'><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + " 이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
					arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
					arr.push("<tr><td style='background-color:#eee'>&nbsp;");
				}
				arr.push("<tr><td><font size='2'>&nbsp;&nbsp;+" + (signRequestList.length-4) + "건</font><br>");
				arr.push("<tr><td><font size='2'>&nbsp;&nbsp;총 " + (signRequestList.length) + "건</font><br>");
			}
			
			/*
			else{
				for(var i=0 ; i<4 ; i++){
					if( i != (4 - 1) ){
						arr.push("<tr><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + "이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
						arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
						arr.push("<tr><td style='background-color:lightgray'>&nbsp;");
					}
					else{
						arr.push("<tr><td><font size='2'>&nbsp;&nbsp;" + signRequestList[i].dep_name + "의 " + signRequestList[i].emp_name + " " + signRequestList[i].jikup_name + "이(가) " + signRequestList[i].report_name + "의 결재를 요청하였습니다.</font><br>");
						arr.push("<font size='1'>&nbsp;&nbsp;&nbsp;" + signRequestList[i].sign_date_cnt + "일 전</font>");
					}
				}
			}
			*/

			$(".xxx").html( arr.join("") );			
		}
		, error : function(){
			alert("reportList.do" + "접속 시 서버 응답 실패! 관리자에게 문의 바람!");
		}
	}); 	
});


function goContentForm(report_no, report_code){
	//alert("report_no=>" + report_no + " / report_code=>" + report_code);

	if(report_code==1){
		$("[name=dailyContent] [name=report_no]").val(report_no);
		document.dailyContent.submit();
	}
	else if(report_code==2){
		$("[name=salesContent] [name=report_no]").val(report_no);
		document.salesContent.submit();
	}
	else{
		$("[name=expenseContent] [name=report_no]").val(report_no);
		document.expenseContent.submit();
	}
		


	
}

function change_reportSignCnt(){
	if($("[name=reportSignCnt]").val() == "년도"){return;}
	$.ajax({
		url : "/reportSignCntProc.do"
		, type : "post"
		, data: {"reportSignCnt":$("[name=reportSignCnt]").val()}
		, success : function(reportSignCntList){
				//alert("reportSignCntList 성공");
				//alert(reportSignCntList[0].daily_cnt);
				//alert(reportSignCntList[0].business_cnt);
				//alert(reportSignCntList[0].expense_cnt);

				var arr = [];
				arr.push( ['Month',  '일일', '영업', '지출'] );

				for(var i=0 ; i<reportSignCntList.length ; i++){
					var daily_cnt = parseInt(reportSignCntList[i].daily_cnt,10);
					var business_cnt = parseInt(reportSignCntList[i].business_cnt,10);
					var expense_cnt = parseInt(reportSignCntList[i].expense_cnt,10);

					arr.push( [(i+1)+"월",daily_cnt,business_cnt,expense_cnt] );
				}

				var data = google.visualization.arrayToDataTable(arr);
				var options = {
						//title: "일일보고서" ,
						curveType: 'function',
						legend: { position: 'top' }
					};
				var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
				chart.draw(data, options);
		}
		, error : function(){
			alert("reportSignCntProc.do" + "접속 시 서버 응답 실패! 관리자에게 문의 바람!");
		}
	}); 	
};
//------------------------------------------------------------------------------------------------------------------------
function change_reportSignState(){
	if($("[name=reportSignState]").val() == "보고서종류" || $("[name=signUpReportYear]").val() == "년도" || $("[name=signUpReportMonth]").val() == "월"){return;}
	$.ajax({
		url : "/reportSignStateProc.do"
		, type : "post"
		, data: {"reportSignState":$("[name=reportSignState]").val(),"signUpReportYear":$("[name=signUpReportYear]").val(),"signUpReportMonth":$("[name=signUpReportMonth]").val()}
		, success : function(reportSignStateList){
				//alert("change_reportSignState 성공");
				//alert(reportSignStateList[0].sign_code);

				var arrSignState = ["승인","반려","대기"];
				var arrColor = ["green","gold","red"];
				
				var arr = [];
				arr.push( ["상태", "개수", { role: "style" } ] );

				for(var i=0 ; i<reportSignStateList.length ; i++){
					var sign_code = parseInt(reportSignStateList[i].sign_code,10);

					arr.push( [arrSignState[i],sign_code,arrColor[i]] );
				}
				
				var data = google.visualization.arrayToDataTable(arr);
				var view = new google.visualization.DataView(data);
				view.setColumns([0, 1,
					{ calc: "stringify",
					sourceColumn: 1,
					type: "string",
					role: "annotation" },
					2
				]);

				var options = {
					bar: {groupWidth: "50%"},
					legend: { position: "none" }
				};
				
				var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
				chart.draw(view, options);
		}
		, error : function(){
			alert("reportSignStateProc.do" + "접속 시 서버 응답 실패! 관리자에게 문의 바람!");
		}
	}); 	
};
//------------------------------------------------------------------------------------------------------------------------
function change_reportType(){
	if($("[name=reportType]").val() == "보고서종류" || $("[name=reportTypeYear]").val() == "년도"){return;}
	$.ajax({
		url : "/reportTypeProc.do"
		, type : "post"
		, data: {"reportType":$("[name=reportType]").val(),"reportTypeYear":$("[name=reportTypeYear]").val()}
		, success : function(reportTypeList){
				//alert("change_reportType 성공");
				//alert(reportTypeList[0].busi_type_code);	
				/*	
				var arrType = ["행정","사무","구매","접대","회계","기타"];
				
				var arr = [];
				arr.push( ['항목', '항목별 개수'] );
	
				for(var i=0 ; i<reportTypeList.length ; i++){
					var busi_type_code = parseInt(reportTypeList[i].busi_type_code,10);
	
					arr.push( [arrType[i],busi_type_code] );
				}
				
				var data = google.visualization.arrayToDataTable(arr);

				var options = {
					curveType: 'function',
					legend: { position: 'right' }
				};

				var chart = new google.visualization.PieChart(document.getElementById('piechart'));					
				chart.draw(data, options);		
				*/
				var arr = [];
				arr.push( ['항목', '항목별 개수'] );
	
				for(var i=0 ; i<reportTypeList.length ; i++){
					var cnt = parseInt(reportTypeList[i].cnt,10);
	
					arr.push( [reportTypeList[i].name,cnt] );
				}
				
				var data = google.visualization.arrayToDataTable(arr);
	
				var options = {
					//curveType: 'function'
					legend: { position: 'right' }
					,'sliceVisibilityThreshold':0
					,pieSliceText:'value-and-percentage' // value label percentage
                    //,legend:'none' 
				};
	
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));					
				chart.draw(data, options);
		}
		, error : function(){
			alert("reportTypeProc.do" + "접속 시 서버 응답 실패! 관리자에게 문의 바람!");
		}
	});
}

</script>



</head>


<body style="background-color: #B0B0B0"><center>

<nav class="navbar navbar-default" style="margin-bottom:20px; padding-top:10px;">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${requestScope.croot}/dashboard.do" style="padding: 10px 15px;"><img src="/resources/img/cloudWorks_02.png" width=40px;></a>
	</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	
		<ul class="nav nav-tabs">
			<li role="presentation"  class="active"><a href="${requestScope.croot}/dashboard.do">대시보드</a></li>
			<li role="presentation"><a href="${requestScope.croot}/boardListForm.do" >공지사항</a></li>
			<li role="presentation"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/expenseListForm.do" >지출보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/calendarForm.do" >일정관리</a></li>
			<li role="presentation"><a href="${requestScope.croot}/myPageForm.do" >마이페이지</a></li>
			<c:if test="${sessionScope.emp_no == '10001'}">
				<li role="presentation"><a href="${requestScope.croot}/employeeListForm.do" >관리자페이지</a></li>
			</c:if>
	     </ul>
	    <ul class="nav nav-tabs navbar-right" style="border-bottom:0px;">
			<li><a href="${requestScope.croot}/logout.do" >로그아웃</a></li>
		</ul>
	</div>
	
</nav>


<%-- <nav class="navbar navbar-default" style="margin-bottom:100px; padding-top:10px;">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="">로고</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="${requestScope.croot}/dashboard.do"><font color="white">대시보드</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/boardListForm.do" ><font color="white">공지사항</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/dailyListForm.do" ><font color="white">일일보고서</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/salesListForm.do" ><font color="white">영업보고서</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/expenseListForm.do" ><font color="white">지출보고서</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/calendarForm.do" ><font color="white">일정관리</font></a></li>
			<li role="presentation"><a href="${requestScope.croot}/myPageForm.do" ><font color="white">마이페이지</font></a></li>
			<c:if test="${sessionScope.emp_no == '10001'}">
				<li role="presentation"><a href="${requestScope.croot}/employeeListForm.do" ><font color="white">관리자페이지</font></a></li>
			</c:if>
	     </ul>
	     <ul class="nav nav-tabs navbar-right" style="border-bottom:0px;">
			<li><a href="${requestScope.croot}/logout.do" ><font color="white">로그아웃</font></a></li>
		</ul>
	</div>
</nav> --%>


<h3>사원 번호 ${emp_no} 번&nbsp;&nbsp;${emp_name}&nbsp;&nbsp;${jikup_name}님&nbsp;&nbsp;환영합니다.</h3><br>


<table border=1 width=70% style="border:white; margin-bottom:70px;">
	<tr><td width=400px align=center bgcolor=#eee>
		<!-- <div class="jumbotron" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; background-color: darkgray; height: 300px; width: 410px; margin-left: -100px" > -->
		<br><label style="font-size:16px;"><b>보고서 결재 횟수&nbsp;&nbsp;&nbsp;</b></label>
			<select name=reportSignCnt class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportSignCnt();">
				<option>년도</option>
				<option value=2021>2021년</option>
				<option value=2020>2020년</option>
				<option value=2019>2019년</option>
				<option value=2018>2018년</option>
				<option value=2017>2017년</option>
			</select>
			
		<div id="curve_chart" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; height: 300px; width: 600px;"></div>
		<br>		     
		<!-- </div> -->
	
		<td width=400px align=center bgcolor=#eee>
		<!-- <div class="jumbotron" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; background-color: darkgray; height: 300px; width: 410px; margin-left: 100px"> -->
		<br><label style="font-size:16px;"><b>등록한 보고서 결재 상태&nbsp;&nbsp;&nbsp;</b></label>
			<select name= reportSignState class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportSignState();">
				<option>보고서종류</option>
				<option value="1">일일보고서</option>
				<option value="2">영업보고서</option>
				<option value="3">지출보고서</option>
			</select>
			<select name=signUpReportYear class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportSignState();">
				<option>년도</option>
				<option value=2021>2021년</option>
				<option value=2020>2020년</option>
				<option value=2019>2019년</option>
				<option value=2018>2018년</option>
				<option value=2017>2017년</option>
			</select>
			<select name=signUpReportMonth class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportSignState();">
				<option>월</option>
				<option value=01>1월</option>
				<option value=02>2월</option>
				<option value=03>3월</option>
				<option value=04>4월</option>
				<option value=05>5월</option>
				<option value=06>6월</option>
				<option value=07>7월</option>
				<option value=08>8월</option>
				<option value=09>9월</option>
				<option value=10>10월</option>
				<option value=11>11월</option>
				<option value=12>12월</option>
			</select>
				    
		<div id="barchart_values" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; height: 300px; width: 600px;"></div>
		<br>	 
		<!-- </div> -->
		
	<tr><td width=400px align=center bgcolor=#eee>
		<!-- <div class="jumbotron" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; background-color: darkgray; height: 300px; width: 410px; margin-left: -100px" > -->
		<br><label style="font-size:16px;"><b>등록한 보고서 항목별 개수&nbsp;&nbsp;&nbsp;</b></label>
			<select name= reportType class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportType();">
				<option>보고서종류</option>
				<option value="1">일일보고서</option>
				<option value="2">영업보고서</option>
				<option value="3">지출보고서</option>
			</select>
			<select name= reportTypeYear class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onChange="change_reportType();">
				<option>년도</option>
				<option value=2021>2021년</option>
				<option value=2020>2020년</option>
				<option value=2019>2019년</option>
				<option value=2018>2018년</option>
				<option value=2017>2017년</option>
			</select>
			
		<div id="piechart" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; height: 300px; width: 600px;"></div>
		<br>
		<!-- </div> -->	
		    	
		<td width=400px align=center bgcolor=#eee>
		<!-- <div class="jumbotron" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; background-color: darkgray; height: 300px; width: 410px; margin-left: 100px"> -->
		<br><label style="font-size:16px;"><b>보고서 결재 요청 목록</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<div class="xxx" style="padding-top : 20px; padding-bottom : 10px; padding-right : 20px; padding-left : 20px; height: 300px; width: 600px;">
			
		</div>
		<br>
		<!-- </div> -->	
</table>


<form name="dailyContent" method="POST" action="${requestScope.croot}/dailyContentForm.do">
	<input type="hidden" name="report_no"> 
	<input type="hidden" name="selectPageNo" value="1">  
	<input type="hidden" name="rowCntPerPage" value="10">  
</form>

<form name="salesContent" method="POST" action="${requestScope.croot}/salesContentForm.do">
	<input type="hidden" name="report_no">
	<input type="hidden" name="selectPageNo" value="1">  
	<input type="hidden" name="rowCntPerPage" value="10"> 
</form>

<form name="expenseContent" method="POST" action="${requestScope.croot}/expenseContentForm.do">
	<input type="hidden" name="report_no">
	<input type="hidden" name="selectPageNo" value="1">  
	<input type="hidden" name="rowCntPerPage" value="10">
</form>
</body>
</html>