package net.skhu.tryWithResource;

import java.io.BufferedReader;
import java.io.FileReader;

public class Example1 {
	static void printFile(String 파일명) throws Exception {
		BufferedReader reader = new BufferedReader(new FileReader(파일명));
		String s;
		while ((s = reader.readLine()) != null) {
			System.out.println(s);
		}
		reader.close();
	}
	//printFile 메소드를 실행하는 도중에 에러가 발생하면
	//BufferedReader객체가 close 되지 않는 문제 발생
	public static void main(String[] args) throws Exception {
		String 파일명 = "e:/temp/테스트.txt";
		printFile(파일명);
	}
}