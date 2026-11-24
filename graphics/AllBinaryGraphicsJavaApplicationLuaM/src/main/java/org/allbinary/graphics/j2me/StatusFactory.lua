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
-- package org.allbinary.graphics.j2me

local StatusFactory = {}
package.loaded["org.allbinary.graphics.j2me.StatusFactory"] = StatusFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local MyFrame = java_lazy("org.allbinary.graphics.j2me.MyFrame")

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

-- class table StatusFactory is declared before the requires
StatusFactory.__index = StatusFactory
StatusFactory.className = "StatusFactory"
StatusFactory.javaClassName = "org.allbinary.graphics.j2me.StatusFactory"

function StatusFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SETSTATUS = "setStatus"
    self.STATUS_LABEL = "Status: "
end

function StatusFactory._jinit(self)
    StatusFactory._init_fields(self)
    return self
end

function StatusFactory.new()
    return StatusFactory._jinit(setmetatable({}, StatusFactory))
end


function StatusFactory.getInstance()
        return StatusFactory.instance_f
end


function StatusFactory:setStatusNoLog(status)
        MyFrame.statusJLabel:setText(status)
end


function StatusFactory:setStatus(status)
        self:setStatusNoLog(status)
        self.logUtil:putF(self.STATUS_LABEL .. status, self, self.SETSTATUS)
end

StatusFactory.instance_f = StatusFactory.new()

return StatusFactory

