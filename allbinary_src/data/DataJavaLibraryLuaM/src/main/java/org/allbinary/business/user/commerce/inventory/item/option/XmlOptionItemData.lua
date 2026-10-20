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
-- package org.allbinary.business.user.commerce.inventory.item.option


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XmlOptionItemData = {}
XmlOptionItemData.__index = XmlOptionItemData
XmlOptionItemData.className = "XmlOptionItemData"

function XmlOptionItemData.new()
    local self = setmetatable({}, XmlOptionItemData)
    return self
end

XmlOptionItemData.XML_FILE_STATUS = "XMLOPTIONITEM_XML_FILE_STATUS"
XmlOptionItemData.OPTION_XML_FILE = "XMLOPTIONITEM_OPTION_XML_FILE"

return XmlOptionItemData

