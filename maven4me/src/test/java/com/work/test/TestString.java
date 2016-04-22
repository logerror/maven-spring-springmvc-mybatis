package com.work.test;
public class TestString {
	public static long testOverLoad(int a,int b){
		
		return (new Long(3));
	}
	
	public static int testOverLoad(int a,int b,int c){
		
		return (new Integer(5));
	}

	public static void main(String[] args) {
		String s1 = "Programming";
		String s2 = new String("Programming");
		String s3 = "Program" + "ming";
		System.out.println(s1 == s2);
		System.out.println(s1 == s3);
		System.out.println(s1 == s1.intern());
		System.out.println(s1.intern());
		
		System.out.println(TestString.testOverLoad(1,1,1));
	}

}
