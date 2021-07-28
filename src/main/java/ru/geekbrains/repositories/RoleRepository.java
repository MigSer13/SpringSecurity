package ru.geekbrains.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.geekbrains.entities.User;

import java.util.Optional;

@Repository
public interface RoleRepository extends CrudRepository<User, Long> {

}
