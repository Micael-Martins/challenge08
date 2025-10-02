//
//  PetCareInfoGenerator.swift
//  CoreChallenge
//
//  Created by Pedro Santos on 01/10/25.
//

import Foundation
import FoundationModels

// Estrutura para decodificar a resposta do modelo de IA.
@Generable
struct InformacoesPet {
    var alimentos: [String]
    var cuidados: String
}

// Estrutura responsável por gerar as informações de cuidado.
struct PetCareInfoGenerator {
    
    /// Busca informações de cuidados para um animal e imprime no terminal.
    /// - Parameter animalName: O nome do animal para o qual gerar informações.
    static func fetchAndPrintCareInfo(for animalName: String) async throws -> InformacoesPet? {
        
        // 1. Verifica se o modelo de IA está disponível no dispositivo
        switch SystemLanguageModel.default.availability {
        case .unavailable(let reason):
            print("--------------------------------------------------")
            print("‼️ ERRO: Apple Intelligence indisponível: \(reason)")
            print("--------------------------------------------------")
            break
        case .available:
            print("✅ Apple Intelligence está disponível. Gerando informações...")
            print("--------------------------------------------------")
        }
        
        // 2. Cria a sessão com o modelo de linguagem
        let session = LanguageModelSession()
        
        // 3. Monta o prompt com o nome do animal recebido
        let prompt = """
        Gere informações de cuidados para um(a) \(animalName).
        Na propriedade 'alimentos', forneça uma lista de exatamente 3 alimentos seguros e apropriados.
        Na propriedade 'cuidados', forneça um parágrafo único e conciso sobre os cuidados básicos essenciais.
        """

        // 4. Executa a chamada e imprime o resultado ou o erro
        do {
            let response = try await session.respond(to: prompt, generating: InformacoesPet.self)
            let resposta: InformacoesPet = response.content
            
            print("🐾 Informações de Cuidados para: \(animalName) 🐾")
            print("\nAlimentos Recomendados:")
            resposta.alimentos.forEach { food in
                print("- \(food)")
            }
            
            print("\nCuidados Essenciais:")
            print(resposta.cuidados)
            
          return resposta

        } catch {
            print("Ocorreu um erro ao gerar o conteúdo: \(error.localizedDescription)")
        }
        return nil
        
    }
}
