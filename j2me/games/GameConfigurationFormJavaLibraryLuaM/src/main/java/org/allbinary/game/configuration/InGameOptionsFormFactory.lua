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

local InGameOptionsFormFactory = {}
package.loaded["org.allbinary.game.configuration.InGameOptionsFormFactory"] = InGameOptionsFormFactory

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
local Init = java_lazy("org.allbinary.init.Init")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local InGameOptionsForm = java_lazy("org.allbinary.game.configuration.InGameOptionsForm")

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

-- class table InGameOptionsFormFactory is declared before the requires
InGameOptionsFormFactory.__index = InGameOptionsFormFactory
InGameOptionsFormFactory.className = "InGameOptionsFormFactory"
InGameOptionsFormFactory.javaClassName = "org.allbinary.game.configuration.InGameOptionsFormFactory"

function InGameOptionsFormFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SINGLETON = CommandForm.getNullCommandForm()
end

function InGameOptionsFormFactory._jinit(self)
    InGameOptionsFormFactory._init_fields(self)
    return self
end

function InGameOptionsFormFactory.new()
    return InGameOptionsFormFactory._jinit(setmetatable({}, InGameOptionsFormFactory))
end


function InGameOptionsFormFactory.getInstance()
        if rawequal(InGameOptionsFormFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            InGameOptionsFormFactory.instance_f = InGameOptionsFormFactory.new()
        end
        return InGameOptionsFormFactory.instance_f
end


function InGameOptionsFormFactory:init(commandListener, initInterface, title, backgrounBasicColor, foregroundBasicColor)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(self.SINGLETON, CommandForm.getNullCommandForm()) then
                initInterface:init()
                self.SINGLETON = InGameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end


function InGameOptionsFormFactory:get()
        return self.SINGLETON
end

InGameOptionsFormFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return InGameOptionsFormFactory

