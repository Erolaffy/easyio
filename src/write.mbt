fn create_dir(path:String) -> Unit{
    let path1 = path.substring(start=0,end=path.last_index_of("/"))
    @fs.create_dir(path=path1)
}

pub fn write(path:String,content:String) -> Unit{
  if not(@fs.path_exists(path~)) {
    create_dir(path)
  }
  @fs.write_string_to_file(path~,content~)
}

pub fn write_append(path:String,content:String) -> Unit{
    
}