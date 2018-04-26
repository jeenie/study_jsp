package net.skhu.tryWithResource;

class MyResource implements AutoCloseable {
	public MyResource() {
		System.out.println("자원이 할당됨");
	}

	public void 작업() throws Exception {
		System.out.println("작업 중 에러 발생");
		throw new Exception();
	}

	@Override
	public void close() throws Exception {
		System.out.println("자원이 반납됨");
	}
}

public class Example4 {
	public static void main(String[] args) throws Exception {
		try (MyResource resource = new MyResource()) {
			resource.작업();
		}
	}
}