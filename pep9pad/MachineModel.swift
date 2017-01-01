//  MachineModel.swift
//  pep9pad
//
//  Copyright © 2016 Pepperdine University. All rights reserved.
//


var machine = MachineModel()

/// The simulated machine.
class MachineModel {
    
    
    // MARK: - Properties
    /// Main memory, pre-allocated
    var Mem: [Int] = [Int](repeating: 0, count: 65536)
    // MARK: CPU
    var nBit, zBit, vBit, cBit: Bool
    var accumulator: Int
    var indexRegister: Int
    var stackPointer: Int
    var programCounter: Int
    var instructionSpecifier: Int
    var operandSpecifier: Int
    var operand: Int
    
    var inputBuffer: String
    var outputBuffer: String
    
    var modifiedBytes: Set<Int>
    var trapped: Bool
    var tracingTraps: Bool
    
    /// State for keeping track of what actions are possible for user and machine.  Unused in Pep9.
    //var executionState: EExecState
    
    
    // MARK: - Initializer
    init() {
        nBit = false
        zBit = false
        vBit = false
        cBit = false
        
        accumulator = 0
        indexRegister = 0
        stackPointer = 0
        programCounter = 0
        instructionSpecifier = 0
        operandSpecifier = 0
        operand = 0
        // I think this left over from Pep/9 QT app
        // operandDisplayFieldWidth = 0
        
        inputBuffer = ""
        outputBuffer = ""
        
        modifiedBytes = Set()
        trapped = false
        tracingTraps = false
        
    }
    
    /// Pre: 0 <= value < 65536
    /// Post: -32768 <= value < 32768 is returned
    func toSignedDecimal(_ value: Int) -> Int {
        return value > 32767 ? value - 65536 : value
    }
    
    /// Pre: -32768 <= value < 32768
    /// Post: 0 <= value < 65536 is returned
    func fromSignedDecimal(_ value: Int) -> Int {
        return value < 0 ? value + 65536 : value
    }
    
    /// Post: NZVC is returned in postions <4..7> of the one-byte int
    func nzvcToInt() -> Int {
        var i: Int = 0
        if (nBit) { i = i | 8 }
        if (zBit) { i = i | 4 }
        if (vBit) { i = i | 2 }
        if (cBit) { i = i | 1 }
        return i
    }
    
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return (lhs + rhs) & 0xffff
    }
    
    func addAndSetNZVC(_ lhs: Int, _ rhs: Int) -> Int {
        var result = lhs + rhs
        
        if (result >= 65536) {
            cBit = true
            result = result & 0xffff
        } else {
            cBit = false
        }
        
        nBit = result < 32768 ? false : true
        zBit = result == 0 ? true : false
        vBit = (lhs < 32768 && rhs < 32768 && result >= 32768) ||
                    (lhs >= 32768 && rhs >= 32768 && result < 32768)
        return result
    }
    
    func loadMem(_ objectCode: [Int]) {
        var objectCode = objectCode
        var i = 0
        while objectCode.count > 0 {
            Mem[i] = objectCode.removeFirst()
            i += 1
        }
    }
    
    
    
    
    // MARK: Methods for Reading from Memory
    
    func readByte(_ addr: Int) -> Int {
        return Mem[addr & 0xffff]
    }
    
    func readWord(_ addr: Int) -> Int {
        return 256 * Mem[addr & 0xffff] + Mem[(addr + 1) & 0xffff]
    }
    
    // Pre: addrMode cannot be immediate.
    func addrOfByteOprnd(addrMode: EAddrMode) -> Int {
        switch addrMode {
        case .None, .All:
            break
        case .I:
            break
        case .D:
            return operandSpecifier
        case .N:
            return readWord(operandSpecifier)
        case .S:
            return add(stackPointer, operandSpecifier)
        case .SF:
            return readWord(add(stackPointer, operandSpecifier))
        case .X:
            return add(operandSpecifier, indexRegister)
        case .SX:
            return add(add(stackPointer, operandSpecifier), indexRegister)
        case .SFX:
            return add(readWord(add(stackPointer, operandSpecifier)), indexRegister)
        }
        
        return 0
    }
    
    func readByteOprnd(addrMode: EAddrMode) -> Int {
        switch addrMode {
        case .None, .All:
            break
        case .I:
            return operandSpecifier
        case .D:
            return readByte(operandSpecifier)
        case .N:
            return readByte(readWord(operandSpecifier))
        case .S:
            return readByte(add(stackPointer, operandSpecifier))
        case .SF:
            return readByte(readWord(add(stackPointer, operandSpecifier)))
        case .X:
            return readByte(add(operandSpecifier, indexRegister))
        case .SX:
            return readByte(add(add(stackPointer, operandSpecifier), indexRegister))
        case .SFX:
            return readByte(add(readWord(add(stackPointer, operandSpecifier)), indexRegister))
        }
        return 0
    }
    
    func readWordOprnd(addrMode: EAddrMode) -> Int {
        switch addrMode {
        case .None, .All:
            break
        case .I:
            return operandSpecifier
        case .D:
            return readWord(operandSpecifier)
        case .N:
            return readWord(readWord(operandSpecifier))
        case .S:
            return readWord(add(stackPointer, operandSpecifier))
        case .SF:
            return readWord(readWord(add(stackPointer, operandSpecifier)))
        case .X:
            return readWord(add(operandSpecifier, indexRegister))
        case .SX:
            return readWord(add(add(stackPointer, operandSpecifier), indexRegister))
        case .SFX:
            return readWord(add(readWord(add(stackPointer, operandSpecifier)), indexRegister))
        }
        return 0
    }
    
    
    
    
    // MARK: Methods for Writing to Memory
    
    /// Pre: 0 <= value < 256
    /// Post: Value is stored in Mem[addr]
    func writeByte(_ addr: Int, _ value: Int) {
        // TODO  
    }
    
    /// Pre: 0 <= value < 65536
    /// Post: The high-end byte of value is stored in Mem[memAddr]
    /// and the low-end byte of value is stored in Mem[memAddr + 1]
    func writeWord(_ addr: Int, _ value: Int) {
        // TODO
    }
    
    func writeByteOprnd(addrMode: EAddrMode, value: Int) {
        switch (addrMode) {
        case .None, .All:
            break
        case .I:
            // illegal
            break
        case .D:
            writeByte(operandSpecifier, value)
        case .N:
            writeByte(readWord(operandSpecifier), value)
        case .S:
            writeByte(add(stackPointer, operandSpecifier), value)
        case .SF:
            writeByte(readWord(add(stackPointer, operandSpecifier)), value)
        case .X:
            writeByte(add(operandSpecifier, indexRegister), value)
        case .SX:
            writeByte(add(add(stackPointer, operandSpecifier), indexRegister), value)
        case .SFX:
            writeByte(add(readWord(add(stackPointer, operandSpecifier)), indexRegister), value)
        }
    }
    
    func writeWordOprnd(addrMode: EAddrMode, value: Int) {
        switch (addrMode) {
        case .None, .All:
            break
        case .I:
            // illegal
            break
        case .D:
            writeWord(operandSpecifier, value)
        case .N:
            writeWord(readWord(operandSpecifier), value)
        case .S:
            writeWord(add(stackPointer, operandSpecifier), value)
        case .SF:
            writeWord(readWord(add(stackPointer, operandSpecifier)), value)
        case .X:
            writeWord(add(operandSpecifier, indexRegister), value)
        case .SX:
            writeWord(add(add(stackPointer, operandSpecifier), indexRegister), value)
        case .SFX:
            writeWord(add(readWord(add(stackPointer, operandSpecifier)), indexRegister), value)
        }
    }
    
    func cellSize(symbolFormat: ESymbolFormat) -> Int {
        switch symbolFormat {
        case .F_1C:
            return 1
        case .F_1D:
            return 1
        case .F_2D:
            return 2
        case .F_1H:
            return 1
        case .F_2H:
            return 2
        default:
            // Should not occur
            assert(false)
            return 0
        }
    }
    
    func vonNeumannStep(errorString: String) -> Bool {
        // TODO
        return true
    }
    
    
    
    // I wrote this function to make the CpuController update() method a bit more elegant. Now that I'm thinking about it, this might be an inappropriate method for the MachineModel.  
    func prettyVersion(_ register: CPURegisters, format: PrettyCPUFormats) -> String {
        var value = 0
        
        // get the value of the field
        switch register {
        case .nBit, .zBit, .vBit, .cBit:
            return ""
        case .accumulator:
            value = accumulator
        case .indexRegister:
            value = indexRegister
        case .stackPointer:
            value = stackPointer
        case .programCounter:
            value = programCounter
        case .instructionSpecifier:
            value = instructionSpecifier
        case .operandSpecifier:
            value = operandSpecifier
        case .operand:
            value = operand
        }
        
        // format
        switch format {
        case .bin:
            return value.toBin8()
        case .hex:
            return "0x\(value.toHex4())"
        case .dec:
            return "\(toSignedDecimal(value))"
        case .mnemon:
            return " " + maps.enumToMnemonMap[maps.decodeMnemonic[instructionSpecifier]]! + maps.commaSpaceStringForAddrMode(addressMode: maps.decodeAddrMode[instructionSpecifier])
            
            
        }
        
        
    }
    
    
}