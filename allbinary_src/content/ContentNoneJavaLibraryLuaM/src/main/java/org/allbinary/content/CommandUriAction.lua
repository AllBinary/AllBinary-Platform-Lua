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
-- package org.allbinary.content

local CommandUriAction = {}
package.loaded["org.allbinary.content.CommandUriAction"] = CommandUriAction

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

local Command = java_lazy("javax.microedition.lcdui.Command")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

-- class table CommandUriAction is declared before the requires
CommandUriAction.__index = CommandUriAction
CommandUriAction.className = "CommandUriAction"
CommandUriAction.javaClassName = "org.allbinary.content.CommandUriAction"

function CommandUriAction:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CommandUriAction._jinit(self)
    CommandUriAction._init_fields(self)
    return self
end

function CommandUriAction.new()
    return CommandUriAction._jinit(setmetatable({}, CommandUriAction))
end


function CommandUriAction.getInstance()
        return CommandUriAction.instance_f
end


function CommandUriAction:add(command, url)
end


function CommandUriAction:process(command)
end

CommandUriAction.instance_f = CommandUriAction.new()

return CommandUriAction

