package com.CR.web_api.projects;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface ProjectRepository extends JpaRepository<Project, Long>{

    List<Project> findByTitleContainingIgnoreCaseOrTopicsContainingIgnoreCase(String titleKeyword, String topicsKeyword);

}
