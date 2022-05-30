/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.security ;
import com.mycompany.jv30_spring_coffee.entities.AccountEntity;
import com.mycompany.jv30_spring_coffee.entities.RoleEntity;
import com.mycompany.jv30_spring_coffee.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 *
 * @author AnhLe
 */
@Component
public class CustomAuthenticationProvider implements
        AuthenticationProvider {

    @Autowired
    private AccountService accountService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String email = a.getName().trim();
        String password = a.getCredentials().toString().trim();
        if (!StringUtils.isEmpty(email)
                && !StringUtils.isEmpty(password)) {
            AccountEntity account = accountService.findAccountByEmailAndPassword(email, password);
            if (account != null && account.getId() > 0) {
                List<GrantedAuthority> roles = new ArrayList<>();
                for (RoleEntity accountRole : account.getRoles()) {
                    roles.add(
                            new SimpleGrantedAuthority(accountRole.getRole().toString().trim())
                    );
                }
                return new UsernamePasswordAuthenticationToken(account, account.getEmail(), roles);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
