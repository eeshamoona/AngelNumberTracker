//
//  NumberViewModel.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
class NumberViewModel: ObservableObject {
    @Published var nums: [Number] = []{
        didSet{
            saveNumbers()
        }
    }
    
    var forKeyName : String = "numbers_list"
    init() {
        getEntryNums()
        if(nums.isEmpty){
            let initialSetOfNumbers = [
                Number(number: "1234", definition: "You are making progress!", timeSeen: 0),
                Number(number: "123", definition: "The universe is proud of you!", timeSeen: 0),
                Number(number: "234", definition: "Make a wish!", timeSeen: 0),
                Number(number: "1111", definition: "Keep your eyes open for opportunties!", timeSeen: 0),
                Number(number: "111", definition: "Be careful and be prepared!", timeSeen: 0),
                Number(number: "222", definition: "You are making progress!", timeSeen: 0),
                Number(number: "333", definition: "The universe is proud of you!", timeSeen: 0),
                Number(number: "444", definition: "Make a wish!", timeSeen: 0),
                Number(number: "555", definition: "Keep your eyes open for opportunties!", timeSeen: 0),
                Number(number: "666", definition: "Be careful and be prepared!", timeSeen: 0),
                Number(number: "777", definition: "You are making progress!", timeSeen: 0),
                Number(number: "888", definition: "The universe is proud of you!", timeSeen: 0),
                Number(number: "999", definition: "Make a wish!", timeSeen: 0),
                Number(number: "321", definition: "Keep your eyes open for opportunties!", timeSeen: 0),
                Number(number: "456", definition: "Be careful and be prepared!", timeSeen: 0)
            ]
            nums.append(contentsOf: initialSetOfNumbers)
            nums = (sortList() ?? nums)
        }
    }
    
    func getEntryNums() {
        
        guard
            let data = UserDefaults.standard.data(forKey: forKeyName)
        else { return }
        guard
            let savedNumbers = try? JSONDecoder().decode([Number].self, from: data)
        else { return }

        self.nums = (savedNumbers)
        
    }
    
    func deleteEntryNum(indexSet: IndexSet) {
        nums.remove(atOffsets: indexSet)
    }
    
    func addNewNumber (angelNum : String, angelDefinition : String){
        let newEntry = Number(number: angelNum, definition: angelDefinition, timeSeen: 0)
        nums.append(newEntry)
    }
    
    func getNumberDefinition (angelNum : String) -> String?{
        if(idxOf(angelNum: angelNum) != nil) {
            return nums[idxOf(angelNum: angelNum)!].definition
        }
        return nil
    }
    
    func incrementTimesSeenFor(angelNum: String) {
        let selectedNum: Number = nums[(idxOf(angelNum: angelNum)!)]
        nums[idxOf(angelNum: angelNum)!] = Number(number: selectedNum.number, definition: selectedNum.definition, timeSeen: selectedNum.timeSeen + 1)
    }
    
    func sortList() -> [Number]? {
        return nums.sorted(by: { $0.timeSeen > $1.timeSeen })

    }
    func idxOf(angelNum: String) -> Int? {
        for (index, value) in nums.enumerated(){
            if (value.number == angelNum) {
                return index
            }
        }
        return nil
    }
    
    func saveNumbers () {
        if let encodedData = try? JSONEncoder().encode(nums){
            UserDefaults.standard.set(encodedData, forKey: forKeyName)
        }
    }
    
}
