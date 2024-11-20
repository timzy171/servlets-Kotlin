package entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public Integer id;

    @Column(name = "name", nullable = false, length = Integer.MAX_VALUE)
    public String name;

    public Task(String name) {
        this.name = name;
    }

    public Task() {}
}
