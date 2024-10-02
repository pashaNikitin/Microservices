package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private RestTemplate restTemplate;

    private final String API_URL = "http://94.198.50.185:7081/api/users";
    private String sessionId;

    public List<User> getAllUsers() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        if (sessionId != null) {
            headers.set("Cookie", sessionId);
        }
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<List<User>> response = restTemplate.exchange(
                API_URL,
                HttpMethod.GET,
                entity,
                new ParameterizedTypeReference<List<User>>() {}
        );

        // Сохраняем session id из заголовка ответа
        if (response.getHeaders().containsKey("Set-Cookie")) {
            sessionId = response.getHeaders().getFirst("Set-Cookie");
        }

        return response.getBody();
    }

    public ResponseEntity<String> addUser(User user) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Cookie", sessionId);
        HttpEntity<User> entity = new HttpEntity<>(user, headers);

        return restTemplate.exchange(
                API_URL,
                HttpMethod.POST,
                entity,
                String.class
        );
    }

    public ResponseEntity<String> updateUser(User user) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Cookie", sessionId);
        HttpEntity<User> entity = new HttpEntity<>(user, headers);

        return restTemplate.exchange(
                API_URL,
                HttpMethod.PUT,
                entity,
                String.class
        );
    }

    public ResponseEntity<String> deleteUser(Long userId) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Cookie", sessionId);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        return restTemplate.exchange(
                API_URL + "/" + userId,
                HttpMethod.DELETE,
                entity,
                String.class
        );
    }
}