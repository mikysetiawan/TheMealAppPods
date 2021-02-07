//
//  UseCase.swift
//  Core
//
//  Created by Testing on 06/02/21.
//

import Combine
 
public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
