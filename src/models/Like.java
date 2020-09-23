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


@Table(name="likes")

@NamedQueries({
    @NamedQuery(name = "getLikeDatas",query = "SELECT l FROM Like AS l WHERE l.likedUser = :likedUser AND l.likedRealization = :likedRealization ORDER BY l.id DESC"),
    @NamedQuery(name = "getMyAllLikes",query = "SELECT l FROM Like AS l WHERE l.likedUser = :likedUser ORDER BY l.id DESC")
             })

@Entity
public class Like {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne//いいねした人のデータ
    @JoinColumn(name = "likedUser_id", nullable= false)
    private User likedUser;

    @ManyToOne//いいねした対象のデータ
    @JoinColumn(name = "likedRealization_id", nullable = false)
    private Realization likedRealization;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getLikedUser() {
        return likedUser;
    }

    public void setLikedUser(User likedUser) {
        this.likedUser = likedUser;
    }

    public Realization getLikedRealization() {
        return likedRealization;
    }

    public void setLikedRealization(Realization likedRealization) {
        this.likedRealization = likedRealization;
    }

}





