<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>ajax테트스하기</h1>
	<button onclick="getData()">데이터 가져오기</button>
	<button onclick="getData2()">데이터 가져오기2</button>
	<!-- 데이터를 출력해 줄 영역을 설정해줘야함 -->
	<div id="area">
		변경되기 전 데이터
	</div>
	
	<h2>메뉴 선택</h2>
	<style>
		div#container>ul{
			display: flex;
			justify-content: space-between;
			list-style: none;
		}
		ul>li>a{
			font-size: 20px;
			font-weight: bolder;
			text-decoration: none;
		}
		div#datacontent{
			display: flex;
			justify-content: center;
		}
		div#content{
			width: 70%;
			height: 500px;
		}
	</style>
	<div id="container">
		<ul>
			<li><a href="javascript:fn_ajax('board')">게시판</a></li>
			<li><a href="javascript:fn_ajax('gallary')">갤러리</a></li>
			<li><a href="javascript:fn_ajax('movie')">동영상</a></li>
		</ul>
	</div>
	<div id="datacontent">
		<div id="content">
		
		</div>
	</div>
	
	<script>
		const getData=()=>{
			// location.assign("${pageContext.request.contextPath}/ajax/test");
			// javascript방식으로 AJAX요청을 하려면 XMLHttpRequest객체를 이용해서 요청을 보낸다.
			
			// 객체를 먼저 생성한다
			const xhr = new XMLHttpRequest();
			
			/* 이 객체에 필요한 데이터(설정)를 넣어줘야함.*/
			// 요청 메소드방식과 주소를 설정 : xhr.open("방식", "주소")
			xhr.open("get", "${pageContext.request.contextPath}/ajax/test"); // 요청할 주소를 찍어주는 함수 -> 요청을 할 때는 메소드(GET || POST)와 주소를 정해준다 : http 통신 규약
			// 요청에 대한 응답이 완료 됐는지 확인 : xhr.onreadystatechange()
			xhr.onreadystatechange=()=>{   // 필요한거 가져왔으면 가져왔다고 말해야하고, 가지러갈 준비가 끝났을때 준비끝났다고 알려줘야하니까. 요청을 보내서 응답이 오면 실행되는 함수
				console.log("stateChange");
				if(xhr.readyState == 4) {
					if(xhr.status == 200) { // status : 응답코드
						console.log(xhr.responseText); // 서블릿에서 write로 적어준 내용을 responseText에 담아온다  ///// 물 떠오라고 시켰을때 얘가 컵이야. 안에 물이 들어있어
						document.querySelector("#area").innerHTML = xhr.responseText;
					}
				}
			}
			xhr.send(); // 물떠오라고 출발시키는 역할
		}
		
		
		// jquery로 ajax하기!!
		const getData2=()=>{
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/test", // xhr.open("get", "${pageContext.request.contextPath}/ajax/test"); 의 주소 부분 이라고 생각하면 편함. 내부적으로는 완벽히 같은것은 아님
				type: "get", // xhr.open("get", "${pageContext.request.contextPath}/ajax/test"); 의 method방식 부분 이라고 생각하면 편함. 내부적으로는 완벽히 같은것은 아님
				success:(data)=>{ // date는 responseText라고 보면 된다.
					console.log(data);
					$("#area").html(data);
				},
				error:(e)=>{
					console.log(e);
				}
			})
		}
		
		// => getData2()를 내부적으로 풀면
		const bsjax=(request)=>{
			const xhr = new XMLHttpRequest();
			xhr.open(request["type"], request["url"]);
			xhr.onreadysatechange=()=>{
				if(xhr.readyStatus == 4) {
					if(xhr.status == 200) {
						request["success"](xhr.responseText);
					}else {
						request["error"](xhr.responseText);
					}
				}
			}
			xhr.send();
		}
		
		const fn_ajax=(title)=>{
			$.ajax({
				url: "${pageContext.request.contextPath}/content.do",
				data: {"title":title},
				success:(data)=>{
					switch(title){
						case "board" : boardPrint(data); break;
						case "gallary" : gallaryPrint(data); break;
						case "movie" : moviePrint(data); break;
					}
					/* $("div#content").html(data); */	
				}
			});
		}
		
		const boardPrint=(data)=>{
			const table = $("<table>").addClass("table"); // 이거는 부트스트랩 그거 script 주소 가져와서 해야하는데 귀찮아서 안해서 적용 안됩니다 ㅎ 머쓱~
			const header = $("<tr>");
			const headerContent = "<th>제목</th><th>내용</th><th>작성자</th>"
			header.html(headerContent);
			table.append(header);
			data.forEach((v, i)=>{
				console.log(v);
				let tr = $("<tr>");
				let title = $("<td>").html(v["title"]);
				let content = $("<td>").html(v["content"]);
				let writer = $("<td>").html(v["writer"]);
				tr.append(title).append(content).append(writer);
				table.append(tr);
			});
			$("#content").append(table);
		}
		const gallaryPrint=(data)=>{
			data.forEach((v, i)=>{
				console.log(v);
			});
		}
		
	</script>
	
</body>
</html>





















