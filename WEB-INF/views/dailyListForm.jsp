<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>일일보고서 검색 화면</title>
<script>
	$(document).ready(function(){

		 $(".pagingNumber").html(
					getPagingNumber(
						"${listAllCnt}"      
						,"${dailySearchDTO.selectPageNo}"        
						,"${dailySearchDTO.rowCntPerPage}"      
						,"10"                       
						,"search_when_pageNoClick();"              
					)
			);

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

	    inputData("[name=begin_year]", "${dailySearchDTO.begin_year}");
	    inputData("[name=begin_month]", "${dailySearchDTO.begin_month}");
	    inputData("[name=end_year]", "${dailySearchDTO.end_year}");
	    inputData("[name=end_month]", "${dailySearchDTO.end_month}");
	    inputData("[name=busi_type_code]", "${dailySearchDTO.busi_type_code}");
	    inputData("[name=sign]", "${dailySearchDTO.sign}");
	    inputData("[name=busi_content]", "${dailySearchDTO.busi_content}");
	    
	    inputData(".selectPageNo", "${dailySearchDTO.selectPageNo}");
	    inputData(".rowCntPerPage", "${dailySearchDTO.rowCntPerPage}");

	    inputData("[name=order]", "${dailySearchDTO.order}");


	    <c:if test = "${empty dailySearchDTO.order}">
			$(".emp_name_th").text("작성자");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'emp_name desc'}">
			$(".emp_name_th").text("작성자▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'emp_name asc'}">
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
			
			document.dailyListForm.submit();
		}) 
	
		//-----------------------------------------------------
		
		<c:if test = "${empty dailySearchDTO.order}">
			$(".busi_type_name_th").text("업무분야");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_type_name desc'}">
			$(".busi_type_name_th").text("업무분야▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_type_name asc'}">
			$(".busi_type_name_th").text("업무분야▲");
		</c:if>
		
	
		$(".busi_type_name_th").click(function(){

			var txt = $(this).text();
			if( txt == "업무분야"){
				$(".order").val("busi_type_name desc");
			}
	
			else if( txt == "업무분야▼"){
				$(".order").val("busi_type_name asc")
			}
	
			else if( txt == "업무분야▲"){
				$(".order").val("");
			}
			
			document.dailyListForm.submit();
		}) 
	
	
	
		//-----------------------------------------------------

		<c:if test = "${empty dailySearchDTO.order}">
			$(".busi_content_th").text("업무내용");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_content desc'}">
			$(".busi_content_th").text("업무내용▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_content asc'}">
			$(".busi_content_th").text("업무내용▲");
		</c:if>
	
		$(".busi_content_th").click(function(){

			var txt = $(this).text();
			if( txt == "업무내용"){
				$(".order").val("busi_content desc");
			}
	
			else if( txt == "업무내용▼"){
				$(".order").val("busi_content asc")
			}
	
			else if( txt == "업무내용▲"){
				$(".order").val("");
			}
			
			document.dailyListForm.submit();
		}) 
		
		//-----------------------------------------------------
		
		<!-- 상급자의 상급자가 존재 할 경우 -->
		<c:if test = "${empty dailySearchDTO.order}">
			$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'MGR_MGR_SIGN_NAME desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'MGR_MGR_SIGN_NAME asc'}">
			$(".sign_name_th").text("결재여부▲");
		</c:if>
		
		
		
		<!-- 상급자만 존재 할 경우 -->
		<c:if test = "${empty dailySearchDTO.order}">
		$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'MGR_SIGN_NAME desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'MGR_SIGN_NAME asc'}">
			$(".sign_name_th").text("결재여부▲");
		</c:if>
		
		
		
		<!-- 상급자가 없을 경우 -->
		<c:if test = "${empty dailySearchDTO.order}">
			$(".sign_name_th").text("결재여부");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'sign_name desc'}">
			$(".sign_name_th").text("결재여부▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'sign_name asc'}">
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
				
				document.dailyListForm.submit();
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
				
				document.dailyListForm.submit();
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
				document.dailyListForm.submit();
			</c:if>
		}) 

		
		//-----------------------------------------------------

		<c:if test = "${empty dailySearchDTO.order}">
			$(".sign_date_th").text("결재 / 반려일");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'sign_date desc'}">
			$(".sign_date_th").text("결재 / 반려일▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'sign_date asc'}">
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
			
			document.dailyListForm.submit();
		})
		
		//-----------------------------------------------------

		<c:if test = "${empty dailySearchDTO.order}">
			$(".busi_date_th").text("업무날짜");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_date desc'}">
			$(".busi_date_th").text("업무날짜▼");
		</c:if>
	
		<c:if test = "${requestScope.dailySearchDTO.order == 'busi_date asc'}">
			$(".busi_date_th").text("업무날짜▲");
		</c:if>
	
		$(".busi_date_th").click(function(){

			var txt = $(this).text();
			if( txt == "업무날짜"){
				$(".order").val("busi_date desc");
			}
	
			else if( txt == "업무날짜▼"){
				$(".order").val("busi_date asc")
			}
	
			else if( txt == "업무날짜▲"){
				$(".order").val("");
			}
			
			document.dailyListForm.submit();
		})
		$('[name=rowCntPerPage]').change(function( ){
				search_when_pageNoClick( );
			});
			    
	   
		

	});

	function search(){
		var cnt = 0;
		if(isEmpty($("[name=begin_year]")) == false){cnt++}
		if(isEmpty($("[name=begin_month]")) == false){cnt++}
		if(isEmpty($("[name=end_year]")) == false){cnt++}
		if(isEmpty($("[name=end_month]")) == false){cnt++}
		if(isEmpty($("[name=busi_type_code]")) == false){cnt++}
		if(isEmpty($("[name=sign]")) == false){cnt++}
		if(isEmpty($("[name=busi_content]")) == false){cnt++}

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
		
		document.dailyListForm.submit();
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
		$("[name=busi_type_code]").val("");
		$("[name=sign]").val("");
		$("[name=busi_content]").val("");

		document.dailyListForm.submit();
	}

	function sendEmp_no(){
		document.sendEmp_no.submit();
	}

	function search_when_pageNoClick(){
		document.dailyListForm.submit();
	}

	function emptyDate(){
		$("[name=begin_year]").val("");
		$("[name=begin_month]").val("");
		$("[name=end_year]").val("");
		$("[name=end_month]").val("");
	   
	}


	function emptytype_code(){
		$("input:radio[name='busi_type_code']").prop('checked', false); 
	}

	function emptySign(){
		 $("input:radio[name='sign']").prop('checked', false); 
	}
	
	function emptyContent(){
		$("[name=busi_content]").val("");
	}

	function goDailyContent(report_no){
		$("[name=dailyContent] [name=selectPageNo]").val( 
			$("[name=dailyListForm] [name=selectPageNo]").val()
		);
	
		$("[name=dailyContent] [name=rowCntPerPage]").val( 
			$("[name=dailyListForm] [name=rowCntPerPage]").val( )
		);
		
		
		$("[name=dailyContent] [name=report_no]").val(report_no);
		

		document.dailyContent.submit();
	}

	function goDailyReg(){
		$("[name=dailyReg] [name=selectPageNo]").val( 
			$("[name=dailyListForm] [name=selectPageNo]").val( )
		);
	
		$("[name=dailyReg] [name=rowCntPerPage]").val( 
			$("[name=dailyListForm] [name=rowCntPerPage]").val( )
		);

		document.dailyReg.submit();
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


<form name="dailyListForm" method="post" action="${requestScope.croot}/dailyListForm.do">
	<input type="hidden" name="order" class="order">
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">일일업무 보고서</h4>
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
		               &nbsp;&nbsp;&nbsp;<span style="cursor: pointer" onClick="emptyDate()">[비움]</span>
					</div>
	            </td> 
			</tr>

			<tr>
				
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;">
					<div class="form-group" style="margin-bottom:0px;">
						<b>업무분야</b>
					</div>
				<td>
					<div class="form-group" style="margin-bottom:0px;">
						<div class="btn-group" data-toggle="buttons">
							<label>
								<input type="radio" name="busi_type_code" autocomplete="off" value="1">사무
							</label>
							&nbsp;&nbsp;&nbsp;
							<label>
								<input type="radio" name="busi_type_code" autocomplete="off" value="2">회계
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="busi_type_code" autocomplete="off" value="3">영업
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="busi_type_code" autocomplete="off" value="4">접대
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="busi_type_code" autocomplete="off" value="5">구매
							</label>
							&nbsp;&nbsp;&nbsp;
							<label >
								<input type="radio" name="busi_type_code" autocomplete="off" value="6">기타
							</label>		
							&nbsp;&nbsp;&nbsp;<span style="cursor: pointer" onClick="emptytype_code()">[비움]</span>
						</div>
					</div>
				</td>
			</tr>


			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>결제여부</b>
				<td>
					<div class="form-group" style="margin-bottom:0px;">
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
							&nbsp;&nbsp;&nbsp;<span style="cursor: pointer" onClick="emptySign()">[비움]</span>
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>업무내용</b>
				<td>
					<input type="text" name="busi_content" size="20" style="width: 100px; height: 30px;">
					&nbsp;&nbsp;&nbsp;<span style="cursor: pointer" onClick="emptyContent()">[비움]</span>
				</td>
			</tr>
		</table>
		<input type="button" value="   검색   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="search();">&nbsp;
		<input type="button" value="     모두검색     " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="searchAll();">&nbsp;
		<input type="reset" class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" value="   초기화   ">
		
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
		<div style="text-align: left"><input type="button" value="  일일업무보고서 등록  " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goDailyReg()"></div><br>
		<table>
			<tr>
				<td>
					
					
				</td>
			</tr>
		</table>
		
			
		<table class="boardTable table table-striped">
			<tr>
				<th style="text-align: center; vertical-align:middle;">일련번호</th>
				<th class="emp_name_th" name="emp_name_th" style="text-align: center; cursor:pointer; vertical-align:middle;">작성자</th>
				<th class="busi_type_name_th" name="busi_type_name_th" style="text-align: center; cursor:pointer; vertical-align:middle;">업무분야</th>
				<th class="busi_content_th" name="busi_content_th" style="text-align: center; cursor:pointer; vertical-align:middle;">업무내용</th>
				<th class="sign_name_th" name="sign_name_th" style="text-align: center; cursor:pointer; vertical-align:middle;">결재여부</th>
				<th class="sign_date_th" name="sign_date_th" style="text-align: center; cursor:pointer; vertical-align:middle;">결재 / 반려일</th>
				<th class="busi_date_th" name="busi_date_th" style="text-align: center; cursor:pointer; vertical-align:middle;">업무날짜</th>
			</tr>
			
			<c:forEach items="${getDailyList }" var="getDailyList" varStatus="loopTagStatus">
				<tr>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.RNUM}</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.EMP_NAME}</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.BUSI_TYPE_NAME }</td>
					<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.BUSI_CONTENT }</td>
					
					<!-- 상급자의 상급자가 존재 할 경우 -->
					<c:if test="${!empty getDailyList.MGR_MGR_SIGN_NAME && !empty getDailyList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.MGR_MGR_SIGN_NAME }</td>
					</c:if>
					
					<!-- 상급자의 상급자만 존재 할 경우 -->
					<c:if test="${empty getDailyList.MGR_MGR_SIGN_NAME && !empty getDailyList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.MGR_SIGN_NAME }</td>
					</c:if>
					<!-- 상급자가 없을 경우 -->
					<c:if test="${empty getDailyList.MGR_MGR_SIGN_NAME && empty getDailyList.MGR_SIGN_NAME}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.SIGN_NAME }</td>
					</c:if>
					
					
					<!--  -->
					<c:if test="${empty getDailyList.SIGN_DATE && getDailyList.SIGN_NAME == '진행 중'}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">결재 전</td>
					</c:if>
					
					<c:if test="${!empty getDailyList.SIGN_DATE }">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.SIGN_DATE}일 전</td>
					</c:if>
					
					<c:if test="${empty getDailyList.SIGN_DATE && getDailyList.SIGN_NAME == '반려'}">
						<td align=center style="cursor:pointer; vertical-align:middle;" onClick="goDailyContent(${getDailyList.REPORT_NO })">반려 된 보고서</td>
					</c:if>
					<!--  -->
					
					<td align=center style="cursor:pointer" onClick="goDailyContent(${getDailyList.REPORT_NO })">${getDailyList.BUSI_DATE }</td>
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


<form name="dailyContent" method="POST" action="${requestScope.croot}/dailyContentForm.do">
	<input type="hidden" name="report_no">
	<input type="hidden" name="selectPageNo">  
	<input type="hidden" name="rowCntPerPage">  
</form>

<form name="dailyReg" method="POST" action="${requestScope.croot}/dailyRegForm.do">
	<input type="hidden" name="selectPageNo">  
	<input type="hidden" name="rowCntPerPage">  
</form>



	
</body>
</html>