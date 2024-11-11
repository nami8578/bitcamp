package org.eightbit.damdda.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.eightbit.damdda.common.domain.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "project_images")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProjectImage extends BaseEntity {

    @ManyToOne
    @JsonIgnore
    private Project project;

    private String url;
    private int ord;
    private String fileName;

    @ManyToOne
    private ProjectImageType imageType;

}
