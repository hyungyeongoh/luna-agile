package egovframework.com.cop.ems.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cop.ems.service.EgovSndngMailService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("egovSndngMailService")
public class EgovSndngMailServiceImpl extends EgovAbstractServiceImpl implements EgovSndngMailService {
	
	
	private static final Logger Log = Logger.getLogger(EgovSndngMailServiceImpl.class);
 
    public boolean sndngMail(SndngMailVO sndngMailVO) throws Exception {

    	String recptnPerson = (sndngMailVO.getRecptnPerson() == null) ? "" : sndngMailVO.getRecptnPerson();          
    	String subject = (sndngMailVO.getSj() == null) ? "" : sndngMailVO.getSj();                                   
    	String emailCn = (sndngMailVO.getEmailCn() == null) ? "" : sndngMailVO.getEmailCn();                         
    	try{
	    	
	    	
	    	Properties props = System.getProperties();
	    	
	    	
	        props.put("mail.smtp.host", EgovProperties.getProperty("Globals.smtp.host"));
	        props.put("mail.smtp.port", EgovProperties.getProperty("Globals.smtp.port"));
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.ssl.trust",EgovProperties.getProperty("Globals.smtp.host"));
	        
	        
	        final String urId = EgovProperties.getProperty("Globals.smtp.id"); 
	        
            final String dePw = EgovFileScrty.decode(EgovProperties.getProperty("Globals.smtp.pw"));
            
	        
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            String un=urId;
	            String pw=dePw;
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(un, pw);
	            }
	        });
	        session.setDebug(true); 
	    	
	        Message mimeMessage = new MimeMessage(session);
	        mimeMessage.setFrom(new InternetAddress(sndngMailVO.getDsptchPerson()));
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recptnPerson));
	        mimeMessage.setSubject(subject);
	        mimeMessage.setText(emailCn);
	    	
	        
	        
	        Transport.send(mimeMessage);
	    	return true;
	    	
    	}catch (MailParseException ex) {
			sndngMailVO.setSndngResultCode("F"); 
			Log.error("Sending Mail Exception : {} [failure when parsing the message]", ex.getCause());
			return false;
			
		} catch (MailAuthenticationException ex) {
			sndngMailVO.setSndngResultCode("F"); 
			Log.error("Sending Mail Exception : {} [authentication failure]", ex.getCause());
			return false;
			
		} catch (MailSendException ex) {
			sndngMailVO.setSndngResultCode("F"); 
			ex.printStackTrace();
			Log.error("Sending Mail Exception : {} [failure when sending the message]", ex.getCause());
			return false;
			
		} catch (Exception ex) {
			sndngMailVO.setSndngResultCode("F"); 
			Log.error("Sending Mail Exception : {} [unknown Exception]", ex.getCause());
			Log.debug(ex.getMessage());
			return false;
			
		}
    }
}