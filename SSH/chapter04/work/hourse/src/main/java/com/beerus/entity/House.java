package com.beerus.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * 房屋信息
 */
@Entity
@Table(name = "HOUSE")
public class House {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "TITLE")
    private String title;
    @Column(name = "DESCRIPTION")
    private String description;
    @Column(name = "PRICE")
    private Integer price;
    @Column(name = "PUBDATE")
    private Date pubdate;
    @Column(name = "FLOORAGE")
    private Integer floorage;
    @Column(name = "CONTACT")
    private String contact;
    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private Users users;
    @Column(name = "TYPE_ID")
    private Integer typeId;
    @ManyToOne
    @JoinColumn(name = "STREET_ID")
    private Street street;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getFloorage() {
        return floorage;
    }

    public void setFloorage(Integer floorage) {
        this.floorage = floorage;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Street getStreet() {
        return street;
    }

    public void setStreet(Street street) {
        this.street = street;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", pubdate=" + pubdate +
                ", floorage=" + floorage +
                ", contact='" + contact + '\'' +
                ", users=" + users +
                ", typeId=" + typeId +
                ", street=" + street +
                '}';
    }
}
