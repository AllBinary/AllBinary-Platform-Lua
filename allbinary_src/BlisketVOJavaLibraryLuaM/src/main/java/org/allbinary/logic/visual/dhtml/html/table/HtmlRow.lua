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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
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

local HtmlRow = {}
HtmlRow.__index = HtmlRow
HtmlRow.className = "HtmlRow"
setmetatable(HtmlRow, {__index = HtmlTag})

function HtmlRow:_init_fields()
    self.END = ">"
    self.START = "<tr "
    self.ENDTAG = "</tr>"
    self.numberOfColumns = 0
    self.before = nil
    self.after = nil
    self.htmlCellsVector = nil
end


function HtmlRow.new(before, after)
    local self = setmetatable(HtmlTag.new(), HtmlRow)
    self:_init_fields()
        self.before = tostring(before)
        self.after = tostring(after)
        self.htmlCellsVector = BasicArrayListD.new()
    return self
end


function HtmlRow:addCell(htmlCell)
        self.htmlCellsVector:add(htmlCell)
        self.numberOfColumns = self.numberOfColumns + 1
end


function HtmlRow:getNumberOfColumns()
        return self.numberOfColumns
end


function HtmlRow:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        local attributeSize = (attributeKeys.n or #attributeKeys)
        local cellSize = self.htmlCellsVector:size()
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
        for i = 0, cellSize - 1 do
            result = result .. tostring(tostring(self.htmlCellsVector:get(i)))
            result = result .. tostring(" ")
        end
        result = result .. tostring(self.ENDTAG)
        result = result .. tostring(self.after)
        return result
end
HtmlRow.__tostring = function(self) return self:toString() end

return HtmlRow

