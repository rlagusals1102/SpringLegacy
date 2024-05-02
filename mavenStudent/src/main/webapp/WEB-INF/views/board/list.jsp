<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
<head>
	<title>�Խñۺ���</title>
</head>
<body>
	<div align="center">
		<b>�� �� ��</b>
		<table border="0" width="800">
			<tr bgcolor="yellow">
				<td align="right"><a href="write_board.do">�۾���</a></td>
			</tr>
		</table>
		<table border="1" width="800">
			<tr bgcolor="green">
				<th>��ȣ</th>
				<th width="40%">����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ</th>
				<th>IP</th>
			</tr>
		<c:if test="${empty listBoard}">
			<tr>
				<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>	
		<c:forEach var="dto" items="${listBoard}">
			<tr>
				<td>${dto.num}</td>
				<td><a href="content_board.do?num=${dto.num}">${dto.subject}</a></td>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td>${dto.ip}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>