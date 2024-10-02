package com.boots.restController;

import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/registration")
public class RegistrationRestController {

    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<String> addUser(@RequestBody @Valid User userForm) {
        if (!userForm.getPassword().equals(userForm.getPasswordConfirm())) {
            return new ResponseEntity<>("Пароли не совпадают", HttpStatus.BAD_REQUEST);
        }
        if (!userService.saveUser(userForm)) {
            return new ResponseEntity<>("Пользователь с таким именем уже существует", HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>("Пользователь успешно зарегистрирован", HttpStatus.CREATED);
    }
}