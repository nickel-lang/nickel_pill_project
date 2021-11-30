let _server = import "server.ncl" in
let _security = import "security.ncl" in
let _application = import "application.ncl" in


let GeneralConfig = {
    security | #(_security.SecurityConfig),
    server | #(_server.ServerConfig),
    application | #(_application.AppConfig),
} in

let InputCfg = {
        meta = {
            seclvl | <LOW_SECURITY, MID_SECURITY, HIGH_SECURITY> | default = `LOW_SECURITY,
        },
        override | #GeneralConfig
    }
in
let input = import "input.ncl" | #InputCfg in

let default_config = fun sec => {
    server = _security.server_sec_config sec,
    security = _security.default_sec_config sec,
} | #GeneralConfig in

let seclvl = if input.seclvl
    then input.seclvl | #(_security.seclvl)
    else `LOW_SECURITY
in


default_config input.meta.seclvl & input.override
