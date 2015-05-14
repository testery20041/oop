<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of customers
 *
 * @author Mitzu
 */
class Customers {
    
    private $_first_name;
    private $_last_name;
    private $_age;
    
    //put your code here
    public function __construct() {
        
        $this->_first_name  = 'Connor';
        $this->_last_name   = 'John';
    }
    
    public function getFullName()
    {
        return ucwords($this->_first_name . ' ' . $this->_last_name);
    }
    
    public function getFullName_r()
    {
        return ucwords($this->_last_name . ' ' . $this->_first_name);
    } 
}
