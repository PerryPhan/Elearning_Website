package app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import app.entity.Cart;
import app.entity.Course;
import app.entity.Detail;
import app.entity.User;
import app.query.CartQuery;
import app.query.CourseQuery;
import app.query.MajorQuery;
import app.query.UserQuery;

@Transactional
@Controller
public class Homepage {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;

	@RequestMapping("/home")
	public String home(ModelMap model, HttpServletResponse res, HttpSession ss) throws IOException {
		model.addAttribute("link", "public");
		CourseQuery ccq = new CourseQuery(factory);
		model.addAttribute("allcourse", ccq.getAll());
		MajorQuery mq = new MajorQuery(factory);
		model.addAttribute("allmajor", mq.getAll());

		User user = (User) ss.getAttribute("user");
		if (user != null) {
			CartQuery cq = new CartQuery(factory);
			List<Cart> listfc = cq.getlist("paid = true and useridc.id =" + user.getId());
			model.addAttribute("followcourse", listfc);
			ccq = new CourseQuery(factory);
			List<Course> listcc = ccq.getList("instruid = " + user.getId());
			model.addAttribute("createdcourse", listcc);
		} else {
			model.addAttribute("followcourse", "");
		}
		return "home";

	}

	// ========================================================== SELECT MAJOR
	// TO SHOW COURSE ================================================
	@RequestMapping("/majoridCourse")
	public String getCourse_with_MajorId(ModelMap model, HttpServletResponse res, HttpSession ss,
			@RequestParam("id") int id) throws IOException {
		model.addAttribute("link", "public");
		CourseQuery ccq = new CourseQuery(factory);
		if (id == 0)
			model.addAttribute("allcourse", ccq.getAll());
		else {
			model.addAttribute("active", id);
			model.addAttribute("allcourse", ccq.getList(" majorid = " + id));
		}
		MajorQuery mq = new MajorQuery(factory);
		model.addAttribute("allmajor", mq.getAll());

		User user = (User) ss.getAttribute("user");
		if (user != null) {
			CartQuery cq = new CartQuery(factory);
			List<Cart> listfc = cq.getlist("paid = true and useridc.id =" + user.getId());
			model.addAttribute("followcourse", listfc);
			ccq = new CourseQuery(factory);
			List<Course> listcc = ccq.getList("instruid = " + user.getId());
			model.addAttribute("createdcourse", listcc);
		} else {
			model.addAttribute("followcourse", "");
		}
		return "home";

	}

	// ================================================== HANDLE SEARCH BAR AT
	// NAVBAR =======================================================
	@RequestMapping("selectcoursewithname")
	public void selectCourse_with_Name(HttpServletResponse res, @RequestParam("name") String name) throws IOException {
		PrintWriter out = res.getWriter();
		CourseQuery cq = new CourseQuery(factory);
		List<Course> list = cq.getList(" name LIKE '%" + name + "%'");
		String data = "";
		if (list.size() != 0)
			for (Course i : list) {
				data += i.getId() + "-" + i.getName() + ',';
			}
		out.print(data);
	}

	// ======================================================== EDIT INFORMATION
	// ==============================================================
	@RequestMapping("updateyourinformation")
	public void updateYourInformation(HttpSession ss, HttpServletResponse res, @RequestParam("id") int id,
			@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("birthday") String birthday, @RequestParam("gender") boolean gender) throws IOException {
		PrintWriter out = res.getWriter();
		UserQuery uq = new UserQuery(factory);
		User user = (User) ss.getAttribute("user");
		String lastname = "";
		String firstname = "";
		if (name != "" && !name.equals(user.getFirstname().trim() + " " + user.getLastname().trim())) {
			String[] fullname = name.split(" ");
			lastname = fullname[fullname.length - 1];
			firstname = "";
			int i = 0;
			for (i = 0; i < fullname.length - 1; i++) {
				if (!fullname[i].equals(""))
					firstname += fullname[i] + " ";
			}
			user.setFirstname(firstname.trim());
			user.setLastname(lastname.trim());
		}
		if (email != "" && email.equals(user.getEmail().trim()))
			user.setEmail(email);
		if (birthday != "" && !birthday.equals(user.getBirthday().trim()))
			user.setBirthday(birthday);
		if (gender != user.getGender())
			user.setGender(gender);

		uq.update(user);
		out.print("true");
		return;
	}

	// ======================================================= ADD TO CART
	// ===============================================
	@RequestMapping("addcoursetocart")
	public void addtoSessionCart(HttpSession ss, HttpServletResponse res, @RequestParam("id") int id,
			@RequestParam("price") float price) throws IOException {
		PrintWriter out = res.getWriter();
		CourseQuery cq = new CourseQuery(factory);
		CartQuery uq = new CartQuery(factory);
		User user = (User)ss.getAttribute("user");
		if ( user != null) {
			List<Detail> cart = (List<Detail>) ss.getAttribute("cart");
			List<Cart> oldcart = uq.getlist(" paid = true and useridc.id ="+user.getId());
			if (id != 0){
				for (Detail i : cart) {
					if (i.getCourseidd().getId() == id) {
						// If there was a same course in cart
						out.print("false");
						return;
					}
				}
				for (Cart j : oldcart)
					for(Detail k : j.getDetail()){
						
						if( k.getCourseidd().getId() == id){
							// If there was a same course in followcourse
							out.print("history");
							return;
						}
					}
				
			}
			// If there wasn't
			Detail newdetail = new Detail();
			Course course = cq.get("id = " + id);
			newdetail.setCourseidd(course);
			newdetail.setCash(course.getPrice());
//			Session "Cart" add new Detail 
			cart.add(newdetail);
			out.print("true");
			return;
		} else {
			out.print("need user");
			return;
		}
	}
}
