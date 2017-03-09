package net.stuqs.usermanager.dao;

import net.stuqs.usermanager.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUser();
    List<User> searchForUser(String searchText);
}