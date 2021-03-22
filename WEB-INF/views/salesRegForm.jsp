<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>영업보고서 등록</title>
	
	<script>
	//--------------------------------------------------------------------------------------------------------
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

			    inputData("[name=begin_year]", "${salesDTO.begin_year}");
			    inputData("[name=begin_month]", "${salesDTO.begin_month}");
			    inputData("[name=begin_day]", "${salesDTO.begin_day}");
			    inputData("[name=begin_hour]", "${salesDTO.begin_hour}");
			    inputData("[name=begin_min]", "${salesDTO.begin_min}");
			    inputData("[name=end_year]", "${salesDTO.end_year}");
			    inputData("[name=end_month]", "${salesDTO.end_month}");
			    inputData("[name=end_day]", "${salesDTO.end_day}");
			    inputData("[name=end_hour]", "${salesDTO.end_hour}");
			    inputData("[name=end_min]", "${salesDTO.end_min}");
				
				 $(".begin_year , .begin_month , .begin_day , .begin_hour , .begin_min , .end_year , .end_month , .end_day , .end_hour , .end_min").change( function () {
					
					var begin_year  = $(".begin_year").val();
					var begin_month = $(".begin_month").val();
					var begin_day   = $(".begin_day").val();
					var begin_hour = $(".begin_hour" ).val();
					var begin_min  = $(".begin_min" ).val();
		//------------------------------------------------------------------
					var end_year  = $(".end_year" ).val();
					var end_month = $(".end_month" ).val();
					var end_day   = $(".end_day" ).val();
					var end_hour = $(".end_hour" ).val();
					var end_min  = $(".end_min" ).val();
				}); 
			}); //ready 끝

	//--------------------------------------------------------------------------------------------------------
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


			function checkSalesListForm(){
				 
				if( checkEmpty( "[name=report_name]", "제목을 입력해주세요.") ){ 
				$("[name=report_name]").focus();
				return; 	
				}

				if(isEmpty($("[name=sales_type_code]"))){
					alert("방문목적을 선택해주세요.")
					$("[name=sales_type_code]").focus();
					return;
				}
						
				if( checkEmpty( "[name=sales_company]", "거래처회사 입력해주세요.") ){ 
					$("[name=sales_company]").focus();
					return; 	
				}

				if( checkEmpty( "[name=sales_name]", "담당자 이름을 입력해주세요.") ){ 
					$("[name=sales_name]").focus();
					return; 	
				}

				if( checkEmpty( "[name=sales_jikup]", "담당자 직급을 입력해주세요.") ){ 
					$("[name=sales_jikup]").focus();
					return; 	
				}

				if( checkEmpty( "[name=sales_phone]", "담당자 전화번호를 입력해주세요.") ){ 
					$("[name=sales_phone]").focus();
					return; 	
				}

				
				if(checkPattern("[name=sales_phone]", /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/ , "정확한 휴대폰 번호를 입력해 주세요." ) ){
					$("[name=sales_phone]").focus();
					return;
				}
				

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

				if( checkEmpty( "[name=sales_content]", "영업 내용을 입력 해 주세요.") ){ 
					$("[name=sales_content]").focus();
					return; 	
				}

				if( checkEmpty( "[name=sales_result]", "영업 성과를 입력 해 주세요.") ){ 
					$("[name=sales_result]").focus();
					return; 	
				}


	


			if(confirm("정말 등록 하시겠습니까?")==false){return;}
			
			
			$.ajax({
				url:"${requestScope.croot}/salesRegProc.do" 
				, type:"post"
				,data : $('[name=salesRegForm]').serialize()
				, success : function(salesRegCnt){
					if(salesRegCnt==1){    
						alert("영업보고서가 등록 되었습니다.");
						goSalesList();
					}
					else {
						alert("글이 등록되지 못 했습니다.관리자에게 문의 바랍니다.");
					}
				}
				, error : function(){
					alert("인터넷 연결 상태를 확인 해 주세요");
				}
			});
	}

	function goSalesList(){
		document.salesList.submit();
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
			<li role="presentation"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
			<li role="presentation"  class="active"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
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



<form name="salesRegForm" method="post" action="${requestScope.croot}/salesRegProc.do">
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">영업 보고서 등록</h4>
		<table class="table table1-bordered">
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>작성자</b>
				<td style="vertical-align:middle;">
					<span>${getSalesReg.emp_name } ${getSalesReg.jikup_name } </span>
				</td>
			</tr>
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>제목</b>
				<td style="vertical-align:middle;">
				<input type="text" name="report_name" size="20" > 
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>방문목적</b>
				<td style="vertical-align:middle;">
					<div class="form-group" style="margin-bottom:0px;">
						<div class="btn-group" data-toggle="buttons">
					        <select name="sales_type_code" class="form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" >
							      <option value="">--선택--</option>
								  <option value="1">거래처확보</option>
								  <option value="2">회의</option>
								  <option value="3">직원관리</option>
								  <option value="4">기타</option>
							</select>
								
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				        
	            <th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>거래처</b> 
					<td>
					  <table class="table table1-bordered" style="margin-bottom:0px;">
					        <tr>
					            <th>거래처 회사</th>
					            <th>담당자 이름</th>
					            <th>담당자 직급</th>
					            <th>담당자 전화번호</th>
					        </tr>
					           
					        <tr>
						    	<td><input type="text" name="sales_company" size="20"></td>
						        <td><input type="text" name="sales_name" size="20"></td>
						        <td><input type="text" name="sales_jikup" size="20"></td>
						        <td><input type="text" name="sales_phone" size="20"></td>
					       </tr>
					  </table>
					</td> 
				
			</tr>
			
			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>방문시간</b> 
	            <td colspan="5" style="vertical-align:middle;">
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
		                
		         		~<br>
		                
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
						
		               <select name="end_min" class="end_min form-control"  style="display:inline-block; width:auto; height:auto; padding: 2px 10px; onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  분 까지
		               
					</div>
	            </td> 
			</tr>
			
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;" ><b>영업내용</b>
				<td style="vertical-align:middle;">
					<textarea name="sales_content"  rows="15" cols="75" ></textarea>
				</td>
			</tr>
			
			
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>영업성과</b>
				<td style="vertical-align:middle;">
					<textarea name="sales_result"  rows="15" cols="75" ></textarea>
				</td>
			</tr>
				
				
			<c:if test="${!empty getSalesReg.mgr_emp_name }">
				<tr>
				    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>다음 결제자</b>
					<td style="vertical-align:middle;">
						<span>${getSalesReg.mgr_emp_name } ${getSalesReg.mgr_jikup_name } </span>
					</td>
				</tr>
			</c:if>		

		</table>
		<input type="button" value="   등록   " class="save_daily btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="checkSalesListForm()">&nbsp;
		<input type="button" value="  이전 페이지  " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goSalesList()">&nbsp;
		<input type='reset' value='   초기화  ' class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;">
		
		
</form>
<form name="salesList" method="POST" action="${requestScope.croot}/salesListForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
</form>





</body>
</html>