<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@ page import="java.util.*" %>
<%@ page import="Bean.Boat" %>

<%
String search = "";
String type = "";
String groupe = "";
ArrayList<Boat> rs = new ArrayList<Boat>();
search = request.getParameter("searchBarValue");
type = request.getParameter("group");
groupe = request.getParameter("groupe");
if (groupe == null) groupe = "1";
if (type==null) type="name_boat";
if (search==null) search="";

// selon si on passe par le bouton ou par la recherche une fonction est éxécutée.

if(search!=null){
	if(groupe.equals("1")==false){
		rs=manager.getIsr().consultBateau(search,type,groupe);		
	} 
	else{
		rs=manager.getIsr().consultBateau(search,type);
	}
}



%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<title>Identification</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>


<body>
	<center>
		<a href="../Pdf?searchBarValue=<%=search %>&group=<%=type%>&groupe=<%=groupe%>" class="btn btn-danger"><i class="icon-white icon-file"></i> Exporter la Liste en PDF <i class="icon-white icon-file"></i></a>
	</center>
	<hr>
	<div class="container">
		<table class="tDark">  
			<thead>
				<tr>
					<td class="span4">Name_Boat</td>
					<td class="span4">Notice</td>
					<td class="span4">Picture</td>
					<td class="span4">Group</td>
					<%
					if(manager.isIdentifie()){
					%>
						<td class="span2">Edit</td>
					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				for(int i=0;i<rs.size();i++){
				%>
					<tr>
						<td class="span4"><%=rs.get(i).getName_boat()  %></td>
						<td class="span4"><%=rs.get(i).getNotice()   %></td>
						<td class="span4 zoom"><img width="100px" src="../ImageBateau?idBateau=<%= rs.get(i).getId_boat() %>"/></td>
						<td class="span4"><%=rs.get(i).getGroupe()  %></td>
						<%
						if(manager.isIdentifie()){
						%>
							<form name="recherche" action="../Bateaux/modifierBateau.jsp" method="get">
								<td>
									<input type="hidden" class="span2 btn btn-info" value=<%= rs.get(i).getId_boat()%> name="Id">
									<button type="submit" class="span1 btn btn-info"><span class="icon icon-white icon-pencil"></span></button>
								
								</td>
							</form>
						<%
						}
						%>
					</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>


	<div class="container">
		<jsp:include page="../commun_page_menu/footer.jsp"/>
	</div>
</body>
