package com.CR.web_api.projects;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

public class ProjectService {
    private final ProjectRepository projectRepository;

    public ProjectService(ProjectRepository projectRepository){
        this.projectRepository = projectRepository;
    }

    public List<Project> getAll() {
        return projectRepository.findAll();
    }

    public Project getById(Long id) {
        return projectRepository.findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Project not found: " + id));
    }

    public List<Project> findByTopic(String topic) {
        return projectRepository.findByTopicContainingIgnoreCase(topic);
    }

    public Project findByStatus(String status) {
        return projectRepository.FindByStatus(status);
    }
}
