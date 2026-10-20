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
-- package org.allbinary.logic.io.path

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFilePath = {}
AbFilePath.__index = AbFilePath
AbFilePath.className = "AbFilePath"
setmetatable(AbFilePath, {__index = AbPath})


function AbFilePath.new(aPath)
    local self = setmetatable(AbPath.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING), AbFilePath)
        -- super(...) made self above
        local pathData = AbPathData.getInstance()
        local abPathUtil = PathUtil.getInstance()
        self.schema = self:getSchema(aPath)
        self:setName(pathData:getNameFromPath(aPath))
        self:setPath(abPathUtil:adjust(self:getPathFromPath(tostring(abPathUtil:removeNameFromPath(aPath)))))
    return self
end

return AbFilePath

