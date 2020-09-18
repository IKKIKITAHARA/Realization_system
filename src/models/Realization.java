package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "realizations")
@NamedQueries({
        @NamedQuery(name = "getAllRealizations", query = "SELECT r FROM Realization AS r ORDER BY r.id DESC"),
        @NamedQuery(name = "getRealizationsCount", query = "SELECT COUNT(r) FROM Realization AS r"),
        @NamedQuery(name = "getMyAllRealization", query = "SELECT r FROM Realization AS r WHERE r.user = :user ORDER BY r.id DESC"),
        @NamedQuery(name = "getMyRealizationsCount", query = "SELECT COUNT(r) FROM Realization AS r WHERE r.user = :user")
})

@Entity
public class Realization {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "realization_date", nullable = false)
    private Date realization_date;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column(name = "evalution", nullable = false)
    private Integer evalution;

    @Column(name = "fixation", nullable = false)
    private  Integer fixation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser_id(User user) {
        this.user = user;
    }

    public Date getRealization_date() {
        return realization_date;
    }

    public void setRealization_date(Date realization_date) {
        this.realization_date = realization_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public Integer getEvalution() {
        return evalution;
    }

    public void setEvalution(Integer evalution) {
        this.evalution = evalution;
    }

    public Integer getFixation() {
        return fixation;
    }

    public void setFixation(Integer fixation) {
        this.fixation = fixation;
    }

}
