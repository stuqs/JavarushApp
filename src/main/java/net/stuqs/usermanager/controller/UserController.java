package net.stuqs.usermanager.controller;

import net.stuqs.usermanager.model.User;
import net.stuqs.usermanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collections;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private final static int PER_PAGE = 10;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users/{pageid}", method = RequestMethod.GET)
    public String listUsersPaging(@PathVariable int pageid, Model model) {
        List<User> listUsers = this.userService.listUser();
        Integer pages = (listUsers.size() % 10 == 0) ? listUsers.size() / 10 : listUsers.size() / 10 + 1;
        int indexStart = PER_PAGE * (pageid - 1);
        int indexEnd = PER_PAGE * pageid;
        if (indexStart > listUsers.size()) {
            listUsers = Collections.emptyList();
        } else if (indexEnd > listUsers.size()) {
            listUsers = listUsers.subList(indexStart, listUsers.size());
        } else {
            listUsers = listUsers.subList(indexStart, indexEnd);
        }

        model.addAttribute("user", new User());
        model.addAttribute("listUsers", listUsers);
        model.addAttribute("pages", pages);

        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        this.userService.addUser(user);

        return "redirect:/users/1";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/users/1";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editUserGet(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "edit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String editUserPost(@ModelAttribute("user") User user) {
        this.userService.updateUser(user);

        return "redirect:/users/1";
    }

    @RequestMapping(value = "userdata/{id}", method = RequestMethod.GET)
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "userdata";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchPost(@ModelAttribute("user") User user, Model model) {
        List<User> allFound = this.userService.searchForUser(user.getName());
        if ("".equals(user.getName())) {
            allFound = Collections.emptyList();
        }
        model.addAttribute("foundUsers", allFound);

        return "search";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchGet(Model model) {

        return "redirect:/users/1";
    }
}