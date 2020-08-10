<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.rvboardDAO"%>
<%@page import="board.rvboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="../css/login.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/reviewboard.css" rel="stylesheet" type="text/css">



</head>
<body>


	<!-- 헤더 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>REVIEW</h1>
				</div>
			</div>
			<div class="body">
			</div>
	<!-- 게시판 영역 -->		
			
  <script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	//추가2. 처음으로 링크 클릭했을때 호출 되는 함수 
	function fnList() {
		
		document.list.action = "rv_main.jsp";
		document.list.submit();
		
	}
	
	//추가6. 현재 글리스트 정보중.. 글제목을 클릭 했을떄.. 글번호를 넘겨받아..
	//      form의 input의 value값을 설정
	//      설정후 form 전송
	function fnRead(num) {
		document.read.num.value = num;
		document.read.submit();
	}
	
	
	
</script>
  


  
  
<%

String id = (String)session.getAttribute("id");

rvboardDAO boardDAO = new rvboardDAO();

String keyWord = "", keyField = "";

int totalRecord = 0;
int numPerPage = 5;
int pagePerBlock = 3; 

int totalPage = 0; 
int totalBlock = 0;
int nowPage = 0;
int nowBlock = 0; 
int beginPerPage = 0; 

request.setCharacterEncoding("UTF-8");

//만약 검색어가 입력되었다면~~
if(request.getParameter("keyWord") != null ){
	//검색기준값 받아와 변수에 저장
	keyField = request.getParameter("keyField");
	//검색어 받아와 변수에 저장
	keyWord = request.getParameter("keyWord");
	
}

if(request.getParameter("reload")!=null){
	//만약에 List.jsp페이지로 다시 요청 받은 값이 true와 같을때..
	if(request.getParameter("reload").equals("true")){
		keyWord = "";
	}
}


Vector v = boardDAO.getBoardList(keyField, keyWord);

totalRecord =v.size();


totalPage =  (int)Math.ceil((double)totalRecord / numPerPage); 
 
totalBlock =  (int)Math.ceil((double)totalPage / pagePerBlock); 



if(request.getParameter("nowPage") != null){
	//1  2  3  4 5 번호 중에서.. 선택한 페이지번호를 얻어 온다
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
}

//[8] 현재 보여질 페이지번호가 속해 있는 블럭번호 구하기 ( < 1 2 3 4 5 > >를 누른게 몇번 쨰 블럭인지 구하기  )
//만약에  >를 클릭하여 넘어온 블럭 번호가 존재 할때만?
if(request.getParameter("nowBlock") != null){
	// >를 클릭한 블럭번호 전달 받아 오기
	nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
}

//[10] 각페이지 마다 맨위쪾에 첫번째로 보여질 시작 글번호 구하기
// 공식             = 현재 보여질 페이지 번호 * 한페이지당 보여질 글의 개수 
beginPerPage = nowPage * numPerPage;

%>
     
    <div class="container-fluid">   

    
    
	<div class="row">
  		<div class="col-md-10 col-md-offset-1">	<br><br>
		    <table class="table table-hover" id="table1">
				<tr>
				<td class="tno"><b>No.</b></td>
			    <td class="ttitle"><b>Title</b></td>
			    <td class="twrite"><b>Writer</b></td>
			    <td class="tdate"><b>Date</b></td>
			    <td class="tread"><b>Read</b></td>
				</tr>
<%
		// 순서3. DB로 부터 검색한 글들을 화면에 출력
		
			//날짜형식으로 바꿔주는 객체 생성
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			
			//만약에 백터내부에 글들이 하나라도 존재 하지 않으면?
			if(v.isEmpty()){
%>			
				<tr>
					<td colspan="5" align="center"> 등록된 글이 없습니다.</td>
				</tr>			
<%			
			}else{//백터내부에 뿌려줄 글(BoardDto객체들)이 하나라도 존재 한다면?
				
				//[11] 
				for(int cnt=beginPerPage;  cnt<(beginPerPage + numPerPage); cnt++){
					
					if(cnt == totalRecord){
						break;
					}	
					
					rvboardDTO rvdto = (rvboardDTO)v.get(cnt);
%>
		
			<tr>
				<td><%=rvdto.getNum()%></td>
	 			<td class="tab_sub">	
	 			<a href="#" onclick="fnRead('<%=rvdto.getNum()%>'); return false;"><%=rvdto.getSubject()%></a></td>
				<td><%=rvdto.getId()%></td>
				<td><%=s.format(rvdto.getDate())%></td>
				<td><%=rvdto.getReadcount()%></td>
			</tr>		
<%		
	
		
			}
		}

%>		
				
			</table>
			
				
			<div class="pagination">
			
<%	
				if(totalBlock > 0){
					
					if(nowBlock > 0){
%>			
				<a href="rv_main.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
					&laquo;
					</a>
<%			
					}
			}
%>

<%
			  
			  for(int cnt=0; cnt<pagePerBlock; cnt++){
					
					if((nowBlock*pagePerBlock) + cnt == totalPage){
						break;
					}	
			  
			  		
%>		
					<%--페이지 번호 링크  --%>
					<a href="rv_main.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+cnt%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">			
						<%=(nowBlock * pagePerBlock) + 1 + cnt %>	
					</a>					
<%
					if( ((nowBlock*pagePerBlock) + 1 + cnt) == totalRecord ){
						break;
					}			
				}
%>
				
<%
				
				if(totalBlock > nowBlock + 1){
%>	
				 <a href="rv_main.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
				  &raquo;
				 </a>
<%
				}
%>
			</div>

					<div id="btnarea">

						<div style="margin:0 auto; min-width:800px;"><!--  class="search"  -->
							<form action="rv_main.jsp" name="search" method="post">
								<div style="display: inline-block; vertical-align: middle;"> <!-- class="rv_select" -->
									<select name="keyField" class="rv_sl">
										<option value="subject">제목</option>
										<option value="content">내용</option>
										<option value="name">글쓴이</option>
									</select>
								</div>

								<div class="example" style="display: inline-block; vertical-align: middle;"> <!--   -->
									<input type="text" placeholder="Search.." name="keyWord">
									<button type="button" onClick="check()">
										<i class="fa fa-search"></i>
									</button>

								</div>


								<div style="display: inline-block; vertical-align: middle;"> <!--  class="btn-div" -->
									<button type="button" class="btn wrbtn" id="btn1"
										onclick="location.href='rvwrite.jsp'">Write</button>
									&nbsp;&nbsp;
									<button type="button" class="btn wrbtn" id="btn2"
										onclick="fnList(); return false;">처음으로</button>
								</div>

							</form>
						</div>
					</div>
				</div>	
		</div>
	</div>

<br><br>
<form  name="list" method="post">
		<input type="hidden" name="reload" value="true">
	</form>

	<%--추가7.
		게시판 글리스트 중에서.. 글제목을 클릭 했을떄.. 
		Read.jsp로 선택한 글번호, 글을  검색한 검색기준값, 검색어값 같이 전달
	 --%>
	 <form action="rvRead.jsp" method="post" name="read">
	 	<input type="hidden" name="num" >
	 	<input type="hidden" name="keyField" value="<%=keyField%>">
	 	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	 	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	 </form>

	
	
	
	<!-- 게시판 영역 -->			

		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
