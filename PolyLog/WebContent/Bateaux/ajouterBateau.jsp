<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
	
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="Bean.Group" %>
<%@ page import="java.util.*" %>
	
<%
ArrayList<Group> rs = new ArrayList<Group>();
rs=manager.getIsr().recupSelectG();
%>

	
<%
// si l'utilisateur n'est pas connecté il ne peut pas accédé a la page et il renvoyer vers la connexion

if(!manager.isIdentifie()) response.sendRedirect("../connexion/identification.jsp");


	int ok = 0;
	int groupe=-1;	
	int alert=-1;
	
// meme fonction que dans modifierBateau

		if (ServletFileUpload.isMultipartContent(request)) {
			String name_boat = null;
			String notice = null;
		
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
				else {
					if(name_boat.equals("")== false && notice.equals("")== false && item.get().length !=0
					   && notice.length()<255 && name_boat.length()<255 ){
						if(manager.getIsr().ajouterBateau(name_boat,notice,item,groupe))
							ok = 1;
							alert=1;
					}else{
						alert = 0;	
					}
				}
			}
	
	if (ok == 1) {
		response.setHeader("Refresh","3; URL=../accueil/accueil.jsp");
	}
		}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<title>Ajouter Bateau</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>


<body>
	<div class="container">

		<form method="post" enctype="multipart/form-data" >
			<span class="span2"></span>
			<table class="tDark span9">  
				<tr>
					<td>Nom du bateau :</td>
					<td><input type="text" class="span4"  name="name_boat"/></td>
				</tr>
				<tr>
					<td>Notice :</td>
					<td><textarea class="span4" style="resize:none" rows="8" name="notice"></textarea></td>
				</tr>
				<tr>
					<td>Type :</td>
					<td>

				<SELECT class="span4"  type="text" name="groupe" style="margin-top:5px;margin-left:3px;margin-right:3px;" size="1">
							<% for(int i=1;i<rs.size();i++){
								%>
							<OPTION VALUE="<%= rs.get(i).getId() %>" ><%= rs.get(i).getNom() %>
							<% } %>
							</SELECT>	
				</tr>
				<tr>
					<td>Image :</td>
					<td>					<span class="span2 controls" style="position:relative;">
						<a class='btn btn-primary' style='margin-right: 40px;margin-top:4px;' href='javascript:;'>
							Choisir une image...
							<input type="file" accept="image/jpeg" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  onchange='$("#upload-file-info").html($(this).val());'>
						</a>
						&nbsp;
						<span class='label label-info' id="upload-file-info"></span>
						<span class="help-inline"></span>
			    	</span></td>
				</tr>
				<tr>
					<td>
						<input class="btn btn-success" type="submit" value="Valider"  />
					</td>
										<% if(alert==0) { %>
					<td>
					<div class="alert alert alert-error span4">
					<button type="button" class="close" data-dismiss="alert"></button>
 					 <strong>Attention!</strong><p>Veuillez à remplir tout les champs (Maximum 255 caractères)
 					 								Et ajouter une image.</p>
					</div>
					</td>
				<% }else if(alert==1) { %>
				<td>
				<div class="alert alert alert-success span4">
				<button type="button" class="close" data-dismiss="alert"></button>
					 <strong>Bateau ajouté avec succès</strong>
				</div>
				</td>
			<% } else {%>
				<td>
				<div class="alert alert alert-info span4">
				<button type="button" class="close" data-dismiss="alert"></button>
					 <strong>Veuillez remplir les champs</strong>
				</div>
				</td>
			<% } %>	
				</tr>
			</table>
		</form>
	</div>
</body>


<footer>
	<div class="container">
		<jsp:include page="../commun_page_menu/footer.jsp"/>
	</div>
</footer>


