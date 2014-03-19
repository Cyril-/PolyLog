<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	<%@ page import="java.util.*" %>
<%@ page import="Bean.Boat" %>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="Bean.Group" %>
	
<%
ArrayList<Group> groupp = new ArrayList<Group>();
groupp=manager.getIsr().recupSelectG();
%>


<%

	
	if(!manager.isIdentifie()) response.sendRedirect("../connexion/identification.jsp");

	int id_boat = -1;
	ArrayList<Boat> rs = new ArrayList<Boat>();
	String id ="";
	if(( id=request.getParameter("Id"))!=null){
		id_boat=Integer.parseInt(id);
	}
	rs=manager.getIsr().consultBateau(id_boat);
	int ok=0;
	int groupe =-1;
	int alert =-1;
	String name_boat = rs.get(0).getName_boat();
	String notice = rs.get(0).getNotice();

	
	
// récupere la liste des champs de la page et traite les différents cas 
	
	if (ServletFileUpload.isMultipartContent(request)) {	
			FileItemFactory factory =
					new DiskFileItemFactory();
			ServletFileUpload upload = 
					new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem)iter.next();
				if (item.isFormField()) {
					if(item.getFieldName().equals("name_boat")){
						if (name_boat == null) name_boat = "";
						name_boat = item.getString();
					}

					
					if(item.getFieldName().equals("notice")){
						if (notice == null) notice = "";
						notice = item.getString();}
					
					if(item.getFieldName().equals("groupe")){
						if(!item.getString().equals("-1")){
						groupe=Integer.parseInt(item.getString());
						}
					}
				}
			
// selon les cas une fonction est exécutée.
				else {
					if(item.getSize()!=0){
						if(name_boat.equals("")==false && notice.equals("")== false
						&& notice.length()<255 && name_boat.length()<255){
						if(manager.getIsr().modifierBateau(id_boat,name_boat,notice,item,groupe))
							ok = 1;
						    alert=1;
						}else{
							alert=0;
						}
					}else if(name_boat.equals("")==false && notice.equals("")== false
							&& notice.length()<255 && name_boat.length()<255){
								if(manager.getIsr().modifierBateau(id_boat,name_boat,notice,groupe))
									ok = 1;
									alert=1;
					}else{
						alert=0;
					}
				}
			}
	
	if (ok == 1) {
// permet un délai avec la redirection afin de voir les alertes 
		response.setHeader("Refresh","2; URL=../Bateaux/listerBateau.jsp");
	}
		}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<title>Identification</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>


<body>
	<div class="container">

	<%
	for(int i=0;i<rs.size();i++){
	%>
		<form method="post" enctype="multipart/form-data">
			<span class="span2"></span>
			<table class="tDark span9">  

				<tr>
					<td>Nom du bateau :</td>
					<td><input type="text" name="name_boat" class="span4" value="<%= name_boat %>" /></td>
				</tr>

				<tr>
					<td>Notice :</td>
					<td><textarea class="span4" style="resize:none" rows="8"  name="notice"><%=notice %></textarea></td>
				</tr>
				<tr>
					<td>Type :</td>
					<% String type= rs.get(i).getGroupe(); %>
					<td><SELECT class="span4" name="groupe" size="1">
				<%	for(int j=1;j<groupp.size();j++){
						if (type.equals(groupp.get(j).getNom())){ %>
							<OPTION VALUE="<%=groupp.get(j).getId() %>" selected ><%=groupp.get(j).getNom() %>
							<%}else{ %>
							<OPTION VALUE="<%=groupp.get(j).getId() %>"><%=groupp.get(j).getNom() %>
						<% }} %>
						</SELECT>
				</td>
				</tr>
				
				<tr>
					<td>Image :</td>
					<td><img width="100px" src="../ImageBateau?idBateau=<%= id_boat %>">
					<span class="span2 controls" style="position:relative;">
						<a class='btn btn-primary' style='margin-right: 40px;margin-top:4px;' href='javascript:;'>
							Choisir une image...
							<input type="file" accept="image/jpeg" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  onchange='$("#upload-file-info").html($(this).val());'>
						</a>
						&nbsp;
						<span class='label label-info' id="upload-file-info"></span>
						<span class="help-inline"></span>
			    	</span>
			    	</td>
					</tr>

				<tr>
				<tr>
					<td>
						<input class="btn btn-success" type="submit" value="Valider"  />
					</td>
									<% if(alert==1) { %>
				<td>
				<div class="alert alert alert-success span4">
				<button type="button" class="close"></button>
					 <strong>Bateau modifié avec succès</strong>
				</div>
				</td>
			<% } else if(alert==-1) {%>
				<td>
				<div class="alert alert alert-info span4">
				<button type="button" class="close"></button>
					 <strong>Veuillez remplir les champs</strong>
				</div>
				</td>
			<% }else{%>
				<td>
				<div class="alert alert alert-danger span4">
				<button type="button" class="close"></button>
					 <strong>Champs vide ou supérieur a 255 caractères</strong>
				</div>
				</td>
			<% } %>	
				</tr>
			</table>
		</form>
	<%
		} 
	%>

	</div>
</body>



<div class="container">
<jsp:include page="../commun_page_menu/footer.jsp"/>
</div>