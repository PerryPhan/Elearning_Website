package app.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import app.query.DetailQuery;
import app.query.MajorQuery;
import app.query.UserQuery;

@Transactional
@Controller
public class Cartpage {
	@Autowired
	SessionFactory factory;
	// ============================================= SHOW CART PAGE ================================================
	@RequestMapping("/cartpage")
	public String cart(ModelMap model, HttpServletResponse res, HttpSession ss){
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
//			model.addAttribute("followcourse", "");
			return"redirect:./home.htm"; 
		}
		return "user/cartpage";
	}
	// ============================================= DELETE SESSION CART'S DETAILS ================================================
	@RequestMapping("/deldetail")
	public void deldetail( HttpServletResponse res,HttpSession ss
			,@RequestParam("id") int id) throws IOException{
		PrintWriter out = res.getWriter();
		if( id != 0 && ss.getAttribute("user") != null){
			List<Detail> cart = (List<Detail>) ss.getAttribute("cart");
			int i ;
			for( i = 0 ; i< cart.size(); i++){
				if(cart.get(i).getCourseidd().getId() == id)
					cart.remove(i);
					out.print("true");
				return;
			}
			out.print("false");
			return;
		}
		out.print("false");
		return;
	}
	// ================================================ CHECK OUT : CLEAR ALL & DO PAYMENT ====================================================================
	@RequestMapping("/checkout")
	public void checkout(HttpServletResponse res,HttpSession ss) throws IOException{
		PrintWriter out = res.getWriter();
		CartQuery cq = new CartQuery(factory);
		
		User user = (User) ss.getAttribute("user");
//		This line is select if your user have no cart in DB and so does paid one
		Cart existedCart = cq.get(" paid = false and useridc.id = "+user.getId());
		// Check if user have cart that not do payment yet  -> Create one 
		if( user != null){
			cq = new CartQuery(factory);
			// Find out in cart [ useridc = id of sessionScope.user.id]
			if( existedCart == null ){
				cq = new CartQuery(factory);
				Cart newCart = new Cart();
				newCart.setUseridc(user);
				cq.add(newCart);
				
			}
		}
		// If have or Create done => Do Payment
		existedCart = cq.get(" paid = false and useridc.id = "+user.getId());
		// Add cartid to sessionScope.List<Detail> cart
		
		// System.out.print(existedCart.getId()); WORK 
		DetailQuery dq = new DetailQuery(factory);
		List<Detail> list = (List<Detail>) ss.getAttribute("cart");
		
		for(Detail i : list){
			i.setCartid(existedCart);
			dq.add(i);
			UserQuery uq = new UserQuery(factory);
			User u = uq.get("id = "+i.getCourseidd().getInstruid().getId());
			u.setIncome( (float)(u.getIncome() + i.getCash()));
			uq.update(u);
		}
		
		// Handle Date Format 
		String pattern = "dd/MM/yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		// Add List<Detail> to Java.Entity.Cart.detail
			//	Add List<Detail>
		existedCart.setDetail(list);
			//  Set true
		existedCart.setPaid(true);
		    //  Set day : now
		existedCart.setDay(date);
		// Update Cart
		cq.update(existedCart);
		// Remove old sessionScope.List<Detail> cart and Create new one
		ss.removeAttribute("cart");
		ss.setAttribute("cart",  new ArrayList<Detail>());
		
		// After this Watch 3 Table : Cart, Detail , User.income
		out.print("true");
		return;
	}
}
