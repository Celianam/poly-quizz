package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class ThemeRepository 
{
	public static List<Theme> findAll()
	{
		List<Theme> listThemes = new ArrayList<Theme>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from Theme");
			Iterator<Theme> themes = query.iterate();
			
			while(themes.hasNext())
			{
				listThemes.add((Theme)themes.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listThemes;
	}
}
