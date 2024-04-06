package com.targetindia.programs;
public class NumberToWords {
    
    private static final String[] units = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                                            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    
    private static final String[] tens = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
    
    public static String inWords(int num) {
        if (num == 0) {
            return "zero";
        }
        return convertToWords(num);
    }
    
    private static String convertToWords(int num) {
        if (num < 20) {
            return units[num];
        }
        if (num < 100) {
            return tens[num / 10] + ((num % 10 != 0) ? " " + units[num % 10] : "");
        }
        if (num < 1000) {
            return units[num / 100] + " hundred" + ((num % 100 != 0) ? " " + convertToWords(num % 100) : "");
        }
        if (num < 100000) {
            return convertToWords(num / 1000) + " thousand" + ((num % 1000 != 0) ? " " + convertToWords(num % 1000) : "");
        }
        if (num < 10000000) {
            return convertToWords(num / 100000) + " lakh" + ((num % 100000 != 0) ? " " + convertToWords(num % 100000) : "");
        }
        return convertToWords(num / 10000000) + " crore" + ((num % 10000000 != 0) ? " " + convertToWords(num % 10000000) : "");
    }
    
    public static void main(String[] args) {
        int[] numbers = {12345, 10203040, 101};
        
        for (int num : numbers) {
            System.out.println(num + " in words: " + inWords(num));
        }
    }
}
