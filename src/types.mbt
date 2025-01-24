struct File {
  file_name: String
  dir_path: String
  file_abs_path: String
  mut curr_line: Int
  mut curr_offset: Int
}derive(Show)

enum FileError {
  FileNotFound
  ModIsInvalid
}derive(Show)

enum FileMod {
  Read
  Write
  None
}derive(Show,Eq)