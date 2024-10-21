package entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "users")

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = Integer.MAX_VALUE)
    public String name;

    @Column(name = "surname", nullable = false, length = Integer.MAX_VALUE)
    public String surname;

    @Column(name = "username", nullable = false, length = Integer.MAX_VALUE)
    public String username;

    @Column(name = "password", nullable = false, length = Integer.MAX_VALUE)
    public String password;

    public User() {

    }

    public User(String name, String surname, String username, String password) {
        this.name = name;
        this.surname = surname;
        this.username = username;
        this.password = password;
    }
}