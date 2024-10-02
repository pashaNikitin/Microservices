package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;

import java.util.List;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

    @Autowired
    private UserService userService;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        // Получаем список всех пользователей и сохраняем session id
        List<User> users = userService.getAllUsers();
        users.forEach(System.out::println);

        // Добавляем нового пользователя
        User newUser = new User();
        newUser.setId(3L);
        newUser.setName("James");
        newUser.setLastName("Brown");
        newUser.setAge((byte) 30); // Укажите возраст на ваш выбор
        ResponseEntity<String> addResponse = userService.addUser(newUser);
        System.out.println("Add User Response: " + addResponse.getBody());

        // Изменяем пользователя с id = 3
        newUser.setName("Thomas");
        newUser.setLastName("Shelby");
        ResponseEntity<String> updateResponse = userService.updateUser(newUser);
        System.out.println("Update User Response: " + updateResponse.getBody());

        // Удаляем пользователя с id = 3
        ResponseEntity<String> deleteResponse = userService.deleteUser(3L);
        System.out.println("Delete User Response: " + deleteResponse.getBody());
    }
}