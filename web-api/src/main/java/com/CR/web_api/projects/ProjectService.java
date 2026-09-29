package com.CR.web_api.projects;

import java.io.InputStream;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import org.springframework.stereotype.Service;

@Service
public class ProjectService {
    private final ProjectRepository projectRepository;

    public ProjectService(ProjectRepository projectRepository){
        this.projectRepository = projectRepository;
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Project getById(Long id) {
        return projectRepository.findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Project not found: " + id));
    }

    public List<Project> searchProjects(String keyword) {
        return projectRepository.findByTitleContainingIgnoreCaseOrTopicsContainingIgnoreCase(keyword, keyword);
    }

    public InputStream getProjectImageStreamInsideTx(Long id) {
        Project project = projectRepository.findById(id).orElse(null);
        try{
            if (project != null && project.getImage() != null) {
                return project.getImage().getBinaryStream();
            } else {
                ClassPathResource defaultImage = new ClassPathResource("static/question.jpg");
                return defaultImage.getInputStream();
            }
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Error retrieving picture for provider with id: " + id, e);
        }
    }
    
}
