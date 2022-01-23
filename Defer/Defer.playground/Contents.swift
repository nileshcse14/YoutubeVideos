import  Foundation


//A defer statement is used for executing code just before transferring program control outside of the scope that the defer statement appears in.

var value = 0

func letsUnderStandDefer() -> Int {
    defer {
        value = value + 1
    }
    
    return value
}

print(letsUnderStandDefer())
print(value)

func interViewQuestion() {
    print("Step1")
    defer {
        print("Step2")
    }
    defer {
        defer {
            print("Step 6")
        }
        print("Step4")
    }
    defer {
        print("Step5")
    }
    print("Step3")
}

interViewQuestion()

// 1, 3, 5, 4, 6, 2

func A() {
    defer {
        print("Step 6")
    }
    print("Step4")
}
