package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAODTO.ReviewDAO;
import DAODTO.ReviewDTO;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/ReviewUpdateServlet")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * public ReviewUpdateServlet() { super(); }
	 */

	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");

		String realpath = "C:\\Users\\user\\git\\shop\\WebContent\\fileUpload";
		MultipartRequest mr = new MultipartRequest(request, realpath, 1100 * 6000, "UTF-8",
				new DefaultFileRenamePolicy());

		ReviewDTO dto = new ReviewDTO();
		dto.setNum(Integer.parseInt(mr.getParameter("j_Num")));
		dto.setTitle(mr.getParameter("j_TitleName"));
		dto.setContent(mr.getParameter("j_ContentName"));
		dto.setImg(mr.getFilesystemName("j_thum"));

		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reviewUpdate(dto));

	}

	public String reviewUpdate(ReviewDTO dto) {
		ReviewDAO dao = new ReviewDAO();
		System.out.println(dto.getNum());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getImg());

		if (dto.getImg() == null) {
			if(dao.semiUpdateReview(dto.getNum(), dto.getTitle(), dto.getContent()) == 1) {
				return "1";
			}else {
				return "0";
			}
			
		} else {

			if (dao.updateReview(dto.getNum(), dto.getTitle(), dto.getContent(), dto.getImg()) == 1) {

				return "1";
			} else {
				return "0";
			}
		}
	}
}
