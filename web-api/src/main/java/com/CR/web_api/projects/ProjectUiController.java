package com.CR.web_api.projects;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;

@Controller
@RequestMapping("/project")
public class ProjectUiController {
    private final ProjectService projectService;

    public ProjectUiController(ProjectService projectService) {
        this.projectService = projectService;
    }

}
