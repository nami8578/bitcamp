package org.eightbit.damdda.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.eightbit.damdda.common.domain.DateEntity;
import org.eightbit.damdda.member.domain.Member;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "projects")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = {"member","tags", "category"})
public class Project extends DateEntity {

    @ManyToOne
    @JsonIgnore
    private Member member;
    @ManyToOne
    private Category category;

    @ManyToMany
    @JoinTable(
            name = "project_tag",
            joinColumns = @JoinColumn(name = "project_id"),
            inverseJoinColumns = @JoinColumn(name = "tags_id")
    )
    private List<Tag> tags;

    private String title;
    private String description;
    private String descriptionDetail;
    private Timestamp startDate;
    private Timestamp endDate;
    private Long targetFunding;
    @ColumnDefault("0")
    private Long fundsReceive;
    @ColumnDefault("0")
    private Long supporterCnt;
    @ColumnDefault("0")
    private Long viewCnt;
    @ColumnDefault("0")
    private Long likeCnt;
    private String thumbnailUrl;
    private Timestamp submitAt;
}
