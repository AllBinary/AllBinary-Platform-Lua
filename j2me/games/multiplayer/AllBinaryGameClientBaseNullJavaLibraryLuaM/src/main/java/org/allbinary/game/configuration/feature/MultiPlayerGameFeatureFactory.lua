-- Generated Code Do Not Modify
-- package org.allbinary.game.configuration.feature

local MultiPlayerGameFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.MultiPlayerGameFeatureFactory"] = MultiPlayerGameFeatureFactory

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")

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

-- class table MultiPlayerGameFeatureFactory is declared before the requires
MultiPlayerGameFeatureFactory.__index = MultiPlayerGameFeatureFactory
MultiPlayerGameFeatureFactory.className = "MultiPlayerGameFeatureFactory"
MultiPlayerGameFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.MultiPlayerGameFeatureFactory"


function MultiPlayerGameFeatureFactory.getInstance()
        return MultiPlayerGameFeatureFactory.instance_f
end


function MultiPlayerGameFeatureFactory._jinit(self)
    return self
end

function MultiPlayerGameFeatureFactory.new(...)
    local self = setmetatable({}, MultiPlayerGameFeatureFactory)
    MultiPlayerGameFeatureFactory._jinit(self, ...)
    return self
end


function MultiPlayerGameFeatureFactory:addCommands(anyType)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        local canvas = anyType
        canvas:addCommand(gameCommandsFactory.QUIT_COMMAND)
end

MultiPlayerGameFeatureFactory.instance_f = MultiPlayerGameFeatureFactory.new()

return MultiPlayerGameFeatureFactory

