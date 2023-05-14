ALTER TABLE `platzi_operation`.`books`
ADD CONSTRAINT `FK_author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES  `platzi_operation`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;