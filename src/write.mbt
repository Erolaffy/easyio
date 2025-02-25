fn create_dir(self: File) -> Unit{
  let dir_path = self.dir_path
  if not(dir_path.is_empty()) {
    let _ = @fs.create_dir?(dir_path)
  }
    
}

///| Writes a string to a file.If the file does not exist, it will be created automatically.
///
/// # Parameters
/// - `self`: A File to write.
/// - `content`: A `String` containing the content to be written to the file.
/// 
/// Example:
///
/// ```moonbit
/// test {
///  let f_o = @eio.open("a.txt","r")
///  guard f_o.is_ok() else{println(f_o)}
///  let f = f_o.unwrap()
///  fwrite("1\n2\n3\n4")
/// }
pub fn write(self: File,content: String) -> Unit{
  if not(@fs.path_exists(self.file_abs_path)) {
    create_dir(self)
  }
  let _ = @fs.write_string_to_file?(self.file_abs_path,content)
}

///| Append a string to the end of a file.
///
/// Example:
///
/// ```moonbit
/// test {
///  let f_o = @eio.open("a.txt","r")
///  guard f_o.is_ok() else{println(f_o)}
///  let f = f_o.unwrap()
///  f.write_append("4\n5")
/// }
pub fn write_append(self: File,content: String) -> Unit {
  let c = @fs.read_file_to_string?(self.file_abs_path).unwrap()
  write(self,c+content)
}


///| Append some lines to the end of a file.
///
/// Example:
///
/// ```moonbit
/// test {
///  let f_o = @eio.open("a.txt","r")
///  guard f_o.is_ok() else{println(f_o)}
///  let f = f_o.unwrap()
///  f.write_lines(["1","2","3"])
/// }
pub fn write_lines(self: File,contents: Array[String]) -> Unit {
  let c = @fs.read_file_to_string?(self.file_abs_path).unwrap()
  let mut wa = ""
  if c[c.length()-1] != '\n'{wa+="\n"}

  contents.each(fn(s){
    wa += s + "\n"
  })
  write_append(self, wa)
  
}