<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<html>
<head>
	<title>�۾���</title>
	<script type="text/javascript">
		fuction checkMember(){
			if (f.writer.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("������ �Է��� �ּ���!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("������ �Է��� �ּ���!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
	<div align="center">
		<form name="f" action="write_board.do" method="post" onsubmit="return checkMember()">
			<table border="1" width="600">
				<tr bgcolor="yellow">
					<td align="center" colspan="2">�� �� ��</td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">�̸�</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">����</th>
					<td><input type="text" name="subject" size="50"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">Email</th>
					<td><input type="text" name="email" size="50"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">����</th>
					<td><textarea name="content" rows="11" cols="50"></textarea></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">��й�ȣ</th>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr bgcolor="yellow">
					<td colspan="2" align="center">
						<input type="submit" value="�۾���">
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="��Ϻ���" onclick="window.location='list_board.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>