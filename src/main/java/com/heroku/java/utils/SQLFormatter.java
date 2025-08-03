package com.heroku.java.utils;

import java.util.UUID;
import java.util.Date;

public class SQLFormatter {
    public static String formatString(String str) {
        if (str == null) {
            return "NULL";
        }
        return "'" + str + "'";
    }

    public static String formatDate(Date date) {
        if (date == null) {
            return "NULL";
        }
        return formatString(String.format("%tY-%tm-%td", date, date, date));
    }

    public static String formatUUID(UUID id) {
        if (id == null) {
            return "NULL";
        }
        return formatString(id.toString());
    }

    public static String formatStringArray(String[] arr) {
        if (arr == null) {
            return "NULL";
        }
        String[] values = new String[arr.length];
        for (int i = 0; i < arr.length; i++) {
            values[i] = formatString(arr[i]);
        }
        return "ARRAY [ " + String.join(", ", values) + " ]";
    }

    public static String formatUUIDArray(UUID[] arr) {
        if (arr == null) {
            return "NULL";
        }
        String[] values = new String[arr.length];
        for (int i = 0; i < arr.length; i++) {
            values[i] = formatUUID(arr[i]);
        }
        return "ARRAY [" + String.join(", ", values) + " ]::UUID[]";
    }
}