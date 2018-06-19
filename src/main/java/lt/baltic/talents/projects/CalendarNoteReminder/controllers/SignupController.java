package lt.baltic.talents.projects.CalendarNoteReminder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lt.baltic.talents.projects.CalendarNoteReminder.models.User;
import lt.baltic.talents.projects.CalendarNoteReminder.services.UserService;

@Controller
public class SignupController {

	
	@Autowired
    private UserService userService;
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Model model) {
		userService.create(new User());
		
		return "redirect:/signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model, 
			@RequestParam(value = "user", required = true) String userParam,
			@RequestParam(value = "pwd", required = true) String pwd, RedirectAttributes redirectAttributes) {
		
		if (userParam == null || pwd == null) { 
			return "signup/signup"; 
		}
		
		User user = new User(userParam, pwd.toCharArray());
		
		boolean signup = userService.signup(user);
		
		if (signup) {
			redirectAttributes.addFlashAttribute("user", user);
			return "redirect:/";
		}
		
		return "signup/failure";
	}
	
}
