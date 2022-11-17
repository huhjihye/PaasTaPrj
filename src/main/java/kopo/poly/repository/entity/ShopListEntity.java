package kopo.poly.repository.entity;


import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "SHOP_LIST_INFO_MAR")
@DynamicInsert
@DynamicUpdate
@Builder
@Entity
public class ShopListEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="SHOP_SEQ")
    private Long shopSeq;

    @NonNull
    @Column(name="SHOP_NAME", length  =500, nullable = false)
    private String shopName;

    @NonNull
    @Column(name="SHOP_ADDR", length  =1000, nullable = false)
    private String shopAddr;

    @NonNull
    @Column(name="SHOP_NUMBER", length  =1000, nullable = false)
    private String shopNumber;

    //사이트는 없는 곳이 많아서 null값이여도 가능
    @Column(name="SHOP_SITE", length  =2000, nullable = false)
    private String shopSite;

    @NonNull
    @Column(name="SHOP_CONTENTS", length  =5000, nullable = false)
    private String shopContents;

    @NonNull
    @Column(name="IMG_PATH", length  =1000, nullable = false)
    private String imgPath;

    @Column(name = "REG_ID", updatable = false)
    private String regId;

    @Column(name = "REG_DT", updatable = false)
    private String regDt;

    @Column(name = "CHG_ID")
    private String chgId;

    @Column(name = "CHD_DT")
    private String chgDt;



}
