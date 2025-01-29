CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32),
    `last_name` VARCHAR(32),
    `username` VARCHAR(32) UNIQUE,
    `password` VARCHAR(128),
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `school_name` VARCHAR(32),
    `school_type` ENUM('Primary', 'Secondary', 'Higher Education'),
    `school_location` VARCHAR(32),
    `year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `company_name` VARCHAR(32),
    `company_industry` ENUM('Technology', 'Education', 'Business'),
    `company_location` VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE `users_connections` (
    `user1_id` INT,
    `user2_id` INT,
    PRIMARY KEY(`user1_id`, `user2_id`),
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `schools_connections` (
    `user_id` INT,
    `school_id` INT,
    `affiliation_date` DATE NOT NULL,
    `end_affiliation_date` DATE NOT NULL,
    `degree_type` ENUM('BA', 'MA', 'PhD'),
    PRIMARY KEY(`user_id`, `school_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES "schools"(`id`)
);

CREATE TABLE `companies_connections` (
    `user_id` INT,
    `company_id` INT,
    `affilitation_date` DATE NOT NULL,
    `end_affiliation_date` DATE NOT NULL,
    `title` VARCHAR(32),
    PRIMARY KEY(`user_id`, `company_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
