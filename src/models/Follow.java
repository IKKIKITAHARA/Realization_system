package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Table(name="follows")

@NamedQueries({
    @NamedQuery(name = "getMyAllFolloweds", query = "SELECT f FROM Follow AS f WHERE f.follower = :follower ORDER BY f.id DESC"),
    @NamedQuery(name = "getAllFolloewedDatasCount", query = "SELECT COUNT(f) FROM Follow AS f WHERE f.follower = :follower"),
    @NamedQuery(name = "getFollowedDatas", query = "SELECT f FROM Follow AS f WHERE f.follower = :follower AND f.followed = :followed ORDER BY f.id DESC")
})

@Entity
public class Follow {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "Follower_id", nullable = false)//フォローする人
    private User follower;

    @ManyToOne
    @JoinColumn(name = "Followed_id", nullable = false)//フォローされる人
    private User followed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getFollower() {
        return follower;
    }

    public void setFollower(User follower) {
        this.follower = follower;
    }

    public User getFollowed() {
        return followed;
    }

    public void setFollowed(User followed) {
        this.followed = followed;
    }

}
