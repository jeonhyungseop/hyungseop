package kr.or.ddit;

import static org.junit.Assert.*;

import java.util.Map.Entry;

import org.junit.Test;

public class EnvAndPropTest {

	@Test
	public void test() {
		for(Entry<String, ?>  entry: System.getenv().entrySet()) {
			System.out.printf("%s:%s\n", entry.getKey(), entry.getValue());
		}
		
		for(Entry<Object, Object>  entry: System.getProperties().entrySet()) {
			System.out.printf("%s:%s\n", entry.getKey(), entry.getValue());
		}
	}

}
