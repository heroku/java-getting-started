package com.heroku.aus.hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utility {

	Logger log;
	
	public Utility() {
		log = LoggerFactory.getLogger(this.getClass());
	}
	public int addTwoNumbers(int one, int two) {
		log.info("Attempting to add {} + {}", one, two);
		return one + two;
	}
	
	public int multiplyTwoNumbers(int one, int two) {
		log.info("Attempting to multiply {} * {}", one, two);
		return one * two;
	}
}
