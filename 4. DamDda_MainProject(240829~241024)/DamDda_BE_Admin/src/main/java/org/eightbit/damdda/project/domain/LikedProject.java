package org.eightbit.damdda.project.domain;

import lombok.*;
import org.eightbit.damdda.common.domain.BaseEntity;
import org.eightbit.damdda.member.domain.Member;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name = "liked_projects")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LikedProject extends BaseEntity {
    @ManyToOne
    private Member member;
    @ManyToOne
    private Project project;

    private Timestamp likedAt;
}
