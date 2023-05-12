/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entites;

import javax.persistence.Entity;

/**
 *
 * @author pourtoi
 */
@Entity
public class Admin extends User{


    public Admin() {

    }

    public Admin(String nom, String prenom, String email, String telephone, String password) {
    	super(nom, prenom, email, telephone, password);
    }

}
