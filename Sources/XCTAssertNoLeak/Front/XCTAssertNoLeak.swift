import XCTest
#if swift(>=4.2)
#if compiler(>=5.0)
public func XCTAssertNoLeak(_ object: @autoclosure () -> AnyObject, file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(object(), assert: XCTFail, file: file, line: line)
}

public func XCTAssertNoLeak(_ f: (Context) -> (), file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(f, assert: XCTFail, file: file, line: line)
}
#else
@available(swift, deprecated: 4.2.0, message: "XCTAssertNoLeak may not work correct: https://bugs.swift.org/browse/SR-8878")
public func XCTAssertNoLeak(_ object: @autoclosure () -> AnyObject, file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(object(), assert: XCTFail, file: file, line: line)
}

@available(swift, deprecated: 4.2.0, message: "XCTAssertNoLeak may not work correct: https://bugs.swift.org/browse/SR-8878")
public func XCTAssertNoLeak(_ f: (Context) -> (), file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(f, assert: XCTFail, file: file, line: line)
}
#endif
#else
public func XCTAssertNoLeak(_ object: @autoclosure () -> AnyObject, file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(object(), assert: XCTFail, file: file, line: line)
}

public func XCTAssertNoLeak(_ f: (Context) -> (), file: StaticString = #file, line: UInt = #line) {
    assertNoLeak(f, assert: XCTFail, file: file, line: line)
}
#endif

