<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>일일보고서 등록</title>
<script>
//--------------------------------------------------------------------------------------------------------

$(document).ready(function(){
	
	var begin_year = $(".begin_year");
    insertYear(begin_year, 1960);
    
    var begin_month = $(".begin_month");
    insertMonth(begin_month); 

    var begin_day = $(".begin_day");
    insertDate(begin_day); 

    var begin_hour = $(".begin_hour");
    insertHour(begin_hour); 

    var begin_min = $(".begin_min");
    insertMin(begin_min); 

    var end_year = $(".end_year");
    insertYear(end_year, 1960);
    
    var end_month = $(".end_month");
    insertMonth(end_month); 

    var end_day = $(".end_day");
    insertDate(end_day); 

    var end_hour = $(".end_hour");
    insertHour(end_hour); 

    var end_min = $(".end_min");
    insertMin(end_min); 

    $('[name=rowCntPerPage]').change(function( ){
		search_when_pageNoClick();
	});

    inputData("[name=begin_year]", "${dailyDTO.begin_year}");
    inputData("[name=begin_month]", "${dailyDTO.begin_month}");
    inputData("[name=begin_day]", "${dailyDTO.begin_day}");
    inputData("[name=begin_hour]", "${dailyDTO.begin_hour}");
    inputData("[name=begin_min]", "${dailyDTO.begin_min}");
    inputData("[name=end_year]", "${dailyDTO.end_year}");
    inputData("[name=end_month]", "${dailyDTO.end_month}");
    inputData("[name=end_day]", "${dailyDTO.end_day}");
    inputData("[name=end_hour]", "${dailyDTO.end_hour}");
    inputData("[name=end_min]", "${dailyDTO.end_min}");
	
	 $(".begin_year , .begin_month , .begin_day , .begin_hour , .begin_min , .end_year , .end_month , .end_day , .end_hour , .end_min").change( function () {
		
		var begin_year  = $(".begin_year").val();
		var begin_month = $(".begin_month").val();
		var begin_day   = $(".begin_day").val();			
		var begin_hour = $(".begin_hour" ).val();
		var begin_min  = $(".begin_min" ).val();

		var end_year  = $(".end_year" ).val();
		var end_month = $(".end_month" ).val();
		var end_day   = $(".end_day" ).val();
		var end_hour = $(".end_hour" ).val();
		var end_min  = $(".end_min" ).val();
	}); 
}); 



//--------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------

function goDateReset(){	
	$(".begin_year").val("");
	$(".begin_month").val("");
	$(".begin_day").val("");
	$(".begin_hour").val("");
	$(".begin_min").val("");
	//--------------------
	$(".end_year").val("");
	$(".end_month").val("");
	$(".end_day").val("");
	$(".end_hour").val("");
	$(".end_min").val("");
}

//--------------------------------------------------------------------------------------------------------



function checkDate(){
	var begin_year = $(".begin_year").val();
    var begin_month = $(".begin_month").val();
    var begin_day = $(".begin_day").val();
    var end_year = $(".end_year").val();
    var end_month = $(".end_month").val();
    var end_day = $(".end_day").val();
    
    var begin_date = new Date(
        parseInt(begin_year, 10),
        parseInt(begin_month, 10)-1,
        parseInt(begin_day, 10)
    );

    var end_date = new Date(
        parseInt(end_year, 10),
        parseInt(end_month, 10)-1,
        parseInt(end_day, 10)
    );

    var today = new Date();

    if(today.getTime() < begin_date.getTime()){
    	alert("현재날짜보다 미래를 선택하셨습니다.")
        $(".begin_year").val("");
    	$(".begin_month").val("");
    	$(".begin_day").val("");
        return;
    }

    else if(today.getTime() < end_date.getTime()  ){
    	alert("현재날짜보다 미래를 선택하셨습니다.")
        $(".end_year").val("");
    	$(".end_month").val("");
    	$(".end_day").val("");
        return;
    }

    if(end_date.getTime() < begin_date.getTime()){
    	alert("최소날짜가 최대날짜보다 큽니다.")
        $(".begin_year").val("");
    	$(".begin_month").val("");
    	$(".begin_day").val("");
    	$(".begin_hour").val("");
    	$(".begin_min").val("");
    	$(".end_year").val("");
    	$(".end_month").val("");
    	$(".end_day").val(""); 
    	$(".end_hour").val("");
    	$(".end_min").val("");   
    }

       
    if((begin_month==04 || begin_month==06 || begin_month==09 || begin_month==11) && begin_day==31){
    	alert("없는 날짜를 선택하셨습니다.")
    	$(".begin_year").val("");
    	$(".begin_month").val("");
    	$(".begin_day").val("");
    	$(".begin_hour").val("");
    	return;
    }

    else if(begin_month == 02){
		var yoondal = (begin_year % 4 == 0 && (begin_year % 100 != 0 || begin_year % 400 == 0));
		if(begin_day > 29 || (begin_day==29 && !yoondal)){
			alert("없는 날짜를 선택하셨습니다.")
	    	$(".begin_year").val("");
	    	$(".begin_month").val("");
	    	$(".begin_day").val("");
	    	$(".begin_hour").val("");
	    	return;
		}
    }

        
	if((end_month==04 || end_month==06 || end_month==09 || end_month==11) && end_day==31){
       	alert("없는 날짜를 선택하셨습니다.")
       	$(".begin_year").val("");
       	$(".begin_month").val("");
       	$(".begin_day").val("");
       	return;
	}

	else if(end_month == 02){
   		var yoondal = (end_year % 4 == 0 && (end_year % 100 != 0 || end_year % 400 == 0));
   		if(end_day > 29 || (end_day==29 && !yoondal)){
   			alert("없는 날짜를 선택하셨습니다.")
   			$(".end_year").val("");
   	    	$(".end_month").val("");
	    	$(".end_day").val(""); 
   	    	return;
   		}
	}
    
}
//--------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------

function checkDailyRegForm(){
	
	if( checkEmpty("[name=busi_type_code]"   , "업무분야를 선택해 주세요" 	 ) ){return;}
	
	if( checkEmpty("[name=begin_year]"   , "시작 연을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=begin_month]"  , "시작 월을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=begin_day]"    , "시작 일을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=begin_hour]"   , "시작 시를 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=begin_min]"    , "시작 분을 선택해 주세요" 	 ) ){return;}


	if( checkEmpty("[name=end_year]"    , "종료 연을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=end_month]"   , "종료 월을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=end_day]"     , "종료 일을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=end_hour]"    , "종료 시를 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=end_min]"     , "종료 분을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=busi_content]"     , "업무 내용을 입력해주세요" 	 ) ){return;}
	
//--------------------------------------------------------------------------------------------------------
//아래코드 실행안된다.
	
	

//여기까지
//--------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------

		if(confirm("정말 등록 하시겠습니까?")==false){return;}
		
		$.ajax({
			url : "${requestScope.croot}/dailyRegProc.do"
			, type : "post"
			, data : $('[name=dailyRegForm]').serialize()
			, success : function(RegCnt){	
				if(RegCnt==1){
					alert("등록 성공!");
					goDailyList();
				}
				else{
					alert("등록 실패! 관리자에게 문의 바람.");
				}
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
	}

	function goDailyList(){
		document.dailyList.submit();
	}
</script>

</head>
<body style="background-color: #B0B0B0"><center>
<nav class="navbar navbar-default" style="margin-bottom:100px; padding-top:10px;">
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
			<li role="presentation"><a href="${requestScope.croot}/dashboard.do">대시보드</a></li>
			<li role="presentation"><a href="${requestScope.croot}/boardListForm.do" >공지사항</a></li>
			<li role="presentation" class="active"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
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



<form name="dailyRegForm" method="post" action="${requestScope.croot}/dailyListForm.do">
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">일일업무 보고서 등록</h4>
		<table class="table table1-bordered">
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>작성자</b>
				<td style="vertical-align:middle;">
					<span>${getDailyReg.emp_name } ${getDailyReg.jikup_name } </span>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>업무분야</b>
				<td style="vertical-align:middle;">
					<div class="form-group" style="margin-bottom:0px;">
						<div class="btn-group" data-toggle="buttons">
					        <select name="busi_type_code"  class="busi_type_code form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
							      <option value="">--선택--</option>
								  <option value="1">사무</option>
								  <option value="2">회계</option>
								  <option value="3">영업</option>
								  <option value="4">접대</option>
								  <option value="5">구매</option>
								  <option value="6">기타</option>
							</select>
								
						</div>
					</div>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>시간</b> 
	            <td colspan="5"><span class="Date" id="Date">
		            <div>
		            	
		               <select name="begin_year" class="begin_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년
						
		               <select name="begin_month" class="begin_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
		                    <option value=""> - 선택 - </option>
		               </select>  월
		               
		               <select name="begin_day" class="begin_day form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  일
		               
		               <select name="begin_hour" class="begin_hour form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  시
						
		               <select name="begin_min" class="begin_min form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  분 부터 <br>
		                
		       
		                
		                <select name="end_year" class="end_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년
		
		               <select name="end_month" class="end_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
		                    <option value=""> - 선택 - </option>
		               </select>  월
		               
		               <select name="end_day" class="end_day form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  일
		               
		               <select name="end_hour" class="end_hour form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  시
						
		               <select name="end_min" class="end_min form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  분 까지

					</div>
	            </td> 
			</tr>
			
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>업무내용</b>
				<td>
					<textarea name="busi_content" class = "busi_content" rows="30" cols="75"></textarea>
					
				</td>
			</tr>
				
			
			<c:if test="${!empty getDailyReg.mgr_emp_name }">
				<tr>
				    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>다음 결제자</b>
					<td style="vertical-align:middle;">
						<span>${getDailyReg.mgr_emp_name } ${getDailyReg.mgr_jikup_name } </span>
					</td>
				</tr>
			</c:if>	
				
			

		</table>
		<input type="button" value="   등록   " class="save_daily btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="checkDailyRegForm();">&nbsp;
		<input type="button" value="  이전 페이지  "  class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goDailyList()">&nbsp;
		<input type='reset' value='   초기화   ' class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" >
</form>

<form name="dailyList" method="POST" action="${requestScope.croot}/dailyListForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
</form>




</body>
</html>