<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="DAODTO.ReviewDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dao" class="DAODTO.ReviewDAO" scope="page"></jsp:useBean>

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%
		request.setCharacterEncoding("UTF-8");
		String realpath = config.getServletContext().getRealPath("\\fileUpload");
		
		System.out.print(realpath);
		MultipartRequest mr = new MultipartRequest(request, realpath, 1100 * 6000, "UTF-8", new DefaultFileRenamePolicy());

		dto.setId((String) session.getAttribute("id"));
		dto.setName(mr.getParameter("j_SecondName"));
		dto.setTitle(mr.getParameter("j_TextName"));
		dto.setContent(mr.getParameter("j_contentName"));
		dto.setGrade(mr.getParameter("j_grade"));
		dto.setImg(mr.getFilesystemName("j_thum"));

		//File f = new File("/Shopping/WebContent/img/" + mr.getFilesystemName("j_thum"));
		
			if (dao.insertReview(dto) == 1) {
				response.sendRedirect("reviewboardlist.jsp");
			} else {
				System.out.print("실패");
			}
	%>



</body>
</html>