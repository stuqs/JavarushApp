package net.stuqs.usermanager.controller;

import net.stuqs.usermanager.model.User;
import net.stuqs.usermanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUser());

        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        if(user.getId() == 0){
            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }

        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/users";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editUserGet(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "edit";
    }

    @RequestMapping(value = "edit/id", method = RequestMethod.POST)
    public String editUserPost(@ModelAttribute("user") User user) {
        this.userService.updateUser(user);

        return "redirect:/users";
    }

    @RequestMapping(value = "userdata/{id}", method = RequestMethod.GET)
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "userdata";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchPost(@ModelAttribute("user") User user, Model model) {
        if ((user == null) || (user.getName() == null)) {
            user = new User();
            user.setName("");
        }
        List<User> allFound = this.userService.searchForUser(user.getName());
        model.addAttribute("foundUsers", allFound);

        return "search";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchGet(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUser());

        return "redirect:/users";
    }
}