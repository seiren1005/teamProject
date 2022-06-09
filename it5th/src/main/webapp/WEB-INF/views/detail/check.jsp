<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
    <!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>


<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container calendar-container">
	<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	  $('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
        // 출석체크를 위한 버튼 생성
	    customButtons: { 
	        custom2: {
	          text: '출석체크하기',
	          id: 'check',
	          click: function() {	
		          }
	        }
	    },
       // 달력 정보 가져오기 
	    eventSources: [
	    	{
				// ajax 통신으로 달력 정보 가져오기 
                // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
                url: '/attendances',
				type: 'GET',
				dataType: "JSON",
				success: function (data) { },
				error: function() {
						alert('이벤트 가져오는데 실패해 부렸다.');},
				color: 'purple',   
			 	textColor: 'white' 
	    	}
	    ]
});
});
</script>
</body>
</html>