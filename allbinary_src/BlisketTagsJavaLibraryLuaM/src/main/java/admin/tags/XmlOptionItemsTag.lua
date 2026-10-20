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
-- package admin.tags

local XmlOptionItemsHelperFactory = require("admin.taghelpers.XmlOptionItemsHelperFactory")
local XmlOptionItemsRequestHelperFactory = require("admin.taghelpers.XmlOptionItemsRequestHelperFactory")
local TableTag = require("admin.tags.TableTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XmlOptionItemsTag = {}
XmlOptionItemsTag.__index = XmlOptionItemsTag
XmlOptionItemsTag.className = "XmlOptionItemsTag"
setmetatable(XmlOptionItemsTag, {__index = TableTag})


function XmlOptionItemsTag.new()
    local self = setmetatable(TableTag.new(), XmlOptionItemsTag)
        self:setTagHelperFactory(XmlOptionItemsHelperFactory.new())
        self:setTagRequestHelperFactory(XmlOptionItemsRequestHelperFactory.new())
    return self
end

return XmlOptionItemsTag

