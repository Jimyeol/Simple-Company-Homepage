<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>ȸ������ ����</title>
    <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid gray
        }
        
        td{
            border:1px solid gray
        }
        
        #title{
            background-color:gray
        }
    </style>
</head>
<body>
    <!-- membership.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. -->
    <% 
        // �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    
        // getParameter()�� �̿��� �Ѱ��� �Ķ���� ���� ���� �� �ִ�.
        // �Ķ���� ���� ������ name= �� �����ص� ���� ������ ���� ���ڷ� �����ؾ� �ȴ�.
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        session.setAttribute("id", id);
        session.setAttribute("password", password);
        // ������ ��� �Ķ���� �̸��� �Ѵ� gender�� �����ϹǷ� �迭�� �޾ƾ� �ȴ�.
        String[] gender = request.getParameterValues("gender");
        String birthyy = request.getParameter("birth_yy");
        
        // ������ ��� <select>�� �Ǿ� �ִµ� �Ķ���� ���� ���� �� �迭���·� �Ѱ� �޴´�.
        String[] birthmm = request.getParameterValues("birth_mm");
        String birthdd = request.getParameter("birth_dd");
        String email1 = request.getParameter("email_1");
        
        // �̸����� ��� <select>�� �Ǿ� �ִµ� �Ķ���� ���� ���� �� �迭���·� �Ѱ� �޴´�.
        String[] email2 = request.getParameterValues("email_2");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
    %>
    <div id="wrap">
        <br><br>
        <b><font size="5" color="green">ȸ������ ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="green"><%=name %></font>�� ������ ���ϵ帳�ϴ�.
        <br><br>
        
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=password %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td><%=name %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td>
                <%
                    // �迭�� �Ѱܹ��� ���� ó���ϱ� ���� for�� �̿�
                    for(String g : gender){
                        out.println(g);
                    }
                %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td>
                <%=birthyy %>�� 
                <%
                    // �迭�� �Ѱܹ��� ���� ó���ϱ� ���� for�� �̿�
                    for(String mm : birthmm){
                        out.println(mm);
                    }        
                %>�� <%=birthdd %>��
                </td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td>
                    <%=email1 %>
                    <%
                    // �迭�� �Ѱܹ��� ���� ó���ϱ� ���� for�� �̿�
                    for(String e : email2){
                        out.println("@"+e);
                    }        
                    %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=phone %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
                    <%=address %>
                </td>
            </tr>
        </table>
        
        <br>
	<form action="memberSave.jsp" method="get">

	<ul>
	<div style="text-align:center;">
	<label for="submit"><input type="submit" value="ȸ������ �Ϸ�"></label>
</div>
</ul>
</form>
    </div>
</body>
</html>