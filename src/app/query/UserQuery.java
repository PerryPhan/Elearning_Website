package app.query;
import org.hibernate.*;
import app.entity.*;
import java.util.*;


public class UserQuery {
	
	private SessionFactory ftr;
	
	public UserQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(User user){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(user);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
			System.out.print(e);
		}
		finally{
			session.close();
		}
	}
	public List<User> getAll(){
		Session session = ftr.getCurrentSession();
		Query query = session.createQuery("FROM User");
		List<User> list = query.list();
		return list;
	}
	public User get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM User WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (User)query.uniqueResult()== null? null: (User)query.uniqueResult();
	}

	public void update(User user){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(user);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
}
