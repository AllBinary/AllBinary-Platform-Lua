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
-- package org.allbinary.business.user.commerce.inventory.item

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ItemFactoryUnused = {}
ItemFactoryUnused.__index = ItemFactoryUnused
ItemFactoryUnused.className = "ItemFactoryUnused"


function ItemFactoryUnused.new()
    local self = setmetatable({}, ItemFactoryUnused)
    return self
end


-- throws MoneyException
function ItemFactoryUnused.getInstance(hashMap)
        return Item.new(hashMap)
end


-- throws Exception, MoneyException
-- Java overloaded method: Lua keeps the last definition
function ItemFactoryUnused.getInstance(request)
        return Item.new(RequestParams.new(request):toHashMap())
end

return ItemFactoryUnused

