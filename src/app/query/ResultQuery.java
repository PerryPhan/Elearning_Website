package app.query;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import app.entity.Result;

public class ResultQuery {
private SessionFactory ftr;
	
	public ResultQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(Result Result){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(Result);
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
	public List<Result> getAll(){
		Session session = ftr.getCurrentSession();
		List<Result> list = session.createQuery("FROM Result").list();
		return list;
	}
	public Result get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Result WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (Result)query.uniqueResult()== null? null: (Result)query.uniqueResult();
	}

	public void update(Result Result){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(Result);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
	public void delete(Result Result){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(Result);
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
