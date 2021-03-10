package app.query;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import app.entity.Course;
import app.entity.Test;

public class TestQuery {
private SessionFactory ftr;
	
	public TestQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(Test Test){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(Test);
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
	public List<Test> getList(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Test WHERE "+pattern;
		Query query = session.createQuery(hql);
		List<Test> list = query.list();
		return list;
	}
	public List<Test> getAll(){
		Session session = ftr.getCurrentSession();
		List<Test> list = session.createQuery("FROM Test").list();
		return list;
	}
	public Test get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Test WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (Test)query.uniqueResult()== null? null: (Test)query.uniqueResult();
	}

	public void update(Test Test){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(Test);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
	public void delete(Test Test){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(Test);
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
