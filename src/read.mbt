fn get_line(self: File) -> Int {
  read_lines(self).length()
}


///| Reads the entire contents of a file into a string.
///
/// # Returns
/// A `String` containing the file contents.
pub fn read(self: File) -> String{
  let c = @fs.read_file_to_string?(path=self.file_abs_path)
  
  c.unwrap()
}


///| Reading the content of a line in the file and automatically moving to the next line.
///
/// # Returns
/// A `String` containing the content of a line.
///
/// Example:
///
/// ```moonbit
/// test {
///  let f_o = @eio.open("a.txt","r")
///  guard f_o.is_ok() else{println(f_o)}
///  let f = f_o.unwrap()
///  assert_eq!(@eio.read_line(), "1")
///  assert_eq!(@eio.read_line(), "2")
///  assert_eq!(@eio.read_line(), "3")
/// }
pub fn read_line(self: File) -> String? {
  let arr = read_lines(self)

  guard arr.length() > 0 else { None }
  guard self.curr_line != -1 else { None }
  let line = arr[self.curr_line-1]
  
  self.curr_line += 1
  if self.curr_line > get_line(self) {
    self.curr_line = -1
  }

  Some(line)
}

///| Reading the content of the file and returning an array composed of the content of each line.
///
/// # Returns
/// A `Array[String]` containing the content of the file.
///
/// Example:
///
/// ```moonbit
/// test {
///  let f_o = @eio.open("a.txt","r")
///  guard f_o.is_ok() else{println(f_o)}
///  let f = f_o.unwrap()
///  assert_eq!(@eio.read_lines()), ["1","2","3","4","5"])
/// }
pub fn read_lines(self: File) -> Array[String] {
  let c = @fs.read_file_to_string?(path=self.file_abs_path).unwrap()

  c.split("\n").collect()
}