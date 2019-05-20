 DELIMITER $$
USE `Servicios`$$

CREATE PROCEDURE `usuariosAddOrEdit` (
  IN _id INT,
  IN _username VARCHAR(45),
  IN _email TEXT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO usuarios (username, email)
    VALUES (_username, _email);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE usuarios
    SET
    username = _username,
    email = _email
    WHERE usuarios_id = _id;
  END IF;

  SELECT _id AS 'usuarios_id';
END