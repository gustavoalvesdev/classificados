<?php

/** 
 * Copyright (c) 2021 Gustavo Alves da Silva
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


/**
 * This class deals with user add, select and login
 */
class Usuario
{
    
    /**
     * @return string the number of users
     */
    public function getTotalUsuarios() : string
    {
        global $pdo;

        $sql = $pdo->query("SELECT COUNT(*) as c FROM usuarios");
        $row = $sql->fetch();

        return $row['c'];
    }

    /**
     * 
     * Adds a new user
     * 
     * @param string $nome the name of the user to be added
     * @param string $email the email address of the user to be added
     * @param string $senha the password of the user to be added
     * @param string $telefone the phone number of the user to be added
     * 
     * @return boolean true - if there's no user with the same email address / false - email address 
	 * already exists
     */
    public function cadastrar(string $nome,  string $email,  string $senha, string $telefone) : boolean
    {
        global $pdo;
        $sql = $pdo->prepare("SELECT id FROM usuarios WHERE email = :email");
        $sql->bindValue(":email", $email);
        $sql->execute();

        if ($sql->rowCount() == 0) {
            $sql = $pdo->prepare("INSERT INTO usuarios SET nome = :nome, email = :email, senha = :senha, telefone = :telefone");
            $sql->bindValue(":nome", $nome);
            $sql->bindValue(":email", $email);
            $sql->bindValue(":senha", md5($senha));
            $sql->bindValue(":telefone", $telefone);
            $sql->execute();

            return true;
        }
        
	return false;
    }


    /**
     * Creates a login session for authenticated users
     * 
     * @param string $email user's email address
     * @param string $senha user's password
     * 
     * @return boolean whether exists a user with the password and email address given
     */
    public function login(string $email, string $senha) : boolean
    {
        global $pdo;

        $sql = $pdo->prepare("SELECT id FROM usuarios WHERE email = :email AND senha = :senha");
        $sql->bindValue(":email", $email);
        $sql->bindValue(":senha", md5($senha));
        $sql->execute();

        if ($sql->rowCount() > 0) {
            $dado = $sql->fetch();
            $_SESSION['cLogin'] = $dado['id'];
            return true;
        } 
        
        return false;
    }
}
