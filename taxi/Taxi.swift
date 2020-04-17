//
//  Taxi.swift
//  taxi
//
//  Created by Saddam Satouyev on 06/04/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Taxi {
    var positionDuPassager: [String]
    
    init(positionDuPassager: [String]) {
        self.positionDuPassager = positionDuPassager
    }
    
    let chauffeurAdam = Adam()
    let chauffeurSaddam = Saddam()
    let chauffeurWilfried = Wilfried()
    var choixUtilisateur: [Chauffeur] = []
    
    func inputFloat() -> Float {
        guard let inputLine = readLine() else {
            print("Problème de liason avec terminal")
            return inputFloat()
        }
        guard let inputInt = Float(inputLine) else {
            print("Veuillez insérer un chiffre")
            return inputFloat()
        }
        return inputInt
    }
    
    func inputInteger() -> Int {
        guard let inputLine = readLine() else {
            print("Problème de liason avec terminal")
            return inputInteger()
        }
        guard let inputInt = Int(inputLine) else {
            print("Veuillez insérer un chiffre")
            return inputInteger()
        }
        return inputInt
    }
    
    func commanderUnTaxi() {
        print("Bonjour et Bienvenue")
        print()
        print("Vous voulez commander un taxi pour un départ immédiat ?")
        print()
        print("Saisir Oui ou Non dans le terminal")
        
        while true {
            
            if let reponseUtilisateur = readLine() {
                
                if reponseUtilisateur == "oui" || reponseUtilisateur == "Oui" || reponseUtilisateur == "OUI" {
                    choisirLaMarqueDuVehicule()
                    return
                }
                else if reponseUtilisateur == "non" || reponseUtilisateur == "Non" || reponseUtilisateur == "NON" {
                    print("Ok, revenez vers nous dès que vous êtes prêt(e) à partir.")
                    return
                }
                else {
                    print("Faites un choix SVP")
                }
                
            }
        }
    }
    
    
    
    func choisirLaMarqueDuVehicule() {
        let marqueDesVehicules = ["BMW", "Mercedes", "Audi", "Nissan"]
        print("Veullez choisir la marque du véhicule souhaitée")
        print()
        print("1: BMW")
        print("2: Mercedes")
        print("3: Audi")
        print("4: Nissan")
        
        while true {
            
            let reponseUtilisateur = inputInteger()
            
            switch reponseUtilisateur {
            case 1:
                print("Vous avez choisi \(marqueDesVehicules[0]).")
                choisirMonChauffeur()
                return
            case 2:
                print("Vous avez choisi \(marqueDesVehicules[1]).")
                choisirMonChauffeur()
                return
            case 3:
                print("Vous avez choisi \(marqueDesVehicules[2]).")
                choisirMonChauffeur()
                return
            case 4:
                print("Vous avez choisi \(marqueDesVehicules[3]).")
                choisirMonChauffeur()
                return
            default:
                print("Veullez choisir une marque")
            }
            
        }
        
    }
    
    private func describe(id: Int, chauffeur: Chauffeur) {
        print("\(id): \(chauffeur.nomDuChauffeur) \(chauffeur.prenomDuChauffeur) \(chauffeur.ageDuChauffeur)")
    }
    
    func choisirMonChauffeur() {
        print("Veullez selectionner un chauffeur de votre choix en entrant le numero corespandant dans le terminal")
        describe(id: 1, chauffeur: chauffeurAdam)
        describe(id: 1, chauffeur: chauffeurWilfried)
        describe(id: 1, chauffeur: chauffeurSaddam)
        let interactionAvecUtilisateur = inputInteger()
        
        switch interactionAvecUtilisateur {
        case 1:
            print("Vous avez choisi \(chauffeurAdam.nomDuChauffeur) \(chauffeurAdam.prenomDuChauffeur)")
            choixUtilisateur.append(chauffeurAdam)
            choixDuSiege()
        case 2:
            print("Vous avez choisi \(chauffeurSaddam.nomDuChauffeur) \(chauffeurSaddam.prenomDuChauffeur)")
            choixUtilisateur.append(chauffeurSaddam)
            choixDuSiege()
        case 3:
            print("Vous avez choisi \(chauffeurWilfried.nomDuChauffeur) \(chauffeurWilfried.prenomDuChauffeur)")
            choixUtilisateur.append(chauffeurWilfried)
            choixDuSiege()
        default:
            print("Il faut entrer un numero")
            return choisirMonChauffeur()
        }
        
    }
    
    func choixDuSiege() {
        print()
        let animationVehiculeEnTrajet = [".....🚕", "....🚕.", "...🚕..", "..🚕...", ".🚕....", "🚕....."]
        for index in 0...5 {
            print(animationVehiculeEnTrajet[index])
        }
        sleep(5)
        for choix in choixUtilisateur {
            print("M.\(choix.nomDuChauffeur) est arrivé !")
            print()
        }
        while true {
            print("Veuillez choisir votre siège")
            print("1: Avant Droite")
            print("2: Arrière Droite")
            print("3: Arrière Gauche")
            
            let choixUtilisateur = inputInteger()
            
            switch choixUtilisateur {
            case 1:
                print("Vous avez choisi Avant Droite, Je vous en prie asseyez-vous")
                positionDuPassager.append("Avant Droite")
                estimationDuPrix()
                return
            case 2:
                print("Vous avez choisi Arrière Droite, Je vous en prie asseyez-vous")
                positionDuPassager.append("Arrière Droite")
                estimationDuPrix()
                return
            case 3:
                print("Vous avez choisi Arrière Gauche, Je vous en prie asseyez-vous")
                positionDuPassager.append("Arrière Gauche")
                estimationDuPrix()
                return
            default:
                print("Il faut chosir un siege")
            }
            
        }
        
        
        
    }
    
    func estimationDuPrix() {
        print()
        print("Où est-ce que je vous emméne ?")
        print()
        print("Veuillez saisir l'adresse complet dans le Google Map et donnez moi le KM exacte pour faire une éstimation du prix")
        while true {
            
            let interactionAvecUtilisateur = inputFloat()
            let estimationDePrix = interactionAvecUtilisateur * 4.55
            print("Le prix du trajet est \(estimationDePrix)€")
            departDuTrajet()
            return
        }
        
    }
    
    func departDuTrajet() {
        print()
        print("Est-ce que le prix vous convient ?")
        
        if let reponseUtilisateur = readLine() {
            if reponseUtilisateur == "oui" || reponseUtilisateur == "Oui" || reponseUtilisateur == "OUI" {
                print("Alors c'est parti")
            }
            else if reponseUtilisateur == "non" || reponseUtilisateur == "Non" || reponseUtilisateur == "NON" {
                print("Alors descendez imédiatemment de mon vehicule")
            }
        }
        
    }
    
    
}
