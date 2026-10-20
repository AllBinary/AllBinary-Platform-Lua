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
-- package tags.transform.info

local TableTag = require("admin.tags.TableTag")
local TransformInfoHelperFactory = require("taghelpers.transform.info.TransformInfoHelperFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoTableTag = {}
TransformInfoTableTag.__index = TransformInfoTableTag
TransformInfoTableTag.className = "TransformInfoTableTag"
setmetatable(TransformInfoTableTag, {__index = TableTag})


function TransformInfoTableTag.new()
    local self = setmetatable(TableTag.new(), TransformInfoTableTag)
        self:setTagHelperFactory(TransformInfoHelperFactory.new())
    return self
end

return TransformInfoTableTag

