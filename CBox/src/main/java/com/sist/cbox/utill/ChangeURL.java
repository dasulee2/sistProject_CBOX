package com.sist.cbox.utill;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ChangeURL {
	
	public static String getURLformat(String q) {
		
		String newQ = null;
		try {
			newQ = URLEncoder.encode(q, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("url�� �ѱ� ����� ���� �߻�");
			e.printStackTrace();
		}
		return newQ;
	}
}
