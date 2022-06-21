<?php
    require_once "DB.php";

    class Categorie {

        private $_pdo;
//Créer une instance PDO qui représente une connexion à la base
        public function __construct(){
            $this->_pdo = DB::connect();

        }
        //reading data from inaccessible (protected or private) or non-existing properties.
        public function get($id = null){
            if ($id == null){
                $sql = "select * from categorie";
                $result = $this->_pdo->query($sql);
                return $result->fetchAll();//while or forearch (results as result) result['name], result['age']
            }else{
                $sql = "select * from categorie where idCategorie =".$id;
                $result = $this->_pdo->query($sql);
                    return $result->fetch();// sans loop result['name], result['age']
               
            }
        }

      
    }