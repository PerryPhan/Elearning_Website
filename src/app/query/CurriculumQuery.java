package app.query;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import app.entity.Course;
import app.entity.Curriculum;

public class CurriculumQuery {
private SessionFactory ftr;
	
	public CurriculumQuery(SessionFactory ftr){
		this.ftr = ftr;
	}
	
	public void add(Curriculum Curriculum){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(Curriculum);
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
	public List<Curriculum> getList(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Curriculum WHERE "+pattern;
		Query query = session.createQuery(hql);
		List<Curriculum> list = query.list();
		return list;
	}
	public List<Curriculum> getAll(){
		Session session = ftr.getCurrentSession();
		List<Curriculum> list = session.createQuery("FROM Curriculum").list();
		return list;
	}
	public Curriculum get(String pattern){
		Session session = ftr.getCurrentSession();
		String hql = "FROM Curriculum WHERE "+pattern;
		Query query = session.createQuery(hql);
		return (Curriculum)query.uniqueResult()== null? null: (Curriculum)query.uniqueResult();
	}

	public void update(Curriculum Curriculum){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(Curriculum);
			t.commit();
		}
		catch(Exception e){
			t.rollback();
		}
		finally{
			session.close();
		}
	}
	public void delete(Curriculum Curriculum){
		Session session = ftr.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(Curriculum);
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
