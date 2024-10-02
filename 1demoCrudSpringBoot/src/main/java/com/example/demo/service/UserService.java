package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.model.User;


import java.util.List;

@Service
public interface UserService {
    void createTableUsers();
    void dropTableUsers();
    void saveUser(User user);
    User getUserById(Long id);
    List<User> getAllUsers();
    void updateUser(User user);
    void deleteUser(Long id);

}
