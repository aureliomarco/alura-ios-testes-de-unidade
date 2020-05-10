//
//  ViewController.swift
//  Leilao
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cenário
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Ação
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validação
        let maior = 400.0
        let menor = 250.0
        
        print(leiloeiro.maiorLance() == maior)
        print(leiloeiro.menorLance() == menor)
    }
}






