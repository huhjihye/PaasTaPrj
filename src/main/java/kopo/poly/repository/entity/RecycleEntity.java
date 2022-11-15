package kopo.poly.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "RECYCLE_INFO")
@DynamicInsert
@DynamicUpdate
@Builder
@Entity
public class RecycleEntity {
    @Id
    @Column(name="RECYCLE_ID")
    private String recycleId;

    //분리배출 방법
    @Column(name="CONTENTS_1")
    private String contents1;

    //해당품목
    @Column(name="CONTENTS_2")
    private String contents2;

    //비해당품목
    @Column(name="CONTENTS_3")
    private String contents3;


}
