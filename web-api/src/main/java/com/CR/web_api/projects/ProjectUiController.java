package com.CR.web_api.projects;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;


@Controller
@RequestMapping("/projects")
public class ProjectUiController {

    private final ProjectService projectService;

    public ProjectUiController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping()
    public String getAllProjects(Model model) {
        model.addAttribute("ProjectList", projectService.getAllProjects());
        return "index";
    }

    @GetMapping("details/{id}")
    public String getProjectById(@PathVariable long id, Model model) {
        Project project = projectService.getById(id);
        model.addAttribute("project", project);
        return "details";
    }

    @GetMapping("/search") 
    public String searchProjects(String query, Model model) {
        model.addAttribute("projectList", projectService.searchProjects(query));
        return "index";
    }
}
