CREATE TABLE `students` (
    `name` VARCHAR(20) NOT NULL,
    `entrance_year` INT NOT NULL,
    `college_number` INT NOT NULL,
    `student_number` INT NOT NULL,
    `phone_number` INT NOT NULL,
    `adress` VARCHAR(30) NOT NULL,
    `total_credit` INT NOT NULL DEFAULT 0,
    `average_grade` DOUBLE NOT NULL DEFAULT 0.0,
    `is_enrolled` TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
