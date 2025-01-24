// Handle the path string
// The first index of the array represents the folder of the file path
// The second index represents the file name
fn path_handle(path: String) -> Array[String] {
  let path_arr = ["./",""]
  let index = path.last_index_of("/")

  if path.contains("/") {
    path_arr[0]=path.substring(end=index+1)
    path_arr[1]=path.substring(start=index+1)
  }else{
    path_arr[1]=path
  }

  path_arr
}