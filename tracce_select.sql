-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * 
FROM `students`
WHERE `date_of_birth` LIKE '1990%';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE `date_of_birth` <= '1993-02-14';
-- WHERE (YEAR(CURDATE()) - YEAR(`date_of_birth`)) >= 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT `name`, `period`, `year`
FROM `courses`
WHERE `year` = 1 AND `period` = 'I semestre';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT *
FROM `exams`
WHERE `date` = '2020-06-20' AND HOUR(`hour`) >= 14;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT `name`, `level`
FROM `degrees`
WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) AS 'Totale dipartimenti'
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT * 
FROM `teachers` 
WHERE `phone` IS NULL;

-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'Numero Studenti', YEAR(`enrolment_date`) AS 'Anno Iscrizione' 
FROM `students` 
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) AS 'Numero Insegnanti',`office_address`  
FROM `teachers`
GROUP BY (`office_address`);

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, ROUND(AVG(`vote`)) AS 'avg_vote' 
FROM `exam_student` 
GROUP BY (`exam_id`);

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(*) AS 'Corsi di laurea', `degrees`.`department_id`, `departments`.`id`, `departments`.`name`
FROM `degrees` 
INNER JOIN `departments`
ON `departments` . `id` = `degrees` . `department_id`
GROUP BY (`department_id`);
