<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updateForm.jsp -->
<html>
<head>
	<title>글수정</title>
	<script type="text/javascript">
		fuction checkMember(){
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
	<div align="center">
		<form name="f" action="update_board.do" method="post" onsubmit="return checkMember()">
			<h3>글수정</h3>
			<input type="hidden" name="num" value="${getBoard.num}"/>
			<table border="1" width="600">
				<tr>
					<th width="20%" bgcolor="yellow">이름</th>
					<td><input type="text" name="writer" value="${getBoard.writer}" readOnly></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">제목</th>
					<td><input type="text" name="subject" size="50" value="${getBoard.subject}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">Email</th>
					<td><input type="text" name="email" size="50" value="${getBoard.email}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">내용</th>
					<td><textarea name="content" rows="11" cols="50">${getBoard.content}</textarea></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">비밀번호</th>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr bgcolor="yellow">
					<td colspan="2" align="center">
						<input type="submit" value="글수정">
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onclick="window.location='list_board.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>