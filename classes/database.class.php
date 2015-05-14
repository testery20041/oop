<?php
/**
 * Description of dbconnection class
 *
 * @author Mitzu
 */
class Database {
    
    // Define connection as a static variable, to avoid connecting more than once 
    public static $connection;
    
    public function db_connect() 
    {
        // Try and connect to the database, if a connection has not been established yet
        if( ! isset(self::$connection)) {
             // Load configuration as an array. Use the actual location of your configuration file
            $config = parse_ini_file('config/config.ini'); 
            self::$connection = mysqli_connect('localhost', $config['username'], $config['password'], $config['dbname']);
        }

        // If connection was not successful, handle the error
        if(self::$connection === false) {
            // Handle error - notify administrator, log to a file, show an error screen, etc.
            return mysqli_connect_error(); 
        }
        
        return self::$connection;
    }
}
