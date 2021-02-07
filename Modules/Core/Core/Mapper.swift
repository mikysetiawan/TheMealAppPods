//
//  Mapper.swift
//  Core
//
//  Created by Testing on 06/02/21.
//

import Foundation
 
public protocol Mapper {
    associatedtype Request
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(request: Request?, response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
}
