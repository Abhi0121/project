package com.cebs.beans;


public class MailDetails 
{
	private static String content,subject,user,pass,toAddress;

	public static String getContent() {
		return content;
	}

	public static void setContent(String content) 
	{

		MailDetails.content = content;
	}

	public static String getSubject() {
		return subject;
	}

	public static void setSubject(String subject) {
		MailDetails.subject = subject;
	}

	public static String getUser() {
		return user;
	}

	public static void setUser(String user) {
		MailDetails.user = user;
	}

	public static String getPass() {
		return pass;
	}

	public static void setPass(String pass) {
		MailDetails.pass = pass;
	}

	public static String getToAddress() {
		return toAddress;
	}

	public static void setToAddress(String toAddress) {
		MailDetails.toAddress = toAddress;
	}

}
