package com.CR.web_api.projects;

import java.io.IOException;
import java.io.InputStream;

import javax.management.RuntimeErrorException;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transaction;

import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.transaction.support.TransactionTemplate;

@Controller
@RequestMapping("/projects")
public class ProjectUiController {

    private final ProjectService projectService;

    private final TransactionTemplate transactionTemplate;

    public ProjectUiController(ProjectService projectService, TransactionTemplate transactionTemplate) {
        this.projectService = projectService;
        this.transactionTemplate = transactionTemplate;
    }

    @GetMapping()
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
    public String searchProjects(
        @RequestParam(name = "query", required = false, defaultValue = "") String query, Model model) {
            String q = query.trim();
            model.addAttribute("query", q);
            model.addAttribute("projectList", q.isEmpty() ? projectService.getAllProjects() : projectService.searchProjects(q));
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

    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("project", new Project());
        return "form";
    }

    
    @PostMapping("/save")
    public String createProject(Project project, MultipartFile projectImageFile, HttpSession session) {
        Project created = projectService.createProject(project);
        if (projectImageFile != null && !projectImageFile.isEmpty()) {
            try {
                projectService.saveProjectImage(created.getId(), projectImageFile.getInputStream());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        session.setAttribute("projectId", created.getId());
        return "redirect:/projects";
    }
    
}
