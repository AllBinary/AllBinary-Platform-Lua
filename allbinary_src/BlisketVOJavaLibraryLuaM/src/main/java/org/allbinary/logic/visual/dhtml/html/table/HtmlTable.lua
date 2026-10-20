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
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlTable = {}
HtmlTable.__index = HtmlTable
HtmlTable.className = "HtmlTable"
setmetatable(HtmlTable, {__index = HtmlTag})

function HtmlTable:_init_fields()
    self.END = ">"
    self.START = "<table "
    self.ENDTAG = "</table>"
    self.CLASS = "class"
    self.DIRECTION = "dir"
    self.ID = "id"
    self.LANG = "lang"
    self.UNITS = "units"
    self.BORDER = "border"
    self.CELLPADDING = "cellpadding"
    self.CELLSPACING = "cellspacing"
    self.COLS = "cols"
    self.FLOAT = "float"
    self.FRAME = "frame"
    self.RULES = "rules"
    self.STYLE = "style"
    self.BORDERCOLLAPSE = "border-collapse: collapse"
    self.numberOfColumns = 0
    self.before = nil
    self.border = nil
    self.cellpadding = nil
    self.cellspacing = nil
    self.style = nil
    self.name = nil
    self.after = nil
    self.htmlRowsVector = nil
end


function HtmlTable.new(before, cellpadding, cellspacing, after)
    local self = setmetatable(HtmlTag.new(), HtmlTable)
    self:_init_fields()
        self.before = before
        self.cellpadding = cellpadding
        self.cellspacing = cellspacing
        self.after = after
        self.htmlRowsVector = BasicArrayListD.new()
        self:addAttribute(self.BORDER, CommonPhoneStrings.getInstance().ZERO)
        self:addAttribute(self.CELLPADDING, self.cellpadding)
        self:addAttribute(self.CELLSPACING, self.cellspacing)
        self:addAttribute(self.STYLE, self.BORDERCOLLAPSE)
    return self
end


function HtmlTable:addRow(htmlRow)
        if self.numberOfColumns < htmlRow:getNumberOfColumns() then
            self.numberOfColumns = htmlRow:getNumberOfColumns()
        end
        self.htmlRowsVector:add(htmlRow)
end


function HtmlTable:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        result = self.before
        result = result .. tostring(self.START)
        result = result .. tostring(" ")
        for i = 0, (attributeKeys.n or #attributeKeys) - 1 do
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
        local size = self.htmlRowsVector:size()
        for i = 0, size - 1 do
            result = result .. tostring(tostring(self.htmlRowsVector:get(i)))
            result = result .. tostring(" ")
        end
        result = result .. tostring(self.ENDTAG)
        result = result .. tostring(self.after)
        return result
end
HtmlTable.__tostring = function(self) return self:toString() end

return HtmlTable

