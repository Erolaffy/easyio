pub fn read(path:String) -> String{
  let res = @fs.read_file_to_string?(path~)
  if res.is_err() {
    return res.to_string()
  }else{
    return res.unwrap()
  }
}

pub fn file_line(path:String) -> Int {
  read(path).split("\n").to_array().length()
}
pub fn read_line(path:String,line:Int) -> String {
  if line-1 < 0 || line > file_line(path) {
    "Err:line is invaild"
  }else{
    read(path).split("\n").to_array()[line-1]
  }
}

pub fn read_lines_array(path:String,start~:Int=0,end~:Int=file_line(path)) -> ArrayView[String] {
  read(path).split("\n").to_array()[start:end]
}
pub fn read_lines(path:String,start~:Int=0,end~:Int=file_line(path)) -> String {
  let mut res = ""
  read_lines_array(path,start~,end~).each(fn(s){res+=s+"\n"})
  res
}