//
//  Personnage.swift
//  RPG
//
//  Created by Display on 08/07/2020.
//  Copyright © 2020 Display. All rights reserved.
//

import Foundation

class Personnage {
    var nom: String
    let classe: Classe
    var arme: Arme
    var vie: Int
    
    init(nom: String, classe: Classe) {
        self.nom = nom
        self.classe = classe
        
        switch self.classe {
        case .Archer:
            self.arme = Arc()
            self.vie = 90
        case .Guerrier:
            self.arme = Epee()
            self.vie = 110
        case .Mage:
            self.arme = Sceptre()
            self.vie = 80
        }
    }
    
    func jouer(contre personnage: Personnage) {
        var choixUtilisateur: Int
        
        // On affiche d'abord les caractéristiques du personnage qui doit jouer
        self.description()
        
        // On boucle tant qu'il n'a pas choisi un de ces deux solutions
        repeat {
            print("Quel choix ?")
            print("1. Attaquer")
            print("2. Améliorer son arme")
            choixUtilisateur = input()
            print()
        } while choixUtilisateur != 1 && choixUtilisateur != 2
        
        // On réalise l'action demandée
        if choixUtilisateur == 1 {
            self.attaquer(personnage: personnage)
        } else {
            self.ameliorerArme()
        }
    }
    
    func recevoir(degats: Int) {
        self.vie = self.vie - degats
        
        // Si la vie est négatif, on la met tout simplement à 0 pour dire que le personnage est mort
        if self.vie < 0 {
            self.vie = 0
        }
    }
    
    func attaquer(personnage: Personnage) {
        personnage.recevoir(degats: self.arme.degats)
    }
    
    func ameliorerArme() {
        self.arme.degats += 5
    }
    
    // Affiche la description de notre personnage à l'écran
    func description() {
        print("Nom : " + self.nom)
        print("Vie : \(self.vie)")
        print("Dégâts de son arme : \(self.arme.degats)")
    }
}
