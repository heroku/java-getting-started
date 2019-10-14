package com.example;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("facebook")
public class WebhookController {

	@GetMapping("webhook")
	public ResponseEntity getVerifyToken(
	@RequestParam("hub.verify_token") String token,
	@RequestParam("hub.challenge") String challenge,
	@RequestParam("hub.mode") String mode) {
	String ACCESS_TOKEN= "INNOEYE";
	System.out.println("token"+token+" challenge "+challenge+" mode"+mode);
	if(token!=null & ACCESS_TOKEN.equalsIgnoreCase(token)) {
	return new ResponseEntity("CHALLENGE_ACCEPTED",HttpStatus.OK);
	}
	else {
	return new ResponseEntity("NOT CHALLENGE_ACCEPTED",HttpStatus.FORBIDDEN);
	}
	}


	
}
