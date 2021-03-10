package app.query;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import app.entity.Course;

public class CourseQuery {
private SessionFactory ftr;
	
	public CourseQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(Course Course){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(Course);
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
	public List<Course> getAll(){
		Session session = ftr.getCurrentSession();
		List<Course> list = session.createQuery("FROM Course").list();
		return list;
	}
	public List<Course> getList(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Course WHERE "+pattern;
		Query query = session.createQuery(hql);
		List<Course> list = query.list();
		return list;
	}
	public Course get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Course WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (Course)query.uniqueResult()== null? null: (Course)query.uniqueResult();
	}

	public void update(Course Course){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(Course);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
	public void delete(Course Course){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(Course);
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
