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
-- package org.allbinary.logic.visual.dhtml.html.table

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HtmlTag = require("org.allbinary.logic.visual.dhtml.html.HtmlTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlCell = {}
HtmlCell.__index = HtmlCell
HtmlCell.className = "HtmlCell"
setmetatable(HtmlCell, {__index = HtmlTag})

function HtmlCell:_init_fields()
    self.END = ">"
    self.START = "<td "
    self.ENDTAG = "</td>"
    self.HEIGHT = "height"
    self.WIDTH = "width"
    self.height = nil
    self.width = nil
    self.before = nil
    self.body = nil
    self.after = nil
end


function HtmlCell.new(before, width, height, after)
    local self = setmetatable(HtmlTag.new(), HtmlCell)
    self:_init_fields()
        self.before = tostring(before)
        self.after = tostring(after)
        self.height = tostring(height)
        self.width = tostring(width)
        self:addAttribute(self.HEIGHT, self.height)
        self:addAttribute(self.WIDTH, self.width)
    return self
end


function HtmlCell:addText(body)
        self.body = body
end


function HtmlCell:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        local attributeSize = (attributeKeys.n or #attributeKeys)
        result = self.before
        result = result .. tostring(self.START)
        result = result .. tostring(" ")
        for i = 0, attributeSize - 1 do
            local key = attributeKeys[i + 1]
            local value = self.otherAttributes:get(key)
            if value ~= nil and ((value < stringUtil.EMPTY_STRING and -1) or (value > stringUtil.EMPTY_STRING and 1) or 0) ~= 0 then
                result = result .. tostring(key)
                result = result .. tostring("=\"")
                result = result .. tostring(value)
                result = result .. tostring("\" ")
            end
        end
        result = result .. tostring(self.END)
        result = result .. tostring(self.body)
        result = result .. tostring(self.ENDTAG)
        result = result .. tostring(self.after)
        return result
end
HtmlCell.__tostring = function(self) return self:toString() end

return HtmlCell

