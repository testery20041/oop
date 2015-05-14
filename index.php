<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once 'classes/customers.class.php';

$customer = new Customers();

$new_customer = array(
        'first_name'    => 'Willis',
        'last_name'     => 'Bruce',
        'user_id'       => '3',
        'ID_card'       => NULL,
        'phone_number'  => '+40-740-563252',
        'email_address' => 'john.connor@fakedomain.com',
        'postal_address'=> 'Iasi, Str. Berzelor, nr.5'
    );

$customer->add($new_customer);