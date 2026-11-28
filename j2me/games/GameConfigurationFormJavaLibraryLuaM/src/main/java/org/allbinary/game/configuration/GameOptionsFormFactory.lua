--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.configuration

local GameOptionsFormFactory = {}
package.loaded["org.allbinary.game.configuration.GameOptionsFormFactory"] = GameOptionsFormFactory

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

local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CommandForm = java_lazy("org.allbinary.graphics.displayable.screen.CommandForm")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameOptionsForm = java_lazy("org.allbinary.game.configuration.GameOptionsForm")

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

-- class table GameOptionsFormFactory is declared before the requires
GameOptionsFormFactory.__index = GameOptionsFormFactory
GameOptionsFormFactory.className = "GameOptionsFormFactory"
GameOptionsFormFactory.javaClassName = "org.allbinary.game.configuration.GameOptionsFormFactory"

function GameOptionsFormFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function GameOptionsFormFactory._jinit(self)
    GameOptionsFormFactory._init_fields(self)
    return self
end

function GameOptionsFormFactory.new(...)
    local self = setmetatable({}, GameOptionsFormFactory)
    GameOptionsFormFactory._jinit(self, ...)
    return self
end


function GameOptionsFormFactory.getInstance()
        return GameOptionsFormFactory.instance_f
end


function GameOptionsFormFactory:init(commandListener, title, backgrounBasicColor, foregroundBasicColor)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", GameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
            return CommandForm.getNullCommandForm()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

GameOptionsFormFactory.instance_f = GameOptionsFormFactory.new()

return GameOptionsFormFactory

