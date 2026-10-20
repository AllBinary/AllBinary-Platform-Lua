-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package tags


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TagStrings = {}
TagStrings.__index = TagStrings
TagStrings.className = "TagStrings"

function TagStrings:_init_fields()
    self.DO_START_TAG = "doStartTag"
end

function TagStrings.new()
    local self = setmetatable({}, TagStrings)
    self:_init_fields()
    return self
end


function TagStrings.getInstance()
        return TagStrings.instance
end

TagStrings.instance = TagStrings.new()

return TagStrings

