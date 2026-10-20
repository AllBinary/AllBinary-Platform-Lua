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

local SpecialItemsHelperFactory = require("admin.taghelpers.SpecialItemsHelperFactory")
local SpecialItemsRequestHelperFactory = require("admin.taghelpers.SpecialItemsRequestHelperFactory")
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

local SpecialItemsTag = {}
SpecialItemsTag.__index = SpecialItemsTag
SpecialItemsTag.className = "SpecialItemsTag"
setmetatable(SpecialItemsTag, {__index = TableTag})


function SpecialItemsTag.new()
    local self = setmetatable(TableTag.new(), SpecialItemsTag)
        self:setTagHelperFactory(SpecialItemsHelperFactory.new())
        self:setTagRequestHelperFactory(SpecialItemsRequestHelperFactory.new())
    return self
end

return SpecialItemsTag

