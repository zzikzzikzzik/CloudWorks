<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>영업보고서 검색</title>
<script>
	$(document).ready(function(){
		
		
		var begin_year = $(".begin_year");
	    insertYear(begin_year, 1960);
	    
	    var begin_month = $(".begin_month");
	    insertMonth(begin_month); 
	
	    var end_year = $(".end_year");
	    insertYear(end_year, 1960);
	    
	    var end_month = $(".end_month");
	    insertMonth(end_month); 

	       
	    $('[name=rowCntPerPage]').change(function( ){
			search_when_pageNoClick();
		});

	    inputData("[name=begin_year]", "${salesSearchDTO.begin_year}");
	    inputData("[name=begin_month]", "${salesSearchDTO.begin_month}");
	    inputData("[name=end_year]", "${salesSearchDTO.end_year}");
	    inputData("[name=end_month]", "${salesSearchDTO.end_month}");
	    inputData("[name=sales_type_code]", "${salesSearchDTO.sales_type_code}");
	    inputData("[name=sign]", "${salesSearchDTO.sign}");
	    inputData("[name=report_name]", "${salesSearchDTO.report_name}");
	    
	    inputData("[name=selectPageNo]", "${salesSearchDTO.selectPageNo}");
	    inputData("[name=rowCntPerPage]", "${salesSearchDTO.rowCntPerPage}");

	    inputData("[name=order]", "${salesSearchDTO.order}");


		<c:if test = "${empty salesSearchDTO.order}">
			$(".emp_name_th").text("작성자");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'emp_name desc'}">
			$(".emp_name_th").text("작성자▼");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'emp_name asc'}">
			$(".emp_name_th").text("작성자▲");
		</c:if>
		
		$(".emp_name_th").click(function(){
			
			var txt = $(this).text();
			if( txt == "작성자"){
				$(".order").val("emp_name desc");
			}
		
			else if( txt == "작성자▼"){
				$(".order").val("emp_name asc")
			}
		
			else if( txt == "작성자▲"){
				$(".order").val("");
			}


			document.salesListForm.submit();
		}) 
		
		//-----------------------------------------------------
		
		<c:if test = "${empty salesSearchDTO.order}">
			$(".report_name_th").text("영업제목");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'report_name desc'}">
			$(".report_name_th").text("영업제목▼");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'report_name asc'}">
			$(".report_name_th").text("영업제목▲");
		</c:if>
		
		$(".report_name_th").click(function(){
		
			var txt = $(this).text();
			if( txt == "영업제목"){
				$(".order").val("report_name desc");
			}
		
			else if( txt == "영업제목▼"){
				$(".order").val("report_name asc")
			}
		
			else if( txt == "영업제목▲"){
				$(".order").val("");
			}
			
			document.salesListForm.submit();
		}) 
		
		//-----------------------------------------------------
		
		<c:if test = "${empty salesSearchDTO.order}">
			$(".sales_type_name_th").text("방문목적");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sales_type_name desc'}">
			$(".sales_type_name_th").text("방문목적▼");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sales_type_name asc'}">
			$(".sales_type_name_th").text("방문목적▲");
		</c:if>
		
		$(".sales_type_name_th").click(function(){
		
			var txt = $(this).text();
			if( txt == "방문목적"){
				$(".order").val("sales_type_name desc");
			}
		
			else if( txt == "방문목적▼"){
				$(".order").val("sales_type_name asc")
			}
		
			else if( txt == "방문목적▲"){
				$(".order").val("");
			}
			
			document.salesListForm.submit();
		}) 
		
		//-----------------------------------------------------
		
		<!-- 상급자의 상급자가 존재 할 경우 -->
		<c:if test = "${empty salesSearchDTO.order}">
			$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'MGR_MGR_SIGN_NAME desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'MGR_MGR_SIGN_NAME asc'}">
			$(".sign_name_th").text("결재여부▲");
		</c:if>
		
		
		
		<!-- 상급자만 존재 할 경우 -->
		<c:if test = "${empty salesSearchDTO.order}">
		$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'MGR_SIGN_NAME desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'MGR_SIGN_NAME asc'}">
			$(".sign_name_th").text("결재여부▲");
		</c:if>
		

		<!-- 상급자가 없을 경우 -->
		<c:if test = "${empty salesSearchDTO.order}">
			$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'sign_name desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.salesSearchDTO.order == 'sign_name asc'}">
			$(".sign_name_th").text("결재여부▲");
		</c:if>

		$(".sign_name_th").click(function(){
			var txt = $(this).text();
			<!-- 상급자의 상급자가 존재 할 경우 -->
			<c:if test="${check_MgrCnt == 1 && check_Mgr_MgrCnt == 1}">
				if( txt == "결재여부"){
					$(".order").val("MGR_MGR_SIGN_NAME desc");
				}
		
				else if( txt == "결재여부▼"){
					$(".order").val("MGR_MGR_SIGN_NAME asc")
				}
		
				else if( txt == "결재여부▲"){
					$(".order").val("");
				}
				
				document.salesListForm.submit();
			</c:if>

			<!-- 상급자만 존재 할 경우 -->
			<c:if test="${check_MgrCnt == 1 && check_Mgr_MgrCnt == 0}">
				if( txt == "결재여부"){
					$(".order").val("MGR_SIGN_NAME desc");
				}
		
				else if( txt == "결재여부▼"){
					$(".order").val("MGR_SIGN_NAME asc")
				}
		
				else if( txt == "결재여부▲"){
					$(".order").val("");
				}
				
				document.salesListForm.submit();
			</c:if>

			<!-- 상급자가 없을 경우 -->
			<c:if test="${check_MgrCnt == 0 && check_Mgr_MgrCnt == 0}">
				if( txt == "결재여부"){
					$(".order").val("sign_name desc");
				}
		
				else if( txt == "결재여부▼"){
					$(".order").val("sign_name asc")
				}
		
				else if( txt == "결재여부▲"){
					$(".order").val("");
				}
				document.salesListForm.submit();
			</c:if>
		}) 

		
		//-----------------------------------------------------
		
		<c:if test = "${empty salesSearchDTO.order}">
			$(".sign_date_th").text("결재 / 반려일");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sign_date desc'}">
			$(".sign_date_th").text("결재 / 반려일▼");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sign_date asc'}">
			$(".sign_date_th").text("결재 / 반려일▲");
		</c:if>
		
		$(".sign_date_th").click(function(){
		
			var txt = $(this).text();
			if( txt == "결재 / 반려일"){
				$(".order").val("sign_date desc");
			}
		
			else if( txt == "결재 / 반려일▼"){
				$(".order").val("sign_date asc")
			}
		
			else if( txt == "결재 / 반려일▲"){
				$(".order").val("");
			}
			
			document.salesListForm.submit();
		}) 
		
		//-----------------------------------------------------
		
		<c:if test = "${empty salesSearchDTO.order}">
			$(".sales_date_th").text("영업일");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sales_date desc'}">
			$(".sales_date_th").text("영업일▼");
		</c:if>
		
		<c:if test = "${requestScope.salesSearchDTO.order == 'sales_date asc'}">
			$(".sales_date_th").text("영업일▲");
		</c:if>
		
		$(".sales_date_th").click(function(){
		
			var txt = $(this).text();
			if( txt == "영업일"){
				$(".order").val("sales_date desc");
			}
		
			else if( txt == "영업일▼"){
				$(".order").val("sales_date asc")
			}
		
			else if( txt == "영업일▲"){
				$(".order").val("");
			}
			
			document.salesListForm.submit();
		}) 
		
		//-----------------------------------------------------
				
	    $(".pagingNumber").html(
				getPagingNumber(
					"${listAllCnt}"      
					,"${salesSearchDTO.selectPageNo}"        
					,"${salesSearchDTO.rowCntPerPage}"      
					,"15"                       
					,"search_when_pageNoClick();"              
				)
		);



	});

	function search(){
		var cnt = 0;
		if(isEmpty($("[name=begin_year]")) == false){cnt++}
		if(isEmpty($("[name=begin_month]")) == false){cnt++}
		if(isEmpty($("[name=end_year]")) == false){cnt++}
		if(isEmpty($("[name=end_month]")) == false){cnt++}
		if(isEmpty($("[name=sales_type_code]")) == false){cnt++}
		if(isEmpty($("[name=sign]")) == false){cnt++}
		if(isEmpty($("[name=report_name]")) == false){cnt++}

		if(cnt == 0){
			alert("1개 이상 항목을 검색하셔야 합니다.")
			return;
		}

		var beginCnt = 0;
		if(isEmpty($("[name=begin_year]")) == false){beginCnt++}
		if(isEmpty($("[name=begin_month]")) == false){beginCnt++}
		if(beginCnt == 1){
			alert("최소날짜의 년과 월을 전부 입력해주세요")
			return;
		}

		var endCnt = 0;
		if(isEmpty($("[name=end_year]")) == false){beginCnt++}
		if(isEmpty($("[name=end_month]")) == false){beginCnt++}
		if(endCnt == 1){
			alert("최대날짜의 년과 월을 전부 입력해주세요")
			return;
		}
		
		document.salesListForm.submit();
	}
	
	function checkDate(){
		var begin_year = $(".begin_year").val();
        var begin_month = $(".begin_month").val();
        var end_year = $(".end_year").val();
        var end_month = $(".end_month").val();

        var begin_date = new Date(
            parseInt(begin_year, 10),
            parseInt(begin_month, 10)-1
        );

        var end_date = new Date(
            parseInt(end_year, 10),
            parseInt(end_month, 10)-1
        );

        var today = new Date();

        if(today.getTime() < begin_date.getTime()){
        	alert("현재날짜보다 미래를 선택하셨습니다.")
            $(".begin_year").val("");
        	$(".begin_month").val("");
            return;
        }

        else if(today.getTime() < end_date.getTime()  ){
        	alert("현재날짜보다 미래를 선택하셨습니다.")
            $(".end_year").val("");
        	$(".end_month").val("");
            return;
        }

        if(end_date.getTime() < begin_date.getTime()){
        	alert("최소날짜가 최대날짜보다 큽니다.")
            $(".begin_year").val("");
        	$(".begin_month").val("");
        	$(".end_year").val("");
        	$(".end_month").val("");
        }
	}

	function searchAll(){
		$("[name=selectPageNo]").val("1");
		$("[name=begin_year]").val("");
		$("[name=begin_month]").val("");
		$("[name=end_year]").val("");
		$("[name=end_month]").val("");
		$("[name=sales_type_code]").val("");
		$("[name=sign]").val("");
		$("[name=report_name]").val("");

		document.salesListForm.submit();
	}

	function sendEmp_no(report_no){
		document.sendEmp_no.submit();
	}

	function search_when_pageNoClick(){
		document.salesListForm.submit();
	}

	function goSalesContent(report_no){
		$("[name=salesContent] [name=selectPageNo]").val( 
			$("[name=salesListForm] [name=selectPageNo]").val( )
		);
	
		$("[name=salesContent] [name=rowCntPerPage]").val( 
			$("[name=salesListForm] [name=rowCntPerPage]").val( )
		);
		
		$("[name=salesContent] [name=report_no]").val(report_no);
		
		document.salesContent.submit();

	}

	function goSalesReg(){
		$("[name=salesReg] [name=selectPageNo]").val( 
			$("[name=salesListForm] [name=selectPageNo]").val( )
		);
	
		$("[name=salesReg] [name=rowCntPerPage]").val( 
			$("[name=salesListForm] [name=rowCntPerPage]").val( )
		);

		
		document.salesReg.submit();

	}

	  
	function goDateReset(){
		$("[name=begin_year]").val("");
		$("[name=begin_month]").val("");
		$("[name=end_year]").val("");
		$("[name=end_month]").val("");
	}

	function goSignReset(){
		$("input:radio[name='sign']").prop('checked', false); 
	}

	function goSales_type_codeReset(){
		$("input:radio[name='sales_type_code']").prop('checked', false); 
	}
	
	function goreport_nameReset(){
		$("[name=report_name]").val("");
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
			<li role="presentation" class="active"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
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



<form name="salesListForm" method="post" action="${requestScope.croot}/salesListForm.do">

	<input type="hidden" name="order" class="order">
	
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">영업 보고서</h4>
		<table class="table table1-bordered">
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>업무일</b>
	            <td colspan="5">
		            <div>
		               <select name="begin_year" class="begin_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년
						
		               <select name="begin_month" class="begin_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  월
		                
		                ~
		                
		                 <select name="end_year" class="end_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년
		
		               <select name="end_month" class="end_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  월
		               &nbsp;&nbsp;&nbsp;<a href ="javascript:goDateReset();">[비움]</a>
					</div>
	            </td> 
			</tr>
			
			
			
			<tr> 
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>방문목적</b>
				<td>
					<div class="form-group" style="margin-bottom:0px;">
						<div class="btn-group" data-toggle="buttons">
							<label>
								<input type="radio" name="sales_type_code" autocomplete="off" value="1">거래처 확보
							</label>
							&nbsp;&nbsp;&nbsp;
							<label>
								<input type="radio" name="sales_type_code" autocomplete="off" value="2">회의
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="sales_type_code" autocomplete="off" value="3">직원관리
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="sales_type_code" autocomplete="off" value="4">기타
							</label>
							&nbsp;&nbsp;&nbsp;	
							<a href ="javascript:goSales_type_codeReset();">[비움]</a>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>결제여부</b>
				<td>
					<div class="form-group" style="margin-bottom:0px;" >
						<div class="btn-group" data-toggle="buttons">
							<!-- 상급자의 상급자가 존재 할 경우 -->
							<c:if test="${check_MgrCnt == 1 && check_Mgr_MgrCnt == 1}">
								<label>
									<input type="radio" name="sign" autocomplete="off" value="1a">승인
								</label>
								&nbsp;&nbsp;&nbsp;
								<label>
									<input type="radio" name="sign" autocomplete="off" value="2a">반려
								</label>
								&nbsp;&nbsp;&nbsp;
								<label >
									<input type="radio" name="sign" autocomplete="off" value="3a">진행 중
								</label>
							</c:if>
							
							<!-- 상급자만 존재 할 경우 -->
							<c:if test="${check_MgrCnt == 1 && check_Mgr_MgrCnt == 0}">
								<label>
									<input type="radio" name="sign" autocomplete="off" value="1b">승인
								</label>
								&nbsp;&nbsp;&nbsp;
								<label>
									<input type="radio" name="sign" autocomplete="off" value="2b">반려
								</label>
								&nbsp;&nbsp;&nbsp;
								<label >
									<input type="radio" name="sign" autocomplete="off" value="3b">진행 중
								</label>
							</c:if>
							<!-- 상급자가 없을 경우 -->
							<c:if test="${check_MgrCnt == 0 && check_Mgr_MgrCnt == 0}">
								<label>
									<input type="radio" name="sign" autocomplete="off" value="1c">승인
								</label>
								&nbsp;&nbsp;&nbsp;
								<label>
									<input type="radio" name="sign" autocomplete="off" value="2c">반려
								</label>
								&nbsp;&nbsp;&nbsp;
								<label >
									<input type="radio" name="sign" autocomplete="off" value="3c">진행 중
								</label>
							</c:if>
							&nbsp;&nbsp;&nbsp;<a href ="javascript:goSignReset();">[비움]</a>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>영업제목</b>
				<td>
					<input type="text" name="report_name" size="20" style="width: 100px; height: 30px;">
					&nbsp;&nbsp;&nbsp;<a href ="javascript:goreport_nameReset();">[비움]</a>
				</td>
			</tr>
		</table>

		<input type="button" value="   검색   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="search();">&nbsp;
		<input type="button" value="     모두검색     " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="searchAll();">&nbsp;
		<input type="button" value="   초기화   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="searchAll();">
		
		<br><br>
		<div class="boardListAllCnt" style="text-align: right">총 게시글 수 : <strong>${listAllCnt}</strong></div><br>
		<div style="text-align: right">
			<input type="hidden" name="selectPageNo" class="selectPageNo">  	
			<select name="rowCntPerPage" class="rowCntPerPage form-control" style=" width:auto; height:auto; margin-bottom:10px; float:right;">
					<option value="10">10 행
					<option value="15">15 행
					<option value="20">20 행
					<option value="25">25 행
					<option value="30">30 행
				</select> 
		</div>
		<div style="text-align: left"><input type="button" value="  영업보고서 등록  " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goSalesReg()"></div><br>
		<table>
			<tr>
				<td>
					
					
				</td>
			</tr>
		</table>
		
			
		<table class="boardTable table table-striped">
			<tr>
				<th class="rnum_order_th"  style="text-align: center; vertical-align:middle;">일련번호</th>
				<th class="emp_name_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">작성자</th>
				<th class="report_name_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">영업제목</th>
				<th class="sales_type_name_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">방문목적</th>
				<th class="sign_name_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">결재여부</th>
				<th class="sign_date_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">결재 / 반려일</th>
				<th class="sales_date_th"  style="text-align: center; cursor:pointer; vertical-align:middle;">영업일</th>
			</tr>
			
			
			<c:forEach items="${getSalesList }" var="getSalesList" varStatus="loopTagStatus" >
				<tr class='tr'>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.RNUM}</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.EMP_NAME}</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.REPORT_NAME }</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.SALES_TYPE_NAME }</td>
					
					<!--  -->
					<c:if test="${!empty getSalesList.MGR_MGR_SIGN_NAME && !empty getSalesList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.MGR_MGR_SIGN_NAME }</td>
					</c:if>
					
					<c:if test="${empty getSalesList.MGR_MGR_SIGN_NAME && !empty getSalesList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.MGR_SIGN_NAME }</td>
					</c:if>
					
					<c:if test="${empty getSalesList.MGR_MGR_SIGN_NAME && empty getSalesList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.SIGN_NAME }</td>
					</c:if>
					<!--  -->
					
					<!--  -->
					<c:if test="${empty getSalesList.SIGN_DATE && getSalesList.SIGN_NAME == '진행 중'}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">결재 전</td>
					</c:if>
					
					<c:if test="${!empty getSalesList.SIGN_DATE }">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.SIGN_DATE}일 전</td>
					</c:if>
					
					<c:if test="${empty getSalesList.SIGN_DATE && getSalesList.SIGN_NAME == '반려'}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">반려 된 보고서</td>
					</c:if>
					<!--  -->
					
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goSalesContent(${getSalesList.REPORT_NO })">${getSalesList.SALES_DATE }</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${listAllCnt == 0}">
				<h5>데이터가 없습니다.</h5>
		</c:if>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		</div>
	</div>
</form>

<form name="salesContent" method="POST" action="${requestScope.croot}/salesContentForm.do">
	<input type="hidden" name="report_no">
	<input type="hidden" name="selectPageNo">  
	<input type="hidden" name="rowCntPerPage">  
</form>

<form name="salesReg" method="POST" action="${requestScope.croot}/salesRegForm.do">
	<input type="hidden" name="report_no">
	<input type="hidden" name="selectPageNo">  
	<input type="hidden" name="rowCntPerPage">  
</form>



</body>
</html>