package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.FileBean;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Delete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// Delete a File Logic :Start
		HttpSession session = request.getSession(true);
		String filename = request.getParameter("filename");
		System.out.println("in" + filename);
		String DOWNLOAD_DIRECTORY = "c:\\" + session.getAttribute("emailid")
				+ "\\" + filename;
		System.out.println(DOWNLOAD_DIRECTORY);
		try {
			File file = new File(DOWNLOAD_DIRECTORY);
			file.delete();
			ArrayList<FileBean> filelist = new ArrayList<FileBean>();
			session = request.getSession(true);
			File folder = new File("C://" + session.getAttribute("emailid")
					+ "//");
			if (folder != null) {
				File[] listOfFiles = folder.listFiles();

				for (int i = 0; listOfFiles != null && i < listOfFiles.length; i++) {
					if (listOfFiles[i].isFile()) {
						FileBean bean = new FileBean();
						System.out.println(listOfFiles[i].getName());
						bean.setFilename(listOfFiles[i].getName());
						bean.setFilesize(listOfFiles[i].length() / (1024L));
						filelist.add(bean);

					}
				}
			}
			request.setAttribute("filelist", filelist);
			String nextpath = "Download.jsp";
			request.getRequestDispatcher(nextpath).forward(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
