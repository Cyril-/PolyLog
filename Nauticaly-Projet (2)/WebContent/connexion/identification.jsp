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
    
<%


	int ok = -1;	
	int alert=-1;
	String ident = "";
	String pwd = "";
	
// meme fonction que dans modifierBateau

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
					if(item.getFieldName().equals("ident")){
						if (ident == null) ident = "";
						ident= item.getString();
					}
					
					if(item.getFieldName().equals("pwd")){
						if (pwd == null) pwd = "";
						pwd = item.getString();}
				}
			}
			if(manager.getIsr().identification(ident,pwd)){
				ok = 1;
				alert=1;
				
			}else{
				alert=0;
			}
		}
			
	
	if (ok == 1) {
		response.setHeader("Refresh","1.5; URL=../accueil/accueil.jsp");
		manager.setNom(ident);
		manager.setIdentifie(true);
	}
		
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<title>Identification</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>


<body>

<div class="container">

		<form method="post" enctype="multipart/form-data" >
			<span class="span2"></span>
			<table class="tDark span9">  
				<tr>
					<td>Identifiant :</td>
					<td><input type="text" class="span4"  name="ident" value="<%= ident %>" /></td>
				</tr>
				<tr>
					<td>Mot De Passe :</td>
					<td><input type="password" class="span4"  name="pwd"  value="<%= pwd %>"/></td>
				</tr>
				<tr>
					<td>
						<input class="btn btn-success" type="submit" value="Valider"  />
					</td>
					<% 
					if(alert==0){  %>
						<td>
							<div class="alert alert alert-danger">
								<button type="button" class="close"></button>
	 					 		<strong>Attention!</strong><p>identifiant ou mot de passe invalide</p>
	 					 								
							</div>
						</td>
			<% 	}else if(alert==1) { %>
						<td>
							<div class="alert alert alert-success">
								<button type="button" class="close"></button>
 								<strong>Connexion réussie</strong>
 					 								
							</div>
						</td>
				<% }else{ %>
						<td>
							<div class="alert alert alert-info">
								<button type="button" class="close"></button>
 								<strong>Veuillez vous connecter</strong>
 					 								
							</div>
						</td>
			<%	}  %>
				
				</tr>
			</table>
		</form>
	</div>
</body>




	<div class="container">
		<jsp:include page="../commun_page_menu/footer.jsp"/>
	</div>