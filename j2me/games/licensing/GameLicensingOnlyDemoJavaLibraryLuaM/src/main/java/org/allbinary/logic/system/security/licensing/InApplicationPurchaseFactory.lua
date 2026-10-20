-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.system.security.licensing

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InApplicationPurchaseFactory = {}
InApplicationPurchaseFactory.__index = InApplicationPurchaseFactory
InApplicationPurchaseFactory.className = "InApplicationPurchaseFactory"


function InApplicationPurchaseFactory.getInstance()
        return InApplicationPurchaseFactory.instance
end


function InApplicationPurchaseFactory.new()
    local self = setmetatable({}, InApplicationPurchaseFactory)
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

InApplicationPurchaseFactory.instance = InApplicationPurchaseFactory.new()

return InApplicationPurchaseFactory

