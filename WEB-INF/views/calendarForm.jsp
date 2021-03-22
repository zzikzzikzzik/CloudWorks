<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>일정관리</title>

<style>
	.style1 {background-color:#8C8C8C; color:#000000; border-color:#8C8C8C;}
	.style2 {background-color:#8C8C8C; color:#000000;}	
</style>
<script>
/*
//[일정 등록 화면] 또는 [일정 내용 화면] 에서 [뒤로가기] 버튼을 클릭 시 달력화면으로 이동
function goCalendarForm(){
	//alert(   $(".zzz").text()   );return;
	
	//$("[name=goCalendarForm] [name=className]").val("xxx");
	//$("[name=goCalendarForm] [name=printYear]").val();
	//$("[name=goCalendarForm] [name=printMonth]").val();
	//document.goCalendarForm.submint();
	
	location.replace("${croot}/calendarForm.do");
}
*/

//일의 자리 숫자 * 을 0*로 만드는 함수
function add_zero(num){
	var num = parseInt(num,10);
	if(num>=0 && num<10){
		num = "0" + num; 
	}
	return num;
}


$(document).ready(function(){
	// [달력화면]에서 [일정등록] 클릭하면 [일정등록화면] 띄우기
	$(".popup_window").click(function(){
		
		$(".fadeTo").remove();		

		var str_fadeTo = "<div class='fadeTo' style='position:absolute;z-index:4;top:0;left:0; width:100%; height:100%; background-color:gray;'></div>"
		$("body").append(str_fadeTo);

		var arr_popup_window = [];
		
		arr_popup_window.push("<div class=fadeIn style='position:absolute;z-index:5; width:250px; left:0; right:0; margin-left:auto; margin-right:auto; height:250px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; }'>");
		
		arr_popup_window.push("<table><tr><td>");

		arr_popup_window.push("<table border=1 style='background-color:gray; border:1px solid black'>");
		arr_popup_window.push("<tr height=30><td colspan='2' style='padding:10px' align='center'><font size='5'>일정 등록</font>");
		arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 분류</font>");
		arr_popup_window.push("<td style='padding:10px' align='center'><select name=schedule_code style='width:130px'>");
		arr_popup_window.push("<option value=1>출장");
		arr_popup_window.push("<option value=2>연차");
		arr_popup_window.push("<option value=3>회의");
		arr_popup_window.push("<option value=4>기타");
		arr_popup_window.push("</select>");		
		arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 내용</font>");
		arr_popup_window.push("<td style='padding:10px' align='center'><input type=text name=calendar_title style='width:130px'>");
		arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>시작 날짜</font>");
		arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_start_date>");
		arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>종료 날짜</font>");
		arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_end_date>");
		arr_popup_window.push("<tr height=20><td colspan='2' style='padding:10px' align='center'>");
		arr_popup_window.push("<input type=button onClick='regSchedule();' value='등록'>&nbsp;&nbsp;");
		arr_popup_window.push("<input type=button onClick='$(\".fadeIn\").remove();$(\".fadeTo\").remove();' value='뒤로가기'>");		
		arr_popup_window.push("</table>");
				
		arr_popup_window.push("</table></div>");
		
		
		$("body").append(arr_popup_window.join(""));		
		
		$(".fadeTo").fadeTo('fast',0.4, function(){
			$(".fadeIn").fadeIn(500);
		});		
	});
});

// [일정 등록 화면]에서 [등록] 클릭 시 비동기 방식으로 새로운 일정 등록
function regSchedule(){
	var schedule_code = $("[name=schedule_code]").val();
	var calendar_title = $("[name=calendar_title]").val();
	var calendar_start_date = $("[name=calendar_start_date]").val();
	var calendar_end_date = $("[name=calendar_end_date]").val();


	if(checkEmpty("[name=calendar_title]","일정 내용을 입력해주세요.")){return;}
	if(checkEmpty("[name=calendar_start_date]","시작 날짜를 선택해주세요.")){return;}
	if(checkEmpty("[name=calendar_end_date]","종료 날짜를 선택해주세요.")){return;}
	if(calendar_start_date > calendar_end_date){
		alert("시작 날짜와 종료 날짜가 맞지 않습니다.");
		$("[name=calendar_start_date]").val("");
		$("[name=calendar_end_date]").val("")
		return;
	}

	if(confirm("정말 등록하시겠습니까?")==false){return;}
	
	$.ajax({
		url : "${croot}/calendarRegProc.do"
		,type : "post"
		,data : "schedule_code=" + schedule_code + "&calendar_title=" + calendar_title + "&calendar_start_date=" + calendar_start_date + "&calendar_end_date=" + calendar_end_date
		,success : function(calendarRegCnt){
			if(calendarRegCnt==1){
				//alert("일정 등록 성공!");
				var arr_tmp = $(".zzz").text().split(" ");				 
				$(".fadeIn").remove();
				$(".fadeTo").remove();
				$(".xxx").empty();
				print_calender("xxx", arr_tmp[0].substring(0,4), arr_tmp[1].substring(0,arr_tmp[1].indexOf("월")) )				
			}
			else if(calendarRegCnt==-1){
				alert("서버쪽 예외 발생");
			}
			else{
				alert("일정 등록 실패!");
			}
		}
		,error : function(){
			alert("서버 접속 실패");
		}
	});	
}

// [일정 목록 화면]에서 [각 행의 일정]을 클릭 시 [일정 수정/삭제 화면] 띄우기
function getUpdelList(rnum, calendar_date){
	$.ajax({
		url : "${croot}/updelListProc.do"
		,type : "post"
		,data : "rnum=" + rnum + "&calendar_start_date=" + calendar_date + "&calendar_end_date=" + calendar_date
		,success : function(updelList){
			var arr_popup_window = [];
			
			arr_popup_window.push("<div class=fadeIn2 style='position:absolute;z-index:5; width:250px; left:0; right:0; margin-left:auto; margin-right:auto; height:250px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; }'>");
			arr_popup_window.push("<table><tr><td>");
			
			arr_popup_window.push("<table border=1 style='background-color:gray; border:1px solid black'>");
			arr_popup_window.push("<tr height=30><td colspan='2' style='padding:10px' align='center'><font size='5'>일정 수정/삭제</font>");
			for(var i=0 ; i<updelList.length ; i++){
				if((i+1) == rnum){
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 분류</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><select name=schedule_code style='width:130px'>");					
					if(updelList[i].schedule_code == "1"){
						arr_popup_window.push("<option value=1 selected>출장");
						arr_popup_window.push("<option value=2>연차");
						arr_popup_window.push("<option value=3>회의");
						arr_popup_window.push("<option value=4>기타");
					}
					else if(updelList[i].schedule_code == "2"){
						arr_popup_window.push("<option value=1>출장");
						arr_popup_window.push("<option value=2 selected>연차");
						arr_popup_window.push("<option value=3>회의");
						arr_popup_window.push("<option value=4>기타");
					}
					else if(updelList[i].schedule_code == "3"){
						arr_popup_window.push("<option value=1>출장");
						arr_popup_window.push("<option value=2>연차");
						arr_popup_window.push("<option value=3 selected>회의");
						arr_popup_window.push("<option value=4>기타");
					}
					else{
						arr_popup_window.push("<option value=1>출장");
						arr_popup_window.push("<option value=2>연차");
						arr_popup_window.push("<option value=3>회의");
						arr_popup_window.push("<option value=4 selected>기타");
					}								
					arr_popup_window.push("</select>");		
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 내용</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=text name=calendar_title style='width:130px' value=\'"+updelList[i].calendar_title+"\'>");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>시작 날짜</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_start_date value=" + updelList[i].calendar_start_date + ">");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>종료 날짜</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_end_date value="+updelList[i].calendar_end_date+">");
					arr_popup_window.push("<input type=hidden name=calendar_no value="+updelList[i].calendar_no+">");
				}
			}			
			arr_popup_window.push("<tr height=20><td colspan='2' style='padding:10px' align='center'>");
			arr_popup_window.push("<input type=button class='update_btn' onClick='updelSchedule("+ 0 + ");' value='수정'>&nbsp;&nbsp;");
			arr_popup_window.push("<input type=button class='delete_btn' onClick='updelSchedule("+ 1 + ");' value='삭제'>&nbsp;&nbsp;");
			arr_popup_window.push("<input type=button onClick='$(\".fadeIn2\").remove();$(\".fadeIn\").show();' value='뒤로가기'>");			
			arr_popup_window.push("</table>");					
			
			arr_popup_window.push("</table></div>");
			
			$("body").append(arr_popup_window.join(""));
			
			$(".fadeIn").hide();		
			$(".fadeIn2").fadeIn(500);	
		}
		,error : function(){
			alert("서버 접속 실패");
		}
	});	
}

// [일정 수정/삭제 화면]에서 [수정] 또는 [삭제] 버튼을 클릭하면 일정을 수정 또는 삭제
function updelSchedule(num){
	var str = "";
	str = "calendar_no="+$('[name=calendar_no]').val()+"&schedule_code="+$('[name=schedule_code]').val()+"&calendar_title="+$('[name=calendar_title]').val()+"&calendar_start_date="+$('[name=calendar_start_date]').val()+"&calendar_end_date="+$('[name=calendar_end_date]').val();

	if(num == 0){
		$.ajax({
			url : "${croot}/calendarUpdateProc.do"
			,type : "post"
			,data : str
			,success : function(calendarUpdateCnt){
				if(calendarUpdateCnt==1){
					//alert("일정 수정 성공!");
					var arr_tmp = $(".zzz").text().split(" ");				 
					$(".fadeIn").remove();			 
					$(".fadeIn2").remove();
					$(".fadeTo").remove();
					$(".xxx").empty();
					print_calender("xxx", arr_tmp[0].substring(0,4), arr_tmp[1].substring(0,arr_tmp[1].indexOf("월")) )	
				}
				else if(calendarUpdateCnt==-1){
					alert("서버쪽 예외 발생");
				}
				else{
					alert("일정 수정 실패!");
				}
			}
			,error : function(){
				alert("서버 접속 실패");
			}
		});		
	}
	else if(num == 1){
		$.ajax({
			url : "${croot}/calendarDeleteProc.do"
			,type : "post"
			,data : str
			,success : function(calendarDeleteCnt){
				if(calendarDeleteCnt==1){
					//alert("일정 삭제 성공!");
					var arr_tmp = $(".zzz").text().split(" ");				 
					$(".fadeIn").remove();	 
					$(".fadeIn2").remove();
					$(".fadeTo").remove();
					$(".xxx").empty();
					print_calender("xxx", arr_tmp[0].substring(0,4), arr_tmp[1].substring(0,arr_tmp[1].indexOf("월")) )	
				}
				else if(calendarUpdateCnt==-1){
					alert("서버쪽 예외 발생");
				}
				else{
					alert("일정 삭제 실패!");
				}
			}
			,error : function(){
				alert("서버 접속 실패");
			}
		});			
	}
}


// /calendarForm.do 로 접속 시 [달력 화면] 출력
function print_calender( idV, year, month ){
	//$("."+idV).empty();
	
	//------------------------------------------------------------------------------------------------------------------------
	//var day = "";
	if( year==undefined && month==undefined ) { 
		var today = new Date();
		year = today.getFullYear();
		month = today.getMonth()+1;
		//day = today.getDate(); 
	}
	else{
		year = parseInt( year,10 );
		month = parseInt( month,10 );
	}
	
	var pastMonth_lastDay = new Date( year, month-1, 0 ).getDate( );
	var thisMonth_lastDay = new Date( year, month, 0 ).getDate( );
	var thisMonth_firstDay_week_no = new Date( year, month-1, 1 ).getDay( );
	var pastMonth_startDay = pastMonth_lastDay-thisMonth_firstDay_week_no+1;

	var thBgColor_everyday = "#E8E8E8";
	//var thBgColor_sunday = "#FFB3C1";
	var thBgColor_today = "#A6D2FF";

	var th_idx = 0;			// th 태그의 출력 개수가 저장
	var thisMonthDay = 1;	// 출력되는 이번달 날짜가 저장
	var nextMonthDay = 1; 	// 출력되는 다음달 날짜가 저장
	var bgColor = thBgColor_everyday;

	var tbcss = " style='border-collapse:collapse;' "; 
	tbcss = "";

	
	//------------------------------------------------------------------------------------------------------------------------
	var arr = [];		

	arr.push( "<table "+tbcss+" cellpadding=3 cellsapcing=0 class='calender' border=1 align=center width=100%>" );	
	arr.push( "<thead><tr bgcolor="+thBgColor_everyday+"><td align='center'><b>일</b><td align='center'><b>월</b><td align='center'><b>화</b><td align='center'><b>수</b><td align='center'><b>목</b><td align='center'><b>금</b><td align='center'><b>토</b></thead>" );
	arr.push( "<tbody>" );
	
	for( var i=0; i<=6 ; i++ ){
		arr.push( "<tr>" );
		for( var ii=0; ii<=6 ; ii++ ){
			//if( ii%7==0 ){ bgColor=thBgColor_sunday; } else if( ii%6==0 ){ bgColor=thBgColor_saturday; } else{ bgColor=thBgColor_weekday; }
			arr.push( "<td bgcolor="+bgColor+" align='center' width=150>" );

			arr.push("<table class=table_date border=2 bordercolor="+thBgColor_everyday+" width=100%>");
			arr.push("<tr><td class='dayNum' align='right'>");

			// 만약에 이번달 1일 이전이라면
			if( th_idx<thisMonth_firstDay_week_no ) {
				arr.push( "<span class=last"+pastMonth_startDay+"><font size='2' color='#686868'>"+(pastMonth_startDay)+"</font></span>" );

				arr.push("<tr><td class=pastMonthDate"+pastMonth_startDay+"_1>&nbsp;");
				arr.push("<tr><td class=pastMonthDate"+pastMonth_startDay+"_2>&nbsp;");
				arr.push("<tr><td class=pastMonthDate"+pastMonth_startDay+"_3>&nbsp;");
				arr.push("<tr><td class=pastMonthDate"+pastMonth_startDay++ +"_4>&nbsp;");
			}
			// 만약에 이번달 마지막 날짜 이후이라면
			else if( thisMonthDay>thisMonth_lastDay ) {
				arr.push( "<span class=next"+nextMonthDay+"><font size='2' color='#686868'>"+(nextMonthDay)+"</font></span>" );

				arr.push("<tr><td class=nextMonthDate"+nextMonthDay+"_1>&nbsp;");
				arr.push("<tr><td class=nextMonthDate"+nextMonthDay+"_2>&nbsp;");
				arr.push("<tr><td class=nextMonthDate"+nextMonthDay+"_3>&nbsp;");
				arr.push("<tr><td class=nextMonthDate"+nextMonthDay++ +"_4>&nbsp;");
			}
			// 만약에 이번달 1일 부터 이번달 마지막 날짜 사이라면
			else if( th_idx>=thisMonth_firstDay_week_no && thisMonthDay<=thisMonth_lastDay ) {
				arr.push( "<span class=date"+thisMonthDay+"><font size='2'><b>" + thisMonthDay + "</b></font></span>");

				arr.push("<tr><td class=date"+thisMonthDay+"_1>&nbsp;");
				arr.push("<tr><td class=date"+thisMonthDay+"_2>&nbsp;");
				arr.push("<tr><td class=date"+thisMonthDay+"_3>&nbsp;");
				arr.push("<tr><td class=date"+thisMonthDay++ +"_4>&nbsp;");
			}
			th_idx++;

			arr.push("</table>");			
		}
		if( thisMonthDay>thisMonth_lastDay ) break;
	}

	arr.push( "</table>" );

	
	//-------------------------------------------------------------------------------------------------------------------
	var arr2 = [];

	var code1 = " style='cursor:hand;' onclick=\"print_calender('?1',?2, ?3 );\" ";
		code1 = code1.replace( "?1", idV ).replace( "?2", (month>1?year:year-1) ).replace( "?3", (month>1?month-1:12) );
	var code2 = " style='cursor:hand;' onclick=\"print_calender('?1',?2, ?3 );\" ";
		code2 = code2.replace( "?1", idV ).replace( "?2", (month<12?year:year+1) ).replace( "?3", (month<12?month+1:1) );
	var code3 = " style='cursor:hand;' onclick=\"print_calender('xxx');\" ";
		
	/*var code1 = " style='cursor:hand;' onclick=\"print_calender( "+
				"'"+idV+"',"+(month>1?year:year-1)+", "+(month>1?month-1:12)+" );\" ";
	var code2 = " style='cursor:hand;' onclick=\"print_calender( "+
				"'"+idV+"',"+(month<12?year:year+1)+", "+(month<12?month+1:1)+" );\" ";*/
				
	arr2.push("<span "+code1+">&nbsp;&lt;&nbsp;</span><span "+code2+">&nbsp;&gt;&nbsp;</span>" );
	arr2.push("<span "+code3+">&nbsp;오늘&nbsp;</span>");

	
	//-------------------------------------------------------------------------------------------------------------------
	var arr3 = [];
	arr3.push("<font size=4>" + year + "년 " + month + "월</font>");


	//-------------------------------------------------------------------------------------------------------------------
	$("."+idV).html( arr.join("") );
	$(".yyy").html( arr2.join("") );
	$(".zzz").html( arr3.join("") );

	
	//-------------------------------------------------------------------------------------------------------------------
	//-------------------------------------------------------------------------------------------------------------------
		
	
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();

	//-------------------------------------------------------------------------------------------------------------------
	if($(".zzz").text() == year+"년 "+month+"월"){
		$(".date"+day).parent().parent().css('background-color','aquamarine');
		//$(".date"+day).parent().parent().nextAll().css('background-color','lightblue');
		//$(".date"+day).parent().parent().parent().css('border-color','lightblue');
	}

	var obj = $(".table_date");

	obj.hover(
		function(){
			$(this).addClass("style1");
		}
		,function(){
			$(this).removeClass("style1");
		}
	);


	//-------------------------------------------------------------------------------------------------------------------
	// [달력화면]에 [일정] 출력
	$.ajax({
		url : "${croot}/calendarProc.do"
		, type : "post"
		, data : "aa"
		, success : function(scheduleList){	
			var schedule_code = "";
			var schedule_title = ""; 
				
			var schedule_start_year = "";
			var schedule_start_month = "";
			var schedule_start_day = "";

			var schedule_end_year = "";
			var schedule_end_month = "";
			var schedule_end_day = "";

			
			for(var i=0 ; i<scheduleList.length ; i++){
				schedule_code = scheduleList[i].schedule_code;
				schedule_title = scheduleList[i].calendar_title;			
				
				schedule_start_year = scheduleList[i].calendar_start_date.substr(0,4);
				schedule_start_month = scheduleList[i].calendar_start_date.substr(5,2);
				schedule_start_day = scheduleList[i].calendar_start_date.substr(8,2);
				
				if(schedule_start_month.substr(0,1)=="0"){
					schedule_start_month = schedule_start_month.substr(1,1);
				}
				if(schedule_start_day.substr(0,1)=="0"){
					schedule_start_day = schedule_start_day.substr(1,1);
				}
								
				schedule_end_year = scheduleList[i].calendar_end_date.substr(0,4);
				schedule_end_month = scheduleList[i].calendar_end_date.substr(5,2);
				schedule_end_day = scheduleList[i].calendar_end_date.substr(8,2);

				if(schedule_end_month.substr(0,1)=="0"){
					schedule_end_month = schedule_end_month.substr(1,1);
				}
				if(schedule_end_day.substr(0,1)=="0"){
					schedule_end_day = schedule_end_day.substr(1,1);
				}				
				//-----------------------------------------------------------------------	
				
				var searchYear = $(".zzz").text().substr(0,4);
				var searchMonth = $(".zzz").text().substring(6,   $(".zzz").text().indexOf("월")    );
				
				if(
						searchYear + "" + add_zero(searchMonth) == schedule_start_year + "" + add_zero(schedule_start_month)
						&& searchYear + "" + add_zero(searchMonth) == schedule_end_year + "" + add_zero(schedule_end_month)
						/*
						$(".zzz").text() == schedule_start_year+"년 "+schedule_start_month+"월"
						&& $(".zzz").text() == schedule_end_year+"년 "+schedule_end_month+"월"
						*/
				){
					var schedule_start_day_int = parseInt(schedule_start_day,10);	
					var schedule_end_day_int = parseInt(schedule_end_day,10);

					$(".date"+schedule_start_day_int+"_"+schedule_code).text(schedule_title);
					//$(".date"+schedule_start_day_int+"_"+schedule_code).text(schedule_title + " ~" + schedule_end_year.substr(2,2) + "." + schedule_end_month + "." + schedule_end_day);
					
					for(var j=schedule_start_day_int ; j<=schedule_end_day_int ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}					
				}
				else if(
						searchYear + "" + add_zero(searchMonth) == schedule_start_year + "" + add_zero(schedule_start_month)
						&& searchYear + "" + add_zero(searchMonth) < schedule_end_year + "" + add_zero(schedule_end_month)
						/*
						$(".zzz").text() == schedule_start_year+"년 "+schedule_start_month+"월"
						&& $(".zzz").text() < schedule_end_year+"년 "+schedule_end_month+"월"
						*/
				){
					var schedule_start_day_int = parseInt(schedule_start_day,10);	
					var schedule_end_day_int = parseInt(schedule_end_day,10);

					$(".date"+schedule_start_day_int+"_"+schedule_code).text(schedule_title + " ~" + schedule_end_year.substr(2,2) + "." + schedule_end_month + "." + schedule_end_day);
					
					for(var j=schedule_start_day_int ; j<=thisMonth_lastDay ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}	

					for(var j=1 ; j<=schedule_end_day_int ; j++){
						if(schedule_code == "1"){
							$(".nextMonthdate"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".nextMonthdate"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".nextMonthdate"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".nextMonthdate"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}					
				}
				else if(
						searchYear + "" + add_zero(searchMonth) > schedule_start_year + "" + add_zero(schedule_start_month)
						&& searchYear + "" + add_zero(searchMonth) == schedule_end_year + "" + add_zero(schedule_end_month)
						/*
						$(".zzz").text() > schedule_start_year+"년 "+schedule_start_month+"월"
						&& $(".zzz").text() == schedule_end_year+"년 "+schedule_end_month+"월"
						*/
				){
					var schedule_start_day_int = parseInt(schedule_start_day,10);	
					var schedule_end_day_int = parseInt(schedule_end_day,10);
					/*
					var pastMonth_lastDay = new Date( year, month-1, 0 ).getDate( );
					var thisMonth_lastDay = new Date( year, month, 0 ).getDate( );
					var thisMonth_firstDay_week_no = new Date( year, month-1, 1 ).getDay( );
					var pastMonth_startDay = pastMonth_lastDay-thisMonth_firstDay_week_no+1;
					
					if(schedule_start_day_int < pastMonth_startDay){
						$(".pastMonthdate"+pastMonth_startDay+"_"+schedule_code).text(schedule_title + " " + schedule_start_year.substr(2,2) + "." + schedule_start_month + "." + schedule_start_day + "~");
					}
					else {
						$(".pastMonthdate"+schedule_start_day_int+"_"+schedule_code).text(schedule_title + " " + schedule_start_year.substr(2,2) + "." + schedule_start_month + "." + schedule_start_day + "~");
					}
					*/
					$(".pastMonthdate"+schedule_start_day_int+"_"+schedule_code).text(schedule_title + " " + schedule_start_year.substr(2,2) + "." + schedule_start_month + "." + schedule_start_day + "~");
					
					for(var j=schedule_start_day_int ; j<=pastMonth_lastDay ; j++){
						if(schedule_code == "1"){
							$(".pastMonthdate"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".pastMonthdate"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".pastMonthdate"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".pastMonthdate"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}	

					for(var j=1 ; j<=schedule_end_day_int ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}					
				}	
				/*
				else if(
						$(".zzz").text() > schedule_start_year+"년 "+schedule_start_month+"월"
						&& $(".zzz").text() < schedule_end_year+"년 "+schedule_end_month+"월"
				){
					var schedule_start_day_int = parseInt(schedule_start_day,10);	
					var schedule_end_day_int = parseInt(schedule_end_day,10);

					$(".pastMonthdate"+pastMonth_startDay+"_"+schedule_code).text(schedule_title + schedule_start_year.substr(2,2) + "." + schedule_start_month + "." + schedule_start_day + "~" + schedule_end_year.substr(2,2) + "." + schedule_end_month + "." + schedule_end_day);

					for(var j=pastMonth_startDay ; j<=pastMonth_lastDay ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}		
					
					for(var j=1 ; j<=thisMonth_lastDay ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}			

					for(var j=1 ; j<=schedule_end_day_int ; j++){
						if(schedule_code == "1"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightpink','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "2"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'gold','color':'black','font-size':'5','height':'20'});
						}
						else if(schedule_code == "3"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightblue','black':'blue','font-size':'5','height':'20'});
						}
						else if(schedule_code == "4"){
							$(".date"+j+"_"+schedule_code).css({'background-color':'lightgreen','black':'blue','font-size':'5','height':'20'});
						}
					}			
				}		
				*/
			}
		}
		, error : function(){
			alert("${croot}/calendarProc.do 접속 시 서버 응답 실패! 관리자에게 문의 바랍니다.")
		}
	});

	// [달력 화면]에서 날짜를 클릭 시  
	$(".table_date").click(function(){
		var searchYear = $(".zzz").text().substr(0,4);
		var searchMonth = $(".zzz").text().substring(6,   $(".zzz").text().indexOf("월")    );
		searchYear = parseInt(searchYear,10);
		searchMonth = parseInt(searchMonth,10);  
		
		var searchLastMonth = 0;		
		var searchNextMonth = 0;

		if(searchMonth==1){
			searchLastMonth = 12;
			searchNextMonth = searchMonth + 1;
			//searchYear = searchYear - 1;
		}
		else if(searchMonth==12){
			searchLastMonth = searchMonth - 1;
			searchNextMonth = 1;
			//searchYear = searchYear + 1;
		}
		else{
			searchLastMonth = searchMonth - 1;
			searchNextMonth = searchMonth + 1;
		}
		
		var searchDay = $(this).find(".dayNum").text();
		
		var searchMonthZero = add_zero(searchMonth);
		var searchLastMonthZero = add_zero(searchLastMonth);
		var searchNextMonthZero = add_zero(searchNextMonth);
		var searchDayZero = add_zero(searchDay);

		var calendar_date = "";
		

		if( $(this).find("[class^=last]").text().length != 0){
			if(searchMonth==1){
				calendar_date = (searchYear-1) + "-" + searchLastMonthZero + "-" + searchDayZero;
			}
			else{
				calendar_date = (searchYear) + "-" + searchLastMonthZero + "-" + searchDayZero;
			}
		}
		else if( $(this).find("[class^=next]").text().length != 0 ){
			if(searchMonth==12){
				calendar_date = (searchYear+1) + "-" + searchNextMonthZero + "-" + searchDayZero;
			}
			else{
				calendar_date = (searchYear) + "-" + searchNextMonthZero + "-" + searchDayZero;
			}
		}
		else{
			calendar_date = searchYear + "-" + searchMonthZero + "-" + searchDayZero;
		}
		
		
		$.ajax({
			url : "${croot}/calendarListProc.do"
			,type : "post"
			,data : "calendar_start_date=" + calendar_date + "&calendar_end_date=" + calendar_date
			,success : function(calendarList){
				// 클릭한 날짜에 일정이 있으면 [일정 목록 화면] 띄우기
				if(calendarList.length != 0 ){	
					$(".fadeTo").remove();		
	
					var str_fadeTo = "<div class='fadeTo' style='position:absolute;z-index:4;top:0;left:0; width:100%; height:100%; background-color:gray;'></div>"
					$("body").append(str_fadeTo);
	
					var arr_popup_window = [];
					arr_popup_window.push("<div class=fadeIn style='position:absolute;z-index:5; width:600px; left:200; right:0; margin-left:auto; margin-right:auto; height:400px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; }'>");
					arr_popup_window.push("<table><tr><td>");
									
					arr_popup_window.push("<table border=1 style='background-color:gray; border:1px solid black'>");
					arr_popup_window.push("<tr height=30><td colspan='5' style='padding:10px' align='center'>");
					arr_popup_window.push("<font size='2'>"+calendarList[0].emp_name+"님의 "+calendar_date+" 일정</font>");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'>번호<td style='padding:10px' align='center'>일정내용<td style='padding:10px' align='center'>시작 날짜<td style='padding:10px' align='center'>종료 날짜");					
					for(var i=0 ; i<calendarList.length ; i++){
						arr_popup_window.push("<tr onClick='getUpdelList("+ (i+1) + ",\"" + calendar_date +"\");' align='center' style='cursor:pointer;'>");
						arr_popup_window.push("<td style='padding:10px'>"+(i+1)+"<td style='padding:10px'>"+calendarList[i].calendar_title+"<td style='padding:10px'><input type='date' value="+calendarList[i].calendar_start_date+"><td style='padding:10px'><input type='date' value="+calendarList[i].calendar_end_date+">");
					}						
					arr_popup_window.push("<tr height=20><td colspan='5' style='padding:10px' align='center'>");
					arr_popup_window.push("<input type=button onClick='$(\".fadeIn\").remove();$(\".fadeTo\").remove();' value='뒤로가기'>");	
					arr_popup_window.push("</table>");
					
					arr_popup_window.push("</table></div>");	
					
					$("body").append(arr_popup_window.join(""));
					
					$(".fadeTo").fadeTo('fast',0.4, function(){
						$(".fadeIn").fadeIn(500);					
					});
				}				
				// 클릭한 날짜에 일정이 없으면 [일정등록화면] 띄우기
				else{
					$(".fadeTo").remove();		

					var str_fadeTo = "<div class='fadeTo' style='position:absolute;z-index:4;top:0;left:0; width:100%; height:100%; background-color:gray;'></div>"
					$("body").append(str_fadeTo);

					var arr_popup_window = [];
					
					arr_popup_window.push("<div class=fadeIn style='position:absolute;z-index:5; width:250px; left:0; right:0; margin-left:auto; margin-right:auto; height:250px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; }'>");
					arr_popup_window.push("<table><tr><td>");

					arr_popup_window.push("<table border=1 style='background-color:gray; border:1px solid black'>");
					arr_popup_window.push("<tr height=30><td colspan='2' style='padding:10px' align='center'><font size='5'>일정 등록</font>");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 분류</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><select name=schedule_code style='width:130px'>");
					arr_popup_window.push("<option value=1>출장");
					arr_popup_window.push("<option value=2>연차");
					arr_popup_window.push("<option value=3>회의");
					arr_popup_window.push("<option value=4>기타");
					arr_popup_window.push("</select>");		
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>일정 내용</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=text name=calendar_title style='width:130px'>");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>시작 날짜</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_start_date value=" + calendar_date + ">");
					arr_popup_window.push("<tr height=20><td style='padding:10px' align='center'><font size='2'>종료 날짜</font>");
					arr_popup_window.push("<td style='padding:10px' align='center'><input type=date name=calendar_end_date>");
					arr_popup_window.push("<tr height=20><td colspan='2' style='padding:10px' align='center'>");
					arr_popup_window.push("<input type=button onClick='regSchedule();' value='등록'>&nbsp;&nbsp;");
					arr_popup_window.push("<input type=button onClick='$(\".fadeIn\").remove();$(\".fadeTo\").remove();' value='뒤로가기'>");		
					arr_popup_window.push("</table>");
							
					arr_popup_window.push("</table></div>");
					
					$("body").append(arr_popup_window.join(""));		
					
					$(".fadeTo").fadeTo('fast',0.4, function(){
						$(".fadeIn").fadeIn(500);
					});		
				}							
			}
			,error : function(){
				alert("서버 접속 실패");
			}
		});

		
	});
/*
	$(".date1_1").text("date1_1");
	$(".pastMonthDate31_1").text("pastMonthDate31_1");
	$(".nextMonthDate1_1").text("nextMonthDate1_1");
*/	
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
			<li role="presentation"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/expenseListForm.do" >지출보고서</a></li>
			<li role="presentation"  class="active"><a href="${requestScope.croot}/calendarForm.do" >일정관리</a></li>
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

<!-- -------------------------<span style="cursor:pointer" class="listSchedule">&nbsp;일정목록&nbsp;</span>---------------- -->
<div class="container">
	<div class="jumbotron" style="margin-bottom:70px;">
		<form name="calendarForm">
			<table border="0" width="100%">
				<tr cellpadding=10>
					<td colspan=4 style="font-size:30px;">일정관리
				<tr align=center cellpadding=10>
					<td class="yyy" align=left style="font-size:14px;">
					<td class="zzz" width="60%">
					<td align=right style="font-size:15px;"><span style="cursor:pointer" class="popup_window">&nbsp;일정등록&nbsp;</span>
				<tr>
					<td colspan=4>
						<table width=100%>
							<tr>
								<td class="xxx">
									<script>
										print_calender( "xxx" );
									</script>
						</table>
			</table>
		</form>
	</div>
</div>

<form name="goCalendarForm" method="POST" action="${requestScope.croot}/calendarForm.do">
	<input type="hidden" name="className">
	<input type="hidden" name="printYear">  
	<input type="hidden" name="printMonth">
</form>

</body>
</html>