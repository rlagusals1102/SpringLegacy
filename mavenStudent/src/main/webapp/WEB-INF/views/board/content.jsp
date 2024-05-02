<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<html>
<head>
	<title>글내용보기</title>
</head>
<body>
	<div align="center">
		<b>글내용 보기</b><br><br>
		<table border="1" width="600">
			<tr>
				<th bgcolor="yellow" width="20%">글번호</th>
				<td width="30%" align="center">${getBoard.num}</td>
				<th bgcolor="yellow" width="20%">조회수</th>
				<td width="30%" align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">작성자</th>
				<td width="30%" align="center">${getBoard.writer}</td>
				<th bgcolor="yellow" width="20%">작성일</th>
				<td width="30%" align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">글제목</th>
				<td width="30%" width="80" colspan="3">${getBoard.subject}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">글내용</th>
				<td width="30%" width="80" colspan="3">${getBoard.content}</td>
			</tr>
			<tr>
				<td bgcolor="yellow" align="right" colspan="4">
					<input type="button" value="글수정" onclick="window.location='update_board.do?num=${getBoard.num}'">
					<input type="button" value="글삭제" onclick="window.location='delete_board.do?num=${getBoard.num}'">
					<input type="button" value="글목록" onclick="window.location='list_board.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>