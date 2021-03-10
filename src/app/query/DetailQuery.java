package app.query;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import app.entity.Detail;

public class DetailQuery {
private SessionFactory ftr;
	
	public DetailQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(Detail Detail){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(Detail);
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
	public List<Detail> getAll(){
		Session session = ftr.getCurrentSession();
		List<Detail> list = session.createQuery("FROM Detail").list();
		return list;
	}
	public Detail get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Detail WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (Detail)query.uniqueResult()== null? null: (Detail)query.uniqueResult();
	}

	public void update(Detail Detail){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(Detail);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
	public void delete(Detail Detail){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(Detail);
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
