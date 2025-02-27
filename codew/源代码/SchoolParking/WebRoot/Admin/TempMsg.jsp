<%@page import="DAL.*" errorPage="_Error.jsp"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();//获取项目名称
 %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/Style/MsgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/Script/jquery-1.10.1.js"></script>
<title>Insert title here</title>
<script>
	$(function()
	{
		$(".btnGo").click(function()
		{
			if($("[name=htype]").val()=="4")
			{
				location.href="<%=path %>/TempHandle?type=4&page="+($(".txtPage").val()==""?1:$(".txtPage").val());
			}
			else
			{
				location.href="<%=path %>/TempHandle?type=5&page="+($(".txtPage").val()==""?1:$(".txtPage").val())+"&condition="+$("[name=hcondition]").val()+"&value="+$("[name=hvalue]").val();
			}		
		});
	});
</script>
</head>
<body>
<div class="div_container">
	<div class="searchDiv">
		<form action="<%=path %>/TempHandle" method="get">
			<span>查询条件：</span>
			<select name="condition">
				<option value='car_num'>车牌号码</option>
				<option value='entry_date'>入场日期</option>
				<option value='out_date'>出场日期</option>
			</select>
			 	
			<span>查询值：</span>
			<input type="hidden" name="type" value="5" />
			<input type="text" name="value" />
			<input type="submit" value="查询 "/>
		</form>
	</div>
	<!-- searchDiv End -->

	<table>
		<thead>
			<tr>
				<th>临时编号</th>
				<th>临时卡号</th>
				<th>车牌号码</th>
				<th>入场日期</th>
				<th>出场日期</th>
				<th>停车费用</th>
				<th>操作</th>
			</tr>
		</thead>

		<tbody>
			<% 
	                	response.setCharacterEncoding("UTF-8");//设置输出数据的编码格式
				request.setCharacterEncoding("UTF-8");//设置获取数据的编码格式

				List<Object> list=(List<Object>)request.getAttribute("list");//获取servlet端转发的list数据列表
				out.write("<input type='hidden' name='hcondition' value='"+(request.getAttribute("condition")!=null?request.getAttribute("condition").toString():"")+"' />");
				out.write("<input type='hidden' name='hvalue' value='"+(request.getAttribute("value")!=null?request.getAttribute("value").toString():"")+"' />");
                		if(list!=null) //循环数据列表，生成表格行
                		{
                			for(int i=0;i<list.size();i++)
	                		{
	               				Object[] obj;
	               				obj=(Object[])list.get(i);
	               				String outDate=obj[5]+" "+obj[6];
	               				if(obj[7].toString().equals("0.0"))
	               				{
	               					out.print("<tr><td>"+obj[0]+"</td><td>"+obj[1]+"</td><td>"+obj[2]+"</td><td>"+obj[3]+" "+obj[4]+"</td><td>"+(outDate.equals("null null")?"未出场":outDate)+"</td><td>"+(obj[7].toString().equals("0.0")?"待结算":obj[7])+"</td><td><a href='"+path+"/Admin/TempEdit.jsp?temp_id="+obj[0]+"' class='a_edit'>结算</a><a href='"+path+"/TempHandle?type=1&temp_id="+obj[0]+"' class='a_del' onclick='return confirm(\"是否确认删除？\")'>删除</a></td></tr>");
	               				}
	               				else{
	              	       	               		out.print("<tr><td>"+obj[0]+"</td><td>"+obj[1]+"</td><td>"+obj[2]+"</td><td>"+obj[3]+" "+obj[4]+"</td><td>"+(outDate.equals("null null")?"未出场":outDate)+"</td><td>"+(obj[7].toString().equals("0.0")?"待结算":obj[7])+"</td><td><a href='"+path+"/TempHandle?type=1&temp_id="+obj[0]+"' class='a_del' onclick='return confirm(\"是否确认删除？\")'>删除</a>  <a onclick='return confirm(\"是否打印？\")'>打印</a></td></tr>");
	         	               		}
	                		}
                		}

	                %>
		</tbody>

		<tfoot>
            		<tr><td colspan="9">
            				<div>
						<%
            						int totalPage;
            						if(request.getAttribute("totalPage")!=null){
            							totalPage=Integer.parseInt(request.getAttribute("totalPage").toString());
            							out.write("<input type='hidden' name='htype' value='"+4+"' />");
            						}
            						else{
            							totalPage=Integer.parseInt(request.getAttribute("wherePage").toString());
            							out.write("<input type='hidden' name='htype' value='"+5+"' />");
            						}
            					 %>
            					<span>共<strong><%=totalPage %></strong>页  </span>
            					<span>跳转至</span><input type="text" class="txtPage" /><input type="button" value="转" class="btnGo" />
            				</div>
            			</td>
			</tr>
            </tfoot>

	</table>
</div>
</body>
</html>
