package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner2 {

	@Karate.Test
	public Karate test2() {

		return Karate.run("classpath:feature").tags("Random");
	}

}
