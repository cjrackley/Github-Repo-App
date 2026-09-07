package com.CR.web_api.projects;

import java.io.InputStream;

import javax.management.RuntimeErrorException;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import jakarta.transaction.Transaction;

import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.transaction.support.TransactionTemplate;

@Controller
@RequestMapping("/")
public class ProjectUiController {

    private final ProjectService projectService;

    private final TransactionTemplate transactionTemplate;

    public ProjectUiController(ProjectService projectService, TransactionTemplate transactionTemplate) {
        this.projectService = projectService;
        this.transactionTemplate = transactionTemplate;
    }

    @GetMapping("/projects")
    public String getAllProjects(Model model) {
        model.addAttribute("projectList", projectService.getAllProjects());
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

    @GetMapping("/picture/{id}")
    public ResponseEntity<StreamingResponseBody> streamProjectImage(@PathVariable Long id) {

        StreamingResponseBody stream = outputStream -> {
            transactionTemplate.execute(status -> {
                try (InputStream imageStream = projectService.getProjectImageStreamInsideTx(id)) {
                    StreamUtils.copy(imageStream, outputStream);
                    outputStream.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException("Streaming failed", e);
                }
                return null;
            });
        };

        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(stream);
    }
}
