<%@page import="com.code5.fw.web.MasterController"%>
<%@page import="com.code5.fw.data.Table"%>
<%@page import="com.code5.fw.web.BoxContext"%>
<%@page import="com.code5.fw.data.Box"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Box box = BoxContext.get();
	Box board = box.getBox("board");
	boolean isExeDelete = MasterController.checkUrlAuth("exeDelete");
%>
<script type="text/javascript">
function exeUpdate(){
	var form = document.form1;
	form.action = '/multipart/exeUpdate';
	form.submit();
}

function exeDelete(){
	<%if(!isExeDelete){%>
	alert('자신의 글만 삭제할 수 있습니다.');
	if(true) return;
	<%}%>
	var form = document.form1;
	form.action = '/waf/exeDelete';
	form.submit();
}
</script>
<hr>
<form name="form1" method="post" enctype = "multipart/form-data">
post, multipart/form-data
<br>form1.TOKEN_N : <input type ="TEXT" NAME = "TOKEN_N" VALUE = "<%=box.s("TOKEN_N")%>">
<br>form1.TITLE : <input type="TEXT" name="TITLE" value="<%=board.s("TITLE")%>">
<br>form1.TXT : <input type="TEXT" name="TXT" value="<%=board.s("TXT")%>">
<br>form1.EM : <input type="TEXT" name="EM" value="<%=board.s("EM")%>">
<br>form1.FILE_1 : <input type="FILE" name="FILE_1">
<br>form1.FILE_1 : <input type="FILE" name="FILE_2">
<br>FILE_NM_1 : <%=board.s("FILE_NM_1")%>, <%=board.s("FILE_ID_1")%> <a href="/waf/file001?FILE_ID=<%=board.s("T_FILE_ID_1")%>">[파일다운로드]</a>
<br>FILE_NM_2 : <%=board.s("FILE_NM_2")%>, <%=board.s("FILE_ID_2")%> <a href="/waf/file001?FILE_ID=<%=board.s("T_FILE_ID_2")%>">[파일다운로드]</a>


</form>

<button onclick="exeUpdate()">exeUpdate</button>
<button onclick="exeDelete()">exeDelete</button>