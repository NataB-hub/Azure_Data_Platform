-- Create a server login and user in Microsoft SQL Server, which are used for managing access to the database server.
CREATE LOGIN login_name WITH PASSWORD = 'password';
CREATE USER user_name FOR LOGIN login_name;