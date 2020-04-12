SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

ALTER USER 'weather' IDENTIFIED WITH mysql_native_password BY 'weather';
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'Jmpfricpiud';
FLUSH PRIVILEGES;