package com.sist.cbox.utill;

import javax.servlet.http.Cookie;

public class CookieManager {

		public static String getCookie(Cookie[] coos, String name) {
			if(coos != null) {
				for(Cookie ck : coos) {
					if(name.equals(ck.getName())) {
						return ck.getValue();
					}
				}
			}
			return "";
		}
}
