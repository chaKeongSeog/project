package com.spring.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

   
    public class EmailSender  {
         
        @Autowired
        protected JavaMailSender  mailSender;
        
        public void SendEmail(String title,String email,String content) throws Exception {
             
            MimeMessage msg = mailSender.createMimeMessage();
            try {
                msg.setSubject(title);
                msg.setText(content);
                msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email));
               
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
            }
            try {
                mailSender.send(msg);
            }catch(MailException e) {
                System.out.println("MailException발생");
                e.printStackTrace();
            }
        }
}

