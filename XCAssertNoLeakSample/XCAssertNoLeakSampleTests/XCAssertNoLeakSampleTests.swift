//
//  XCAssertNoLeakSampleTests.swift
//  XCAssertNoLeakSampleTests
//
//  Created by tarunon on 2019/03/13.
//  Copyright © 2019 tarunon. All rights reserved.
//

import XCTest
import XCTAssertNoLeak
@testable import XCAssertNoLeakSample

class XCAssertNoLeakSampleTests: XCTestCase {

    func testAssertNoLeak() {
        XCTAssertNoLeak(ViewControllerNoLeak())
        
        XCTAssertNoLeak(ViewControllerLeaked())
        
        XCTAssertNoLeak({ context in
            let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
            let viewController = ViewControllerLeakedViewDidAppear()
            
            rootViewController.present(viewController, animated: true, completion: {
                context.traverse(name: "vc", object: viewController)
                rootViewController.dismiss(animated: true, completion: {
                    context.completion()
                })
            })
        })
    }

}
