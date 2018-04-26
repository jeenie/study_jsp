package net.skhu.tryWithResource;

import java.io.BufferedReader;
import java.io.FileReader;

public class Example3 {
	static void printFile(String 파일명) throws Exception {
		try (BufferedReader reader = new BufferedReader(new FileReader(파일명))) {
			String s;
			while ((s = reader.readLine()) != null) {
				System.out.println(s);
			}
		}
	}

	public static void main(String[] args) throws Exception {
		String 파일명 = "e:/temp/테스트.txt";
		printFile(파일명);
	}
}