package com.example.demo.repository;

import org.springframework.stereotype.Repository;
import com.example.demo.model.User;

import java.util.List;

@Repository
public interface UserDao {
    void createTableUsers();
    void dropTableUsers();
    void saveUser(User user);
    User getUserById(Long id);
    List<User> getAllUsers();
    void updateUser(User user);
    void deleteUser(Long id);

}
