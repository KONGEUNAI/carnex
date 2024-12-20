package org.carnex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/static/*")
public class StaticController {
	
	@GetMapping("/aboutus")
	public void aboutUs() {}
	
	@GetMapping("/campaign")
	public void campaign() {}
	
	@GetMapping("/deal")
	public void deal() {}
	
	@GetMapping("/model")
	public void model() {}
	
	@GetMapping("/pay")
	public void pay() {}
	
	@GetMapping("/faq")
	public void faq() {}
}
