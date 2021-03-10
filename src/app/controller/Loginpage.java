package app.controller;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
//import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.sun.javafx.iio.ios.IosDescriptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.*;

import app.entity.*;
import app.query.*;
import app.render.Render;

@Transactional
@Controller
public class Loginpage {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;

	// LOGIN
	// Session for user
	// Session for carttribute(
	// Check if email is existed ? return : redirect
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(ModelMap model, HttpServletResponse res, HttpSession ss) throws IOException {
		if(ss.getAttribute("user") == null){
		model.addAttribute("link", "public");
		return "user/login";
		}else
		{
//			model.addAttribute("link", "public");
			return "redirect:./home.htm";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession ss)
			throws IOException {
		String email = req.getParameter("email").trim();
		String password = req.getParameter("password").trim();
		Session session = factory.getCurrentSession();
		PrintWriter out = res.getWriter();
		
		String hql = "FROM User u WHERE u.email = '" + email + "'";
		Query query = session.createQuery(hql);
		User check = (User) query.uniqueResult();
		if (check != null) {
			if (check.getPassword().trim().equals(password)) {
				out.print(check.getLastname().trim());
				ss.setAttribute("user", check);
				ss.setAttribute("cart", new ArrayList<Detail>());
				System.out.println("Put in the session >> user [ "+email+" ]");
				return;
			} else {
				out.print("false");
				return;
			}
		} else {
			out.print("");
			return;
		}
		// out.print(check);
		// return;
		// out.print("dont hav");
		// }
	}
	@RequestMapping("/logout")
	public String logout(ModelMap model, HttpServletResponse res, HttpSession ss) throws IOException {
		ss.removeAttribute("user");
		ss.removeAttribute("cart");
		model.addAttribute("link", "public");
		return "user/login";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void registerPOST(ModelMap model, HttpServletRequest req, HttpServletResponse res,
			@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname,
			@RequestParam("birthday") String birthday, @RequestParam("gender") boolean gender,
			@RequestParam("email") String email, @RequestParam("password") String password) throws IOException {
		UserQuery uq = new UserQuery(factory);
		PrintWriter out = res.getWriter();
		List<User> list = uq.getAll();
		for (User i : list) {
			if (i.getEmail().trim().equals(email.trim())) {
				out.print("");
				return;
			}
		}
		User n_u = new User();
		n_u.setFirstname(firstname.trim());
		n_u.setLastname(lastname.trim());
		n_u.setEmail(email.trim());
		n_u.setGender(gender);
		n_u.setPassword(password.trim());
		n_u.setBirthday(birthday.trim());
		uq.add(n_u);
		out.print("true");
		return;
	}

	// FORGOT PASSWORD
	// 0 . Show Client form
	@RequestMapping(value = "/changepw", method = RequestMethod.GET)
	public String changepwGET(ModelMap model, @ModelAttribute User user, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		model.addAttribute("mode", 3);
		return "user/login";
	}
	// 1 . Sending Email to Client due to his/her Email && Confirm the code
	// inside that mail

	@RequestMapping(value = "/changepw", method = RequestMethod.POST)
	public void changepwPOST(ModelMap model, @ModelAttribute User user, HttpServletRequest req,
			HttpServletResponse res, @RequestParam("email") String email) throws IOException {
		model.addAttribute("mode", 3);
		// Nếu Email có tồn tại trong database
		Session session = factory.getCurrentSession();
		String hql = "FROM User u WHERE u.email = :data";
		Query query = session.createQuery(hql);
		query.setParameter("data", email.trim());
		User onlyEmail = (User) query.uniqueResult();
		PrintWriter out = res.getWriter();
		if (onlyEmail != null) {
			int c = 0;
			for (int i = 0; i < 6; i++) {
				c += (int) (Math.random() * (9 - 0 + 1) + 0);
				c *= 10;
			}
			String code = c + "";
			String from = "xakich13@gmail.com";
			String to = "daiphan308@gmail.com";
			String subject = "From Elearning";
			String body = "Hi "+email+", type this is code " + code +" into input and reset password";
			try {
				// Tạo Mail
				MimeMessage mail = mailer.createMimeMessage();
				// Sử dụng lớp Helper
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);
				helper.setTo(to);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body, true);

				// Gửi mail
				mailer.send(mail);
				out.print(code+","+onlyEmail.getId());
				return;
			} catch (Exception ex) {
				System.out.print(ex);
				out.print("");
				return;
			}
		} else {
			out.print("false");
			return;
		}
		
	}

	// 2. Get new Password and one again type new rePassword to confirm Client
	// has changed his/her password
	@RequestMapping(value = "/confirmpw", method = RequestMethod.POST)
	public void confirmpwGET(ModelMap model, @ModelAttribute User user, HttpServletRequest req,
			HttpServletResponse res, @RequestParam("pass") String pass,
			@RequestParam("id") int id) throws IOException {
			UserQuery uq = new UserQuery(factory);
			Session session = factory.getCurrentSession();
			User u = (User) session.get(User.class, id);
			if(!pass.equals(u.getPassword().trim())){
			u.setPassword(pass);
			uq.update(u);
			}

	}
	// REGISTER
	// Check REGEX and Null
	// Insert Table User *
	// FORGOT PASSWORD
	// Sending mail
	// Confirm code
	// Change Password ( at least 8 characters )

}
