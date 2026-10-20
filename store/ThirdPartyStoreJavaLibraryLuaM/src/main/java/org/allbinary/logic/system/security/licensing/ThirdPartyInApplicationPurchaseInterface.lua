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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ThirdPartyInApplicationPurchaseInterface = {}
ThirdPartyInApplicationPurchaseInterface.__index = ThirdPartyInApplicationPurchaseInterface
ThirdPartyInApplicationPurchaseInterface.className = "ThirdPartyInApplicationPurchaseInterface"


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

