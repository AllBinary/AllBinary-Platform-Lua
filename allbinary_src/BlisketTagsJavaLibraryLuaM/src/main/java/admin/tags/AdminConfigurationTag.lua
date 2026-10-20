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

local AdminConfigurationHelperFactory = require("admin.taghelpers.AdminConfigurationHelperFactory")
local AdminConfigurationRequestHelperFactory = require("admin.taghelpers.AdminConfigurationRequestHelperFactory")
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

local AdminConfigurationTag = {}
AdminConfigurationTag.__index = AdminConfigurationTag
AdminConfigurationTag.className = "AdminConfigurationTag"
setmetatable(AdminConfigurationTag, {__index = TableTag})


function AdminConfigurationTag.new()
    local self = setmetatable(TableTag.new(), AdminConfigurationTag)
        self:setTagHelperFactory(AdminConfigurationHelperFactory.new())
        self:setTagRequestHelperFactory(AdminConfigurationRequestHelperFactory.new())
    return self
end

return AdminConfigurationTag

