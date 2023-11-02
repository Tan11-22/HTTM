package ptithcm.WebMovie.Security;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ptithcm.WebMovie.Model.User;
import ptithcm.WebMovie.Repository.UserRepository;

@Service
public class UserDetailService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    private HttpSession session;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getUserByUserName(username);
        System.out.println(username);
        if (user != null){
            session.setAttribute("user", user);
            return new MovieUserDetails(user);
        } throw new UsernameNotFoundException("Could not find username: " + username);
    }
}
