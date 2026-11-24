-- Generated Code Do Not Modify
-- package javax.microedition.lcdui

local NullCommandListener = {}
package.loaded["javax.microedition.lcdui.NullCommandListener"] = NullCommandListener

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CommandListener = require("javax.microedition.lcdui.CommandListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table NullCommandListener is declared before the requires
NullCommandListener.__index = NullCommandListener
NullCommandListener.className = "NullCommandListener"
NullCommandListener.javaClassName = "javax.microedition.lcdui.NullCommandListener"
NullCommandListener.java_implements = " CommandListener "
NullCommandListener.java_interfaces = function() return {CommandListener} end

function NullCommandListener._jinit(self)
    return self
end

function NullCommandListener.new()
    return NullCommandListener._jinit(setmetatable({}, NullCommandListener))
end


function NullCommandListener:commandAction(c, d)
end

NullCommandListener.NULL_COMMAND_LISTENER = NullCommandListener.new()

return NullCommandListener

