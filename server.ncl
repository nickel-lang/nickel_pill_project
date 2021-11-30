let PortNumber = fun l v =>
    if v <= 1023
        then contracts.blame (contracts.tag "Port number not available" l)
        else v
in
{
    ServerConfig = {
        port | Num
             | #PortNumber
             | doc "The port to use (has to be > 1023)"
             | default = 8080,
        
        host | Str
             | doc "The name of the host"
             | default = "localhost",

        restricted | Bool
                   | doc "Wether the admin panel is in restricted access or not"
                   | default = false
    },
}
