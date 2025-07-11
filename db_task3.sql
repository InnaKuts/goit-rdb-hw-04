-- -----------------------------------------------------
-- Database Schema for E-commerce System
-- Based on CSV dataset analysis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `suppliers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NULL,
  `address` VARCHAR(200) NULL,
  `city` VARCHAR(50) NULL,
  `postal_code` VARCHAR(20) NULL,
  `country` VARCHAR(50) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `supplier_id` INT NULL,
  `category_id` INT NULL,
  `unit` VARCHAR(100) NULL,
  `price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

-- -----------------------------------------------------
-- Table `customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NULL,
  `address` VARCHAR(200) NULL,
  `city` VARCHAR(50) NULL,
  `postal_code` VARCHAR(20) NULL,
  `country` VARCHAR(50) NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` INT NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `birthdate` DATE NULL,
  `photo` VARCHAR(100) NULL,
  `notes` TEXT NULL,
  PRIMARY KEY (`employee_id`)
);

-- -----------------------------------------------------
-- Table `shippers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shippers`;
CREATE TABLE IF NOT EXISTS `shippers` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INT NOT NULL,
  `customer_id` INT NULL,
  `employee_id` INT NULL,
  `date` DATE NULL,
  `shipper_id` INT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`)
);

-- -----------------------------------------------------
-- Table `order_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` INT NOT NULL,
  `order_id` INT NULL,
  `product_id` INT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);

-- -----------------------------------------------------
-- Indexes for better performance
-- -----------------------------------------------------
CREATE INDEX `idx_products_supplier` ON `products` (`supplier_id`);
CREATE INDEX `idx_products_category` ON `products` (`category_id`);
CREATE INDEX `idx_orders_customer` ON `orders` (`customer_id`);
CREATE INDEX `idx_orders_employee` ON `orders` (`employee_id`);
CREATE INDEX `idx_orders_shipper` ON `orders` (`shipper_id`);
CREATE INDEX `idx_order_details_order` ON `order_details` (`order_id`);
CREATE INDEX `idx_order_details_product` ON `order_details` (`product_id`);
