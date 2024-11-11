package org.eightbit.damdda.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.eightbit.damdda.common.domain.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "project_documents")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProjectDocument extends BaseEntity {

    @ManyToOne
    @JsonIgnore
    private Project project;

    private int ord;
    private String fileName;
    private String url;

}

