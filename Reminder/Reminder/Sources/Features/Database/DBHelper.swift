//
//  DBHelper.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 26/05/25.
//MARK: SQLite

import Foundation
import SQLite3

//MARK: Singleton/ instancia dessa classe, todos que instanciarem shared terao acesso as funcoes dessa classe

class DBHelper {
    static let shared = DBHelper()
    private var db: OpaquePointer?
    
  
    private init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Reminder.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error ao abrir o banco de dados")
        }
    }
    
    private func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS Receipts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            remedy TEXT,
            time TEXT,
            recurrence TEXT,
            takeNow INTEGER
            
        );
        """
        
        var statment: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statment, nil) == SQLITE_OK {
            if sqlite3_step(statment) == SQLITE_DONE {
                print("Tabela criada com sucesso")
            } else {
                print( "Erro ao criar a tabela")
            }
        } else {
            print("CreateTableQuery nao conseguiu executar")
        }
        sqlite3_finalize(statment)
    }
    
    func insertReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        let insertQuery = "INSERT INTO Receipts (remedy, time, recurrence, takeNow) VALUES (?, ?, ?, ?);"
        var statment: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statment, nil) == SQLITE_OK {
            sqlite3_bind_text(statment, 1, (remedy as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statment, 2, (time as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statment, 3, (recurrence as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statment, 4, (takeNow ? 1 : 0))
            
            if sqlite3_step(statment) == SQLITE_DONE {
                print("Receita inserida com sucesso")
            } else {
                print("Falha ao inserir a receita na tabela")
            }
            
        } else {
            print("INSERT statment falhou")
        }
        sqlite3_finalize(statment)
    }
}
