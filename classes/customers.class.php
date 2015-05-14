<?php
/**
 * Description of customers class
 *
 * @author John Connor
 */

include_once('classes/database.class.php');

class Customers {
    
    protected $_conn;

    private $_first_name;
    private $_last_name;
    private $_user_id;
    private $_ID_card;
    private $_phone_number;
    private $_email_address;
    private $_postal_address;
    
    //put your code here
    public function __construct() {
        
        $dc = new Database();
        $this->_conn = $dc->db_connect();
                
        $this->_first_name      = '';
        $this->_last_name       = '';
        $this->_user_id         = NULL;
        $this->_ID_card         = NULL;
        $this->_phone_number    = '';
        $this->_email_address   = NULL;
        $this->_postal_address  = NULL;
    }
    
    public function getFirstName()
    {
        return $this->_first_name;
    }
    
    public function setFirstName($first_name)
    {
        $this->_first_name = ucfirst(filter_var($first_name, FILTER_SANITIZE_STRING));        
    }
    
    public function getLastName()
    {
        return $this->_last_name;
    }
    
    public function setLastName($last_name)
    {
        $this->_last_name = ucwords(filter_var($last_name, FILTER_SANITIZE_STRING));        
    }
    
    public function getUserID()
    {
        return $this->_user_id;
    }
    
    public function setUserID($user_id)
    {
        $this->_user_id = filter_var($user_id, FILTER_VALIDATE_INT) ? (int) $user_id : NULL;
    }
    
    public function getCardID()
    {
        return $this->_ID_card;
    }
    
    public function setCardID($ID_card)
    {
        $this->_ID_card = strtoupper(filter_var($ID_card, FILTER_SANITIZE_STRING));
    }
    
    public function getPhoneNumber()
    {
        return $this->_phone_number;
    }

    public function setPhoneNumber($phone_number)
    {
        $this->_phone_number = filter_var($phone_number, FILTER_SANITIZE_STRING);
    }
    
    public function getEmailAddress()
    {
        return $this->_email_address;
    }
    
    public function setEmailAddress($email_address)
    {
        $this->_email_address = filter_var($email_address, FILTER_VALIDATE_EMAIL) ? strtolower($email_address) : NULL;
    }
    
    public function getPostalAddress()
    {
        return $this->_postal_address;
    }
    
    public function setPostalAddress($postal_address)
    {
        $this->_postal_address = filter_var($postal_address, FILTER_SANITIZE_STRING);
    }
    
    public function add($customer)
    {
        if(is_array($customer))
        {
            $query = "INSERT INTO "
                    . "     customers(first_name, last_name, user_id, ID_card, phone_number, email_address, postal_address) "
                    . "VALUES(  '{$customer['first_name']}',"
                    . "         '{$customer['last_name']}',"
                    . "         '{$customer['user_id']}',"
                    . "         '{$customer['ID_card']}',"
                    . "         '{$customer['phone_number']}',"
                    . "         '{$customer['email_address']}',"
                    . "         '{$customer['postal_address']}'"
                    . ")";
            
            $result = mysqli_query($this->_conn, $query);
            
            if($result === false)
            {
                echo 'Eroare inserare:<br/>'.mysqli_error($this->_conn);
            }
            else
                print_r($result);
        }
    }

    public function getFullName()
    {
        return ucwords($this->_first_name . ' ' . $this->_last_name);
    }
}
