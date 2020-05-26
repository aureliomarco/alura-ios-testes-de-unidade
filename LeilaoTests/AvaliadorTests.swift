//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Marco Aurelio on 12/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    var leiloeiro: Avaliador?
    private var joao: Usuario?
    private var maria: Usuario?
    private var jose: Usuario?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeveEntenderLanchesEmOrdemCrescente() {
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria ?? Usuario(nome: ""), 250.0))
        leilao.propoe(lance: Lance(joao ?? Usuario(nome: ""), 300.0))
        leilao.propoe(lance: Lance(jose ?? Usuario(nome: ""), 400.0))
        
        // Ação
        leiloeiro?.avalia(leilao: leilao)
        
        // Validação
        XCTAssertEqual(250.0, leiloeiro?.menorLance())
        XCTAssertEqual(400.0, leiloeiro?.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao ?? Usuario(nome: ""), 1000.0))
        
        leiloeiro?.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro?.menorLance())
        XCTAssertEqual(1000.0, leiloeiro?.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4")
            .lance(joao ?? Usuario(nome: ""), 300.0)
            .lance(maria ?? Usuario(nome: ""), 400.0)
            .lance(joao ?? Usuario(nome: ""), 500.0)
            .lance(maria ?? Usuario(nome: ""), 600.0)
            .constroi()
        
        leiloeiro?.avalia(leilao: leilao)
        let listaLances = leiloeiro?.tresMaiores()
        
        XCTAssertEqual(3, listaLances?.count)
        XCTAssertEqual(600.0, listaLances?[0].valor)
        XCTAssertEqual(500.0, listaLances?[1].valor)
        XCTAssertEqual(400.0, listaLances?[2].valor)
    }
}
