package com.example.demo.controller;

import com.example.demo.dao.EventDao;
import com.example.demo.model.Event;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class EventController {

    @Autowired
    private EventDao eventDao;

    @GetMapping("/events")
    public String listEvents(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("admin")) {
            List<Event> events = eventDao.getAllEvents();
            model.addAttribute("events", events);
            return "events";
        } else {
            List<Event> events = eventDao.getAllEvents();
            model.addAttribute("events", events);
            return "student-events";
        }
    }

    @GetMapping("/event/{id}/register")
    public String registerForEvent(@PathVariable("id") Long id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("student")) {
            Event event = eventDao.getEventById(id);
            if (event != null) {
                eventDao.registerForEvent(user, event);
                return "redirect:/events";
            }
        }
        return "redirect:/events";
    }

    @GetMapping("/event/create")
    public String showCreateEventForm(Model model) {
        model.addAttribute("event", new Event());
        return "create-event";
    }

    @PostMapping("/event/create")
    public String createEvent(@ModelAttribute("event") @Valid Event event, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "create-event";
        }

        eventDao.createEvent(event);
        return "redirect:/events";
    }

    @GetMapping("/event/{id}/edit")
    public String showEditEventForm(@PathVariable("id") Long id, Model model) {
        Event event = eventDao.getEventById(id);
        if (event == null) {
            // Handle the case where the event is not found
            return "redirect:/events";
        }
        model.addAttribute("event", event);
        return "edit-event";
    }

    @PostMapping("/event/edit")
    public String updateEvent(@ModelAttribute("event") @Valid Event event, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "edit-event";
        }

        eventDao.updateEvent(event);
        return "redirect:/events";
    }

    @GetMapping("/event/{id}/delete")
    public String deleteEvent(@PathVariable("id") Long id) {
        eventDao.deleteEvent(id);
        return "redirect:/events";
    }
}