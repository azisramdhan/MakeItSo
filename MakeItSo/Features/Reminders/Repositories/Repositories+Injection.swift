//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 26/11/23.
//

import Foundation
import Factory

extension Container {
    public var remindersRepository: Factory<RemindersRepository> {
        Factory(self) {
            RemindersRepository()
        }.singleton
    }
}
