fn main {
  let f_o = @eio.open("b/w","r")
  guard f_o.is_ok()
  let f = f_o.unwrap()
  // f.write_lines(["1","3"])
  println(f.write("2"))
}