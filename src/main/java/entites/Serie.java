/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entites;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Serie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;
    @OneToMany (mappedBy = "serie", fetch = FetchType.EAGER)
    private List<Restaurant> restaurants;
    
    
    public Serie() {
    }

    
	public Serie(String nom) {
		super();
		this.nom = nom;
	}


	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }


	public List<Restaurant> getRestaurants() {
		return restaurants;
	}


	public void setRestaurants(List<Restaurant> restaurants) {
		this.restaurants = restaurants;
	}



}
