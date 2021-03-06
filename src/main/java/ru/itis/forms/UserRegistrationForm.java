package ru.itis.forms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class UserRegistrationForm {
    private String username;
    private String password;
    private String name;
    private String email;
    private String phone;
}
