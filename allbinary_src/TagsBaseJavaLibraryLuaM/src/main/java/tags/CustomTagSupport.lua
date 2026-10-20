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

-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTagSupport = {}
CustomTagSupport.__index = CustomTagSupport
CustomTagSupport.className = "CustomTagSupport"
setmetatable(CustomTagSupport, {__index = TagSupport})

function CustomTagSupport:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.tagStrings = TagStrings.getInstance()
end

function CustomTagSupport.new()
    local self = setmetatable(TagSupport.new(), CustomTagSupport)
    self:_init_fields()
    return self
end

return CustomTagSupport

