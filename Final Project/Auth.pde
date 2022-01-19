
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Auth extends Authenticator {

  public Auth() {
    super();
  }

  public PasswordAuthentication getPasswordAuthentication() {
    String username, password;
    username = "rkdalsrn990929@gmail.com";
    password = "nav882122aa";
    System.out.println("authenticating. . ");
    return new PasswordAuthentication(username, password);
  }
}
