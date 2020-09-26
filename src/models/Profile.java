package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="likes")

@Entity
public class Profile {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne//プロフィールのユーザーID
    @JoinColumn(name = "profileUser_id", nullable= false)
    private User profileUser;

    @Column(name = "intoroduce", nullable = true)
    private Profile intoroduce;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getProfileUser() {
        return profileUser;
    }

    public void setProfileUser(User profileUser) {
        this.profileUser = profileUser;
    }

    public Profile getIntoroduce() {
        return intoroduce;
    }

    public void setIntoroduce(Profile intoroduce) {
        this.intoroduce = intoroduce;
    }

}


