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

local ThirdPartyInApplicationPurchase = {}
package.loaded["org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchase"] = ThirdPartyInApplicationPurchase

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
local ThirdPartyInApplicationPurchaseInterface = require("org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchaseInterface")
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

-- class table ThirdPartyInApplicationPurchase is declared before the requires
ThirdPartyInApplicationPurchase.__index = ThirdPartyInApplicationPurchase
ThirdPartyInApplicationPurchase.className = "ThirdPartyInApplicationPurchase"
ThirdPartyInApplicationPurchase.javaClassName = "org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchase"
ThirdPartyInApplicationPurchase.java_implements = " ThirdPartyInApplicationPurchaseInterface "
ThirdPartyInApplicationPurchase.java_interfaces = function() return {ThirdPartyInApplicationPurchaseInterface} end

function ThirdPartyInApplicationPurchase._jinit(self)
    return self
end

function ThirdPartyInApplicationPurchase.new()
    return ThirdPartyInApplicationPurchase._jinit(setmetatable({}, ThirdPartyInApplicationPurchase))
end


function ThirdPartyInApplicationPurchase:isPurchased(lockableFeature)
        return false
end


function ThirdPartyInApplicationPurchase:onCreate(anyType, stateObject)
end


function ThirdPartyInApplicationPurchase:onDestroy()
end


function ThirdPartyInApplicationPurchase:onStart()
end


function ThirdPartyInApplicationPurchase:onActivityResult(requestCode, resultCode, dataObject)
end


function ThirdPartyInApplicationPurchase:onSaveInstanceState(anyType)
end


function ThirdPartyInApplicationPurchase:onStop()
end


function ThirdPartyInApplicationPurchase:requestPurchase(lockableFeature)
end


function ThirdPartyInApplicationPurchase:requestReceipts()
end


function ThirdPartyInApplicationPurchase:add(lockableFeature)
end


function ThirdPartyInApplicationPurchase:getUserName()
        return StringUtil.getInstance().EMPTY_STRING
end


function ThirdPartyInApplicationPurchase:isEnabled()
        return false
end


function ThirdPartyInApplicationPurchase:requestProducts()
end

return ThirdPartyInApplicationPurchase

