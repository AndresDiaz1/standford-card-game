# standford-card-game

**lazy var**: A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

**@IBOutlet**: Used for out components such as labels, or in out components such as text boxes. 

**@IBAction**: Used for action components like buttons.

**didSet**: Like an observer executed each time the variable changes.

**structs vs classes**: structs are copied and classes are by reference. Both have free `init()`

**nested if**: you can use `if (x, y){...` will be translated as a nested if 

**Access Control**:
-Internal: this is the default, it means "usable by any object in my app or framework"
-private: this means "only callable from within this object"
-private(set): this means "this property is readable outside this project, but not settable"
-fileprivate: accessible by any code in this source file
-public: (for frameworks only) this can be used by objects outside my framework
-open: (for frameworks only) public and objects outside my framework can subclass this

**Extensions**: you can add methods/properties to a class/struct/enum (even if you don't have the source) like add to the prototype in JS

**Protocol**: Is simply a list of methods and vars with no implementation. Are a way to express an API more concisely. A protocl is a TYPE!  
