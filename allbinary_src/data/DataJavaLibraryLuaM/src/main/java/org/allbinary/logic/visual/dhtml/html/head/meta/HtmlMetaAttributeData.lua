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
-- package org.allbinary.logic.visual.dhtml.html.head.meta


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlMetaAttributeData = {}
HtmlMetaAttributeData.__index = HtmlMetaAttributeData
HtmlMetaAttributeData.className = "HtmlMetaAttributeData"

function HtmlMetaAttributeData:_init_fields()
    self.id = nil
    self.name = nil
end


function HtmlMetaAttributeData.new(id, value)
    local self = setmetatable({}, HtmlMetaAttributeData)
    self:_init_fields()
        self.name = value
        self.id = id
    return self
end


function HtmlMetaAttributeData:equals(htmlMetaAttributeData)
        if htmlMetaAttributeData.id == self.id then
            return true
        else
            return false
        end
end
HtmlMetaAttributeData.__eq = function(self, other) return self:equals(other) end


function HtmlMetaAttributeData:toString()
        return self.name
end
HtmlMetaAttributeData.__tostring = function(self) return self:toString() end

return HtmlMetaAttributeData

