--
-- AllBinary Open License Version 1
-- Copyright (c) 2022 AllBinary
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
-- package org.allbinary.graphics.displayable.screen

local WebCommandProcessor = {}
package.loaded["org.allbinary.graphics.displayable.screen.WebCommandProcessor"] = WebCommandProcessor

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local Command = java_lazy("javax.microedition.lcdui.Command")
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PlayN = java_lazy("playn.core.PlayN")
local AboutCommandProcessor = java_lazy("org.allbinary.graphics.displayable.screen.AboutCommandProcessor")

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

-- class table WebCommandProcessor is declared before the requires
WebCommandProcessor.__index = WebCommandProcessor
WebCommandProcessor.className = "WebCommandProcessor"
WebCommandProcessor.javaClassName = "org.allbinary.graphics.displayable.screen.WebCommandProcessor"

function WebCommandProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.aboutCommandProcessor = AboutCommandProcessor.getInstance()
    self.list = BasicArrayListD.new()
end

function WebCommandProcessor._jinit(self)
    WebCommandProcessor._init_fields(self)
    return self
end

function WebCommandProcessor.new()
    return WebCommandProcessor._jinit(setmetatable({}, WebCommandProcessor))
end


function WebCommandProcessor.getInstance()
        return WebCommandProcessor.instance_f
end


function WebCommandProcessor:process(midletCommandListener, command, canvas)
        local try_ok, try_error, try_value = pcall(function()
            PlayN.openURL(self.list:removeAt(0))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.PROCESS, e)
        end
end

WebCommandProcessor.instance_f = WebCommandProcessor.new()

return WebCommandProcessor

