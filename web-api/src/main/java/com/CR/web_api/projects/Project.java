package com.CR.web_api.projects;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "projects")
@Data
@NoArgsConstructor
public class Project {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String title;

    private String date;

    private String status;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String brief;

    @ElementCollection
    @CollectionTable(name = "project_topics", joinColumns = @JoinColumn(name = "project_id"))
    @Column(name = "topic")
    private List<String> topics;

    private String github;

    private String website;

    @Lob
    private Blob image;
}
