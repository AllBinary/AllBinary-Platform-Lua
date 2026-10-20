-- Generated Code Do Not Modify
-- package javax.microedition.lcdui

local CommandListener = require("javax.microedition.lcdui.CommandListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullCommandListener = {}
NullCommandListener.__index = NullCommandListener
NullCommandListener.className = "NullCommandListener"

function NullCommandListener.new()
    local self = setmetatable({}, NullCommandListener)
    return self
end


function NullCommandListener:commandAction(c, d)
end

NullCommandListener.NULL_COMMAND_LISTENER = NullCommandListener.new()

return NullCommandListener

