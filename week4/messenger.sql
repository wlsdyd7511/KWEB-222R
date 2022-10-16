CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `user_pw` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `profile_image` VARCHAR(64) NOT NULL,
    `profile_message` VARCHAR(64) NOT NULL,
    `is_leaved` TINYINT(1) NOT NULL DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `created_user` INT NOT NULL,
    `channel_link` VARCHAR(64) NOT NULL,
    `max_user` INT NOT NULL,
    `is_leaved` TINYINT(1) NOT NULL DEFAULT 0,
    `created_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`created_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(256) NOT NULL,
    `writer` INT NOT NULL,
    `channel` INT NOT NULL,
    `created_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`writer`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocking_user` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocking_user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
