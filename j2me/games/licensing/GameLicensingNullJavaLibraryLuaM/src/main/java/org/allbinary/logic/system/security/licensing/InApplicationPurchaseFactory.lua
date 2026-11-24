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
-- package org.allbinary.logic.system.security.licensing

local InApplicationPurchaseFactory = {}
package.loaded["org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory"] = InApplicationPurchaseFactory

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LockableFeature = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeature")

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

-- class table InApplicationPurchaseFactory is declared before the requires
InApplicationPurchaseFactory.__index = InApplicationPurchaseFactory
InApplicationPurchaseFactory.className = "InApplicationPurchaseFactory"
InApplicationPurchaseFactory.javaClassName = "org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory"


function InApplicationPurchaseFactory.getInstance()
        return InApplicationPurchaseFactory.instance_f
end


function InApplicationPurchaseFactory._jinit(self)
    return self
end

function InApplicationPurchaseFactory.new(...)
    local self = setmetatable({}, InApplicationPurchaseFactory)
    InApplicationPurchaseFactory._jinit(self, ...)
    return self
end


function InApplicationPurchaseFactory:init(anyType, stateObject)
end


function InApplicationPurchaseFactory:onCreate(anyType, stateObject)
end


function InApplicationPurchaseFactory:onStart()
end


function InApplicationPurchaseFactory:onResult(requestCode, resultCode, data)
end


function InApplicationPurchaseFactory:onSaveState(anyType)
end


function InApplicationPurchaseFactory:onStop()
end


function InApplicationPurchaseFactory:onDestroy()
end


function InApplicationPurchaseFactory:purchase(lockableFeature)
end


function InApplicationPurchaseFactory:isPurchased(lockableFeature)
        return false
end


function InApplicationPurchaseFactory:add(lockableFeature)
end


function InApplicationPurchaseFactory:getUserName()
        return StringUtil.getInstance().EMPTY_STRING
end


function InApplicationPurchaseFactory:isEnabled()
        return false
end

InApplicationPurchaseFactory.instance_f = InApplicationPurchaseFactory.new()

return InApplicationPurchaseFactory

