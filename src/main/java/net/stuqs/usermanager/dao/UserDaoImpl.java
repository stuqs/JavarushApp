package net.stuqs.usermanager.dao;

import net.stuqs.usermanager.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class UserDaoImpl implements UserDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, id);

        if(user!=null){
            session.delete(user);
        }
    }

    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return (User) session.get(User.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<User> listUser() {
        Session session = this.sessionFactory.getCurrentSession();

        return session.createQuery("FROM User").list();
    }

    @SuppressWarnings("unchecked")
    public List<User> searchForUser(String searchText) {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "FROM User U WHERE U.name LIKE \'%" + searchText +"%\'";
        return session.createQuery(hql).list();
    }
}