
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.util.Date;

void sendMail(String address, String fileName) {
  // fileName = "#####image.jpg#####"
  
  // Create a session
  String host="smtp.gmail.com";
  Properties props=new Properties();

  // SMTP Session
  props.put("mail.transport.protocol", "smtp");
  props.put("mail.smtp.host", host);
  props.put("mail.smtp.port", "587");
  props.put("mail.smtp.auth", "true");
  // We need TTLS, which gmail requires
  props.put("mail.smtp.starttls.enable", "true");

  // Create a session
  Session session = Session.getDefaultInstance(props, new Auth());

  try
  {
    image(sending[1], 0, 0);
    MimeMessage msg=new MimeMessage(session);
    msg.setFrom(new InternetAddress("rkdalsrn990929@gmail.com", "Popfie"));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(address));
    msg.setSubject("Email with Processing");
    BodyPart messageBodyPart = new MimeBodyPart();
    // Fill the message
    messageBodyPart.setText("Email sent with Processing");
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);
    // Part two is attachment
    messageBodyPart = new MimeBodyPart();
    DataSource source = new FileDataSource(sketchPath() + "/" + fileName);
    messageBodyPart.setDataHandler(new DataHandler(source));
    messageBodyPart.setFileName(fileName);
    multipart.addBodyPart(messageBodyPart);
    msg.setContent(multipart);
    msg.setSentDate(new Date());
    Transport.send(msg);
    println("Mail sent!");
    successSending = true;
    
  }
  catch(Exception e)
  {
    //e.printStackTrace();
    successSending = true;
  }
}
