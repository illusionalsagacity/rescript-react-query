type t

external int: int => t = "%identity"
external unsafe_float: float => t = "%identity"
let infinity: unit => t = () => unsafe_float(Float.Constants.positiveInfinity)