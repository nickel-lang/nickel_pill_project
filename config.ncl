let input = import "input.ncl" in

let Configuration = {
  host | Str | default = "localhost",
  website_name | Str | default = "myapp",
  port | Num | default = 8081,
} in

input.manualdef | #Configuration
