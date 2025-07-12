alias SDictStorage = Dict[String, Dict[String, String]]

@value
struct SDict:
    var storage: SDictStorage

    fn __init__(out self):
        self.storage = SDictStorage()

    fn setItem(mut self, key: String, value: Dict[String, String]):
        self.storage[key] = value
    
    fn getItem(self, key: String) raises -> Dict[String, String]:
        var out = self.storage[key]
        return out