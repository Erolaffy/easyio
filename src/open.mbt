///| Initialize a file object so as to facilitate subsequent read and write operations on it.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `mod`: A `String` representing the operation performed on this file
///
/// # Returns
/// `File` if file is exist,else `Err(FileError)`
pub fn open(path: String,mod: String) -> Result[File,FileError] {
  let j = @fs.is_file?(path~)
  let file_mod = match mod{
    "w" => Write
    "r" => Read
    _ => FileMod::None
  }

  guard j.is_ok() || file_mod == Write else { Err(FileNotFound) }
  guard file_mod != FileMod::None else { Err(ModIsInvalid) }
  println(1)
  let path_arr = path_handle(path)
  let file = {file_name: path_arr[1],
                    dir_path: path_arr[0],
                    file_abs_path: path_arr[0]+path_arr[1],
                    curr_line: 0,
                    curr_offset: 0}
  file.curr_line = 1
  file.curr_offset = 1
println(2)
  Ok(file)
}