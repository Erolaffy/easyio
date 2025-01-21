///| Reads the entire contents of a file into a string.If the file does not exist, return Err.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
///
/// # Returns
/// A `String` containing the file contents.
pub fn read(path:String) -> String{
  let res = @fs.read_file_to_string?(path~)
  if res.is_err() {
    return res.to_string()
  }else{
    return res.unwrap()
  }
}

///| Reads the number of lines in the file.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
///
/// # Returns
/// A `Int` containing the file lines.
pub fn file_line(path:String) -> Int {
  let res = read(path)
  if @fs.path_exists(path~) {
    res.split("\n").to_array().length()
  }else{
    -1
  }
}

///| Reads the content of a specified line in the file.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `line`: A specified line in the file.
///
/// # Returns
/// A `String` containing the content of a specified line.
pub fn read_line(path:String,line:Int) -> String {
  if @fs.path_exists(path~){
    if line-1 < 0 || line > file_line(path) {
      "Err : line is invalid"
    }else{
      read(path).split("\n").to_array()[line-1]
    }
  }else{
    "Err : file \{path} not found"
  }
  
}

///| Reads the specified several lines of file and return them in the form of an array.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `start`: The starting line in the file.
/// - `end`: The ending line in the file.
///
/// # Returns
/// A `Array` containing the content of specified lines.
///
/// Example:
///
/// ```moonbit
/// test {
///   let path = "test/a.txt"
///   assert_eq!(@eio.read_lines_toarray(path,start=1,end=3), ["2","3"])
///   assert_eq!(@eio.read_lines_toarray(path), ["1","2","3","4","5"])
/// }
pub fn read_lines_toarray(path:String,start~:Int=0,end~:Int=file_line(path)) -> Array[String] {
  if @fs.path_exists(path~){
    read(path).split("\n").to_array()[start:end].iter().to_array()
  }else{
    []
  }
}

///| Reads the specified several lines of file.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `start`: The starting line in the file.
/// - `end`: The ending line in the file.
///
/// # Returns
/// A `String` containing the content of specified lines.
/// 
/// Example:
///
/// ```moonbit
/// test {
///   let path = "test/a.txt"
///   assert_eq!(@eio.read_lines(path,start=1,end=3), "2\n3\n")
///   assert_eq!(@eio.read_lines(path), "1\n2\n3\n4\n5\n")
/// }
pub fn read_lines(path:String,start~:Int=0,end~:Int=file_line(path)) -> String {
  if @fs.path_exists(path~){
    let mut res = ""
    read_lines_toarray(path,start~,end~).each(fn(s){res+=s+"\n"})
    res
  }else{
    "Err : file \{path} not found"
  }
}