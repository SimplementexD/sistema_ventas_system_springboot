package com.project.ordermanagementsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.ordermanagementsystem.model.State;

@Repository
public interface StateRepository extends JpaRepository<State, Long> {

}
