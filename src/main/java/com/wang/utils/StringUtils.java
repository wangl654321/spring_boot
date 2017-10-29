package com.wang.utils;

public class StringUtils {

	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNotBlank(String str) {
		if ((str != null) && !"".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}

	public static String formatLike(String str) {
		if (isNotBlank(str)) {
			return "%" + str + "%";
		} else {
			return null;
		}
	}
}
