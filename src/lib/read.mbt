pub fn read(path:String) -> String{
  @fs.read_file_to_string?(path~).unwrap()
}