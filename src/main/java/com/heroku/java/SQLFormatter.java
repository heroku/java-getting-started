package com.heroku.java;

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
}