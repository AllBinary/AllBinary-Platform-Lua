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

local ThirdPartyInApplicationPurchaseInterface = {}
package.loaded["org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchaseInterface"] = ThirdPartyInApplicationPurchaseInterface

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

-- Java interface
-- class table ThirdPartyInApplicationPurchaseInterface is declared before the requires
ThirdPartyInApplicationPurchaseInterface.__index = ThirdPartyInApplicationPurchaseInterface
ThirdPartyInApplicationPurchaseInterface.className = "ThirdPartyInApplicationPurchaseInterface"
ThirdPartyInApplicationPurchaseInterface.javaClassName = "org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchaseInterface"


function ThirdPartyInApplicationPurchaseInterface:isPurchased(lockableFeature)
    error("abstract method isPurchased")
end


function ThirdPartyInApplicationPurchaseInterface:onCreate(anyType, stateObject)
    error("abstract method onCreate")
end


function ThirdPartyInApplicationPurchaseInterface:onDestroy()
    error("abstract method onDestroy")
end


function ThirdPartyInApplicationPurchaseInterface:onStart()
    error("abstract method onStart")
end


function ThirdPartyInApplicationPurchaseInterface:onActivityResult(requestCode, resultCode, dataObject)
    error("abstract method onActivityResult")
end


function ThirdPartyInApplicationPurchaseInterface:onSaveInstanceState(anyType)
    error("abstract method onSaveInstanceState")
end


function ThirdPartyInApplicationPurchaseInterface:onStop()
    error("abstract method onStop")
end


function ThirdPartyInApplicationPurchaseInterface:requestPurchase(lockableFeature)
    error("abstract method requestPurchase")
end


function ThirdPartyInApplicationPurchaseInterface:requestReceipts()
    error("abstract method requestReceipts")
end


function ThirdPartyInApplicationPurchaseInterface:add(lockableFeature)
    error("abstract method add")
end


function ThirdPartyInApplicationPurchaseInterface:getUserName()
    error("abstract method getUserName")
end


function ThirdPartyInApplicationPurchaseInterface:isEnabled()
    error("abstract method isEnabled")
end

return ThirdPartyInApplicationPurchaseInterface

