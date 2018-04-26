package net.skhu.tryWithResource;

import java.io.BufferedReader;
import java.io.FileReader;

public class Example2 {
	static void printFile(String 파일명) throws Exception {
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(파일명));
			String s;
			while ((s = reader.readLine()) != null) {
				System.out.println(s);
			}
		} finally {
			if (reader != null)
				reader.close();
		}
	}

	//printFile 메소드가 정상적으로 리턴하게 될 때 뿐만 아니라
	//실행 도중 에러가 발생해 리턴하게 될 때에도
	//finally은 반드시 실행 -> BufferedReader의 close메소드가 반드시 호출됨
	public static void main(String[] args) throws Exception {
		String 파일명 = "e:/temp/테스트.txt";
		printFile(파일명);
	}
}