package kopo.poly.repository.entity;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "USER_INFO_MAR")
@DynamicInsert
@DynamicUpdate
@Builder
@Entity

public class MarketInfoEntity {
    @Id
    @Column(name = "MARKET_ID")
    private String marketId;

    @NonNull
    @Column(name = "MARKET_EMAIL", nullable = false)
    private String email;

    @NonNull
    @Column(name = "MARKET_PASSWORD", nullable = false)
    private String password;

    @NonNull
    @Column(name = "MARKET_NAME", length = 500, nullable = false)
    private String marketName;

    @Column(name = "REG_ID", updatable = false)
    private String regId;

    @Column(name = "REG_DT", updatable = false)
    private String regDt;

    @NonNull
    @Column(name = "ADDR1", nullable = false)
    private String addr1;

    @NonNull
    @Column(name = "ADDR2", nullable = false)
    private String addr2;

    @Column(name = "CHG_ID")
    private String chgId;

    @Column(name = "CHG_DT")
    private String chgDt;

}
