package com.heroku.aus.test;


import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.heroku.aus.hello.Utility;

public class TestUtility {

	int num1;
	int num2;
	
	@BeforeClass
	public void setup() {
		num1 = 2;
		num2 = 3;
	}
	
	@Test
	public void testNumberAdd() {
		Utility u = new Utility();
		int result = u.addTwoNumbers(num1, num2);
		Assert.assertEquals(5, result);
		
	}
	
	@Test
	public void testNumberMultiply() {
		Utility u = new Utility();
		int result = u.multiplyTwoNumbers(2, 3);
		Assert.assertEquals(6, result);
	}
}
