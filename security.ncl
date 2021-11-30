let _server = import "server.ncl" in
{
    SecurityConfig = {
        firewall | default = false
                 | doc "Wether to set a firewall or not"
                 | Bool,
    },

    defaultconf = {} | #SecurityConfig,

    default_sec_config = fun s =>
        if s == `LOW_SECURITY
            then defaultconf
        else if s == `MID_SECURITY
            then defaultconf
        else if s == `HIGH_SECURITY
            then defaultconf & { firewall = true }
        else
            contracts.blame (contracts.tag "Security level not recognized"),

    server_sec_config = fun s =>
        if s == `HIGH_SECURITY
            then { restricted = true } | #(_server.ServerConfig)
            else {} | #(_server.ServerConfig),

    sec_lvl | <LOW_SECURITY, MID_SECURITY, LOW_SECURITY> | default = `LOW_SECURITY,
}
