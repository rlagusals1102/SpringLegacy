<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<html>
<head>
	<title>�۳��뺸��</title>
</head>
<body>
	<div align="center">
		<b>�۳��� ����</b><br><br>
		<table border="1" width="600">
			<tr>
				<th bgcolor="yellow" width="20%">�۹�ȣ</th>
				<td width="30%" align="center">${getBoard.num}</td>
				<th bgcolor="yellow" width="20%">��ȸ��</th>
				<td width="30%" align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td width="30%" align="center">${getBoard.writer}</td>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td width="30%" align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">������</th>
				<td width="30%" width="80" colspan="3">${getBoard.subject}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�۳���</th>
				<td width="30%" width="80" colspan="3">${getBoard.content}</td>
			</tr>
			<tr>
				<td bgcolor="yellow" align="right" colspan="4">
					<input type="button" value="�ۼ���" onclick="window.location='update_board.do?num=${getBoard.num}'">
					<input type="button" value="�ۻ���" onclick="window.location='delete_board.do?num=${getBoard.num}'">
					<input type="button" value="�۸��" onclick="window.location='list_board.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>