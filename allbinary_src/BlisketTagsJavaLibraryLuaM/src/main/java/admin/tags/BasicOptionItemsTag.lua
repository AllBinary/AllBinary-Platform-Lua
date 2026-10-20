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

-- local HashMap = require("java.util.HashMap")
local BasicOptionItemsHelperFactory = require("admin.taghelpers.BasicOptionItemsHelperFactory")
local BasicOptionItemsRequestHelperFactory = require("admin.taghelpers.BasicOptionItemsRequestHelperFactory")
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

local BasicOptionItemsTag = {}
BasicOptionItemsTag.__index = BasicOptionItemsTag
BasicOptionItemsTag.className = "BasicOptionItemsTag"
setmetatable(BasicOptionItemsTag, {__index = TableTag})

function BasicOptionItemsTag:_init_fields()
    self.propertiesHashMap = nil
end


function BasicOptionItemsTag.new()
    local self = setmetatable(TableTag.new(), BasicOptionItemsTag)
    self:_init_fields()
        self:setTagHelperFactory(BasicOptionItemsHelperFactory.new())
        self:setTagRequestHelperFactory(BasicOptionItemsRequestHelperFactory.new())
    return self
end

return BasicOptionItemsTag

