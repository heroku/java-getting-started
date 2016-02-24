package org.friends.app.service.impl;

import static org.friends.app.Configuration.getMailServiceLogin;
import static org.friends.app.Configuration.getMailServicePassword;

import com.sendgrid.SendGrid;
import com.sendgrid.SendGridException;

public class MailServiceBean {

	public void sendMail() {
		SendGrid sendgrid = new SendGrid(getMailServiceLogin(), getMailServicePassword());

		SendGrid.Email email = new SendGrid.Email();
		email.addTo("example@example.com");
		email.setFrom("other@example.com");
		email.setSubject("Hello World");
		email.setText("My first email through SendGrid");

		try {
			SendGrid.Response response = sendgrid.send(email);
		} catch (SendGridException e) {
			System.out.println(e);
		}
	}
}
