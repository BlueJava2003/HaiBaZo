package com.project.shopapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.shopapp.models.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
