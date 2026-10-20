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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ThirdPartyInApplicationPurchaseInterface = require("org.allbinary.logic.system.security.licensing.ThirdPartyInApplicationPurchaseInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThirdPartyInApplicationPurchase = {}
ThirdPartyInApplicationPurchase.__index = ThirdPartyInApplicationPurchase
ThirdPartyInApplicationPurchase.className = "ThirdPartyInApplicationPurchase"

function ThirdPartyInApplicationPurchase.new()
    local self = setmetatable({}, ThirdPartyInApplicationPurchase)
    return self
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

