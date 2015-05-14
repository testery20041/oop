<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once 'classes/customers.class.php';

$customer = new Customers();

echo $customer->getFullName();
echo '<br/>';
echo $customer->getFullName_r();
