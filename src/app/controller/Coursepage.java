package app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.entity.Cart;
import app.entity.Course;
import app.entity.Detail;
import app.entity.User;
import app.query.CartQuery;
import app.query.CourseQuery;
import app.query.CurriculumQuery;
import app.query.DetailQuery;
import app.query.MajorQuery;
import app.query.TestQuery;

@Transactional
@Controller
public class Coursepage {
	@Autowired
	SessionFactory factory;

	@RequestMapping("/coursepage")
	public String coursepage(ModelMap model, HttpServletResponse res, HttpSession ss, HttpServletRequest req)
			throws IOException {
		if (req.getParameter("id") == null) {
			return "redirect:./home.htm";
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			int process = 1;
			boolean isPaid = false;
		
			model.addAttribute("link", "public");
			CourseQuery ccq = new CourseQuery(factory);
			model.addAttribute("allcourse", ccq.getAll());
			Course thiscourse = ccq.get(" id ="+id);
			model.addAttribute("thiscourse", thiscourse );
			MajorQuery mq = new MajorQuery(factory);
			model.addAttribute("allmajor", mq.getAll());
			Course c = ccq.get(" id = "+id);
			User user = (User) ss.getAttribute("user");
			if (user != null) {
				CartQuery cq = new CartQuery(factory);
				List<Cart> listfc = cq.getlist("paid = true and useridc.id =" + user.getId());
				model.addAttribute("followcourse", listfc);
				for (Cart j : listfc)
					for (Detail k : j.getDetail()) {

						if (k.getCourseidd().getId() == id) {
							// If there was a same course in followcourse
							process = k.getProcess();
							isPaid = true;
						}
					}
				ccq = new CourseQuery(factory);
				List<Course> listc = ccq.getList("instruid = " + user.getId());
				model.addAttribute("createdcourse", listc);
				model.addAttribute("process", process);
			// if This course is Paid
				
			} else {
				model.addAttribute("followcourse", "");
				// if There are no login in this
				// Return a page with first demo and 	
				model.addAttribute("isVisit", true);
			}
			CurriculumQuery curriq = new CurriculumQuery(factory);
			model.addAttribute("curriculums",curriq.getList(" courseid.id = "+thiscourse.getId()));
			TestQuery testq = new TestQuery(factory);
			model.addAttribute("tests",testq.getList("courseidt.id = "+thiscourse.getId()));
			model.addAttribute("isPaid", isPaid);
			return "course/coursepage";
		}
	}
	// ================================================ UPDATE PROCESS DUE TO USER =========================================
	@RequestMapping("updateprocessofuser")
	public void updateprocessofuser( HttpServletResponse res, HttpSession ss
			,@RequestParam("process") int process
			,@RequestParam("courseid") int id) throws IOException{
		PrintWriter out = res.getWriter();
		User user = (User)ss.getAttribute("user");
		if(user != null){
			CartQuery cq = new CartQuery(factory);
			List<Cart> listfc = cq.getlist("paid = true and useridc.id =" + user.getId());
			for (Cart j : listfc)
				for (Detail k : j.getDetail()) {
					if (k.getCourseidd().getId() == id) {
						// If there was a same course in followcourse
						DetailQuery uq  = new DetailQuery(factory);
						k.setProcess(process);
						uq.update(k);
						out.print(id);
						return;
					}
					
				}
			out.print(0);
			return;
		}
		out.print(0);
		return;
		
	}
}
