package com.heroku.aus;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.heroku.aus.hello.Utility;

public class TestUtility {

	private int numberOne;
	private int numberTwo;
	
	@Before
	public void setup() {
		numberOne = 2;
		numberTwo = 3;
	}
	
	@Test
	public void testNumberAdd() {
		Utility u = new Utility();
		int result = u.addTwoNumbers(numberOne, numberTwo);
		assertTrue("Expecting 5, received "+result, result == 5);
		
	}
	
	@Test
	public void testNumberMultiply() {
		Utility u = new Utility();
		int result = u.multiplyTwoNumbers(numberOne, numberTwo);
		assertTrue("Expecting 6, received "+result, result == 6);
	}
}
