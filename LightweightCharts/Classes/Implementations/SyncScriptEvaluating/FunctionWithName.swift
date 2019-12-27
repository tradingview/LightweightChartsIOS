struct FunctionWithName<T: Decodable> {
    let name: String
    let function: JavaScriptMethod<T>
}
