<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>ȸ������</title>
    
    <style>
        #wrap{
            width:530px;
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
    <!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="green">ȸ������</font></b>
        <br><br><br>
        
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ���, ������ �������� membershipInf.jsp -->
        
        <form method="post" action="membershipInf.jsp">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                        <input type="button" value="�ߺ�Ȯ��" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="15">
			<%
				session.setAttribute("id", request.getParameter("id"));
				session.setAttribute("password", request.getParameter("password"));
			%>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td>
                        <input type="radio" name="gender" value="��" checked>��
                        <input type="radio" name="gender" value="��" checked>��
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td>
                        <input type="text" name="birth_yy" maxlength="4" placeholder="��(4��)" size="6" >
                        <select name="birth_mm">
                            <option value="">��</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birth_dd" maxlength="2" placeholder="��" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸���</td>
                    <td>
                        <input type="text" name="email_1" maxlength="30">@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���">
        </form>
    </div>
</body>
</html>