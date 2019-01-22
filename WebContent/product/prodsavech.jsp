<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="DAODTO.ProdSaveDAO" %>
<%@page import="DAODTO.ProdSaveDTO"%> 
    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%> 


  
 <%
 	request.setCharacterEncoding("UTF-8");
	String realpath = request.getServletContext().getRealPath("/fileUpload");
	System.out.println(realpath);
	MultipartRequest mr = new MultipartRequest(request, realpath, 6000*6000, "UTF-8",new DefaultFileRenamePolicy());
	ProdSaveDAO prodsavedao  = new ProdSaveDAO();
	ProdSaveDTO prodsavedto = new ProdSaveDTO();
	
	//상품정보 가져오기
	prodsavedto.setCode(mr.getParameter("code"));
	prodsavedto.setThum(mr.getFilesystemName("thum"));
	prodsavedto.setCate(mr.getParameter("cate"));
	prodsavedto.setName(mr.getParameter("name"));
	prodsavedto.setPrice(Integer.parseInt(mr.getParameter("price")));
	prodsavedto.setDetail(mr.getParameter("smartEditor"));
	
	//색상 옵션값 가져오기
 	String color = "";
	
	for(int i=0; i < 10; i++){
		String param = mr.getParameter("color"+(i+1));
		if(param == null || param.equals("")){
			break;
		}else{
			color = color + "/" + param;
		}
	}
	
	prodsavedto.setColor(color);
	out.write(prodsavedto.getColor());
	
	//사이즈 옵션값 가져오기
	String size = "";
	
	for(int i=0; i < 10; i++){
		String param = mr.getParameter("size"+(i+1));
		if(param == null || param.equals("")){
			break;
		}else{
			size = size + "/" + param;
		}
	} 
	
	prodsavedto.setSize(size);
	
	boolean result = prodsavedao.prodsave(prodsavedto);
	
	out.write("<script>");
	 if(result){
		 out.write("location.href='/shop/main/index.jsp';");
		 out.write("alert('상품등록 성공');");
	 }else{
		 out.write("history.back();");
		 out.write("alert('상품등록 실패');");
	 }
	out.write("</script>"); 
	
%> 