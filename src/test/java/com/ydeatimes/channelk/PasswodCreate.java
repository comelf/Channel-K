package com.ydeatimes.channelk;

import com.ydeatimes.channelk.auth.Crc32;
import com.ydeatimes.channelk.auth.PhPass;

public class PasswodCreate {
	public static void main(String[] args) {
		String userId 		= "admin";
		String password 	= "dddd";
		
		Crc32 crc = new Crc32();
		System.out.println(crc.getCode(userId));
		PhPass pass = new PhPass(8);
		
		String passHash = pass.HashPassword(password);
		System.out.println(passHash);
		System.out.println(passHash.length());
		
	}
}
