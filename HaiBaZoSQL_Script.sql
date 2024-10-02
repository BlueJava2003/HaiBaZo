-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shopapp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shopapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shopapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `shopapp` ;

-- -----------------------------------------------------
-- Table `shopapp`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopapp`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: đồ điện tử',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `shopapp`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopapp`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(350) NULL DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` FLOAT NOT NULL,
  `thumbnail` VARCHAR(300) NULL DEFAULT '',
  `description` LONGTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `shopapp`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5874
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `shopapp`.`product_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopapp`.`product_images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL DEFAULT NULL,
  `image_url` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_images_product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_images_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `shopapp`.`products` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `product_images_ibfk_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shopapp`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 140
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Insert categories sample data
INSERT INTO `shopapp`.`categories` (`id`, `name`)
VALUES 
(1, 'Electronics'),
(2, 'Home Appliances'),
(3, 'Sports Equipment'),
(4, 'Furniture'),
(5, 'Clothing');

-- Insert sample products data
INSERT INTO `shopapp`.`products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`)
VALUES 
(1, 'Smartphone A1', 499.99, 'https://example.com/images/smartphone_a1.jpg', 'A high-quality smartphone with 128GB storage.', '2023-01-15 10:23:45', '2023-01-15 10:23:45', 1),
(2, 'LED TV 50"', 799.99, 'https://example.com/images/led_tv_50.jpg', 'A 50-inch LED TV with 4K resolution.', '2023-01-20 12:34:56', '2023-01-20 12:34:56', 2),
(3, 'Tennis Racket Pro', 150.00, 'https://example.com/images/tennis_racket_pro.jpg', 'Professional-grade tennis racket.', '2023-02-05 09:45:23', '2023-02-05 09:45:23', 3),
(4, 'Leather Sofa', 1200.00, 'https://example.com/images/leather_sofa.jpg', 'A luxurious leather sofa.', '2023-02-25 14:21:10', '2023-02-25 14:21:10', 4),
(5, 'Winter Jacket', 99.99, 'https://example.com/images/winter_jacket.jpg', 'Warm and cozy winter jacket.', '2023-03-10 08:15:33', '2023-03-10 08:15:33', 5);

-- Insert product_images sample data
INSERT INTO `shopapp`.`product_images` (`id`, `product_id`, `image_url`)
VALUES 
(1, 1, 'https://example.com/images/smartphone_a1_side.jpg'),
(2, 1, 'https://example.com/images/smartphone_a1_back.jpg'),
(3, 2, 'https://example.com/images/led_tv_50_side.jpg'),
(4, 3, 'https://example.com/images/tennis_racket_pro_side.jpg'),
(5, 5, 'https://example.com/images/winter_jacket_closeup.jpg');

