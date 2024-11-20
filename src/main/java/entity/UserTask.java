package entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_tasks")
public class UserTask {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "user_id", nullable = false)
    public Integer userId;

    @Column(name = "task_id", nullable = false)
    public Integer taskId;

    public UserTask() {}

    public UserTask(Integer userId, Integer taskId) {
        this.userId = userId;
        this.taskId = taskId;
    }
}
