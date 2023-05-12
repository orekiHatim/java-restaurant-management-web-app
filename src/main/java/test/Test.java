package test;
import entites.Restaurant;
import entites.Specialite;
import entites.User;
import entites.Ville;

import java.util.Date;
import java.util.List;

import services.RestaurantService;
import services.SpecialiteService;
import services.UserService;
import services.VilleService;
import util.HibernateUtil;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Lachgar
 */
public class Test {

    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
        
        /*RestaurantService rs = new RestaurantService();
        SpecialiteService ss = new SpecialiteService();
        Restaurant resto = rs.findById(1);
        List<Specialite> specs = resto.getSpecialite();
        if(specs.add(ss.findById(1))) {
        	resto.setSpecialite(specs);
        	rs.update(resto);
        }*/
        
        /*FiliereService fs = new FiliereService();
        fs.create(new Filiere("IIR", "info"));
        fs.create(new Filiere("GI", "Civil"));*/
        //VilleService vs = new VilleService();
        //UserService us = new UserService();
        
        //User u = us.findUserByEmail("test@test.com");
        //System.out.println(u.getNom());
        //vs.create(new Ville("Agadir"));
        //for(Ville v : vs.findAll())
        	//System.out.println(v.getNom());
        //vs.create(new Ville("Marrakech"));

        /*EtudiantService es = new EtudiantService();
        es.create(new Etudiant("alami", "kamal", new Date(), "012588888", fs.findById(1)));
        es.create(new Etudiant("rami", "amal", new Date("1999/01/01"), "0125854656", fs.findById(2)));
*/
       // for(Etudiant e : es.findAll())
         //   System.out.println(e.getNom());
        
        //for(Etudiant e : fs.findById(1).getEtudiants())
           // System.out.println(e);
    }

}
