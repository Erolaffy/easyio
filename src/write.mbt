fn create_dir(path:String) -> Unit{
    let path1 = path.substring(start=0,end=path.last_index_of("/"))
    @fs.create_dir(path=path1)
}

///| Writes a string to a file.If the path does not exist, it will be created automatically.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `content`: A `String` containing the content to be written to the file.
pub fn write(path:String,content:String) -> Unit{
  if not(@fs.path_exists(path~)) {
    create_dir(path)
  }
  @fs.write_string_to_file(path~,content~)
}

///| Append a string to the end of a file.
///
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `content`: A `String` containing the content to be appended to the file.
pub fn write_append(path:String,content:String) -> Unit{
    write(path,read(path)+content)
}

///| Insert a string at the specified position in the file.
/// 
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `content`: A `String` containing the content to be inserted into the file.
/// - `offset`: Offset relative to the beginning of the file.
pub fn write_insert(path:String,content:String,offset:Int) -> Unit{
    let orign = read(path)
    if offset<0 || offset > orign.length(){
        println("Err : offset is invalid")
    }else{
        let l_t = orign.substring(end=offset)
        let r_t = orign.substring(start=offset,end=orign.length())
        write(path,l_t+content+r_t)
    }
    
}

///| Insert a string at the specified line in the file.
/// 
/// # Parameters
/// - `path`: A `String` representing the file path.
/// - `content`: A `String` containing the content to be inserted into the file.
/// - `line`: Insert into the line number of the file.
pub fn write_insert_line(path:String,content:String,line:Int) -> Unit{
    let orign = read_lines_toarray(path)
    if line<0 || line > file_line(path){
        println("Err : offset is invalid")
    }else{
        let l_t = orign[0:line]
        let r_t = orign[line:file_line(path)]
        let mut res = ""
        l_t.each(fn(s){res+=s+"\n"})
        res+=content+"\n"
        r_t.each(fn(s){res+=s+"\n"})
        write(path,res)
    }
    
}