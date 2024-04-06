/*A Java program to generate a calendar for given month and year*/


package com.targetindia.programs;
import java.util.Scanner;
public class Calendar {

    public static void printCalendar(int month, int year) {
        if (isValidMonth(month) && isValidYear(year)) {
            int daysInMonth = getDaysInMonth(month, year);
            int startingDay = getStartingDay(month, year);
            printHeader();
            printBody(startingDay, daysInMonth);
        } else {
            System.out.println("Invalid input. Please provide a valid month and year.");
        }
    }

    private static boolean isValidMonth(int month) {
        return month >= 1 && month <= 12;
    }

    private static boolean isValidYear(int year) {
        return year >= 0; // Assuming year 0 or greater is valid
    }

    private static int getDaysInMonth(int month, int year) {
        switch (month) {
            case 4: case 6: case 9: case 11:
                return 30;
            case 2:
                return isLeapYear(year) ? 29 : 28;
            default:
                return 31;
        }
    }

    private static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    private static int getStartingDay(int month, int year) {

        int daysSinceStart = 0;
        for (int i = 1800; i < year; i++) {
            daysSinceStart += isLeapYear(i) ? 366 : 365;
        }
        for (int i = 1; i < month; i++) {
            daysSinceStart += getDaysInMonth(i, year);
        }
        return (daysSinceStart + 3) % 7;
    }

    private static void printHeader() {
        System.out.println("Su Mo Tu We Th Fr Sa");
    }

    private static void printBody(int startingDay, int daysInMonth) {
        int currentDay = 1;
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 7; j++) {
                if (i == 0 && j < startingDay) {
                    System.out.print("   ");
                } else if (currentDay <= daysInMonth) {
                    System.out.printf("%2d ", currentDay++);
                }
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        printCalendar(8, 2018);
    }
}


