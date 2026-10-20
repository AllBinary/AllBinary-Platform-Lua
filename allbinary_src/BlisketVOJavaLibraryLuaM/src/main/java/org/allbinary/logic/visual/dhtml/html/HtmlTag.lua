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
-- package org.allbinary.logic.visual.dhtml.html

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlTag = {}
HtmlTag.__index = HtmlTag
HtmlTag.className = "HtmlTag"

function HtmlTag:_init_fields()
    self.otherAttributes = nil
end


function HtmlTag.new()
    local self = setmetatable({}, HtmlTag)
    self:_init_fields()
        self.otherAttributes = StdUtil.getInstance():createHashMap()
    return self
end


function HtmlTag:addAttribute(key, value)
        self.otherAttributes:put(key, value)
end

return HtmlTag

