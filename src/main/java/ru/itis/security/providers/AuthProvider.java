package ru.itis.security.providers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itis.models.User;
import ru.itis.repositories.UsersRepository;

import java.util.Collection;
import java.util.Optional;

public class AuthProvider implements AuthenticationProvider {
    @Autowired
    UsersRepository usersRepository;

    @Autowired
    UserDetailsService userDetailsService;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();
        Optional<User> userOptional = usersRepository.findUserByUsername(username);

        if (userOptional.isPresent()) {
            User user = userOptional.get();

            if (!passwordEncoder.matches(password, user.getHashPassword())) {
                if (passwordEncoder.matches(password, user.getHashTempPassword())) {
                    user.setHashTempPassword(null);
                    usersRepository.save(user);
                }
            }
            else {
                throw new BadCredentialsException("Wrong password or login");
            }
        }
        else {
            throw new BadCredentialsException("Wrong password or login");
        }

        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();

        return new UsernamePasswordAuthenticationToken(userDetails, password, authorities);
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}