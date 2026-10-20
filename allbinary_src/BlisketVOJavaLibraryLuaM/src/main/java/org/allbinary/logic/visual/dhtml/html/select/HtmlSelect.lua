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
-- package org.allbinary.logic.visual.dhtml.html.select

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LineReader = require("org.allbinary.logic.io.LineReader")
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

local HtmlSelect = {}
HtmlSelect.__index = HtmlSelect
HtmlSelect.className = "HtmlSelect"
setmetatable(HtmlSelect, {__index = HtmlTag})

function HtmlSelect:_init_fields()
    self.END = ">"
    self.STARTSELECT = "<SELECT "
    self.ENDSELECT = "</SELECT>"
    self.SIZE = "SIZE=\""
    self.NAME = "NAME=\""
    self.STARTOPTION = "<OPTION"
    self.SELETED = "SELECTED"
    self.ENDOPTION = "</OPTION>"
    self.before = nil
    self.name = nil
    self.after = nil
    self.size = nil
    self.selected = nil
    self.options = nil
    self.multiple = "multiple"
    self.isMultipleSelect = false
end


function HtmlSelect.new(before, size, name, after)
    local self = setmetatable(HtmlTag.new(), HtmlSelect)
    self:_init_fields()
        self.before = before
        self.size = size
        self.name = name
        self.after = after
        self.options = BasicArrayListD.new()
    return self
end


function HtmlSelect:addOption(key)
        self.options:add(key)
end


function HtmlSelect:addOptions(fileName)
        local try_ok, try_error = pcall(function()
            local lineReader = LineReader.new(fileName)
            while lineReader:hasNext() do
                local option = lineReader:next()
                self:addOption(option)
            end
        end)
        if not try_ok then
            local e = try_error
            self:addOption("Error")
        end
end


function HtmlSelect:setSelected(selected)
        self.selected = selected
end


function HtmlSelect:isMultiple()
        return self.isMultipleSelect
end


function HtmlSelect:setMultiple(value)
        self.isMultipleSelect = value
end


function HtmlSelect:getOptions()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local optionsArray = self.options:toArray()
        local optionsSize = (optionsArray.n or #optionsArray)
        for i = 0, optionsSize - 1 do
            local value = optionsArray[i + 1]
            if value ~= nil and value:compareTo(stringUtil.EMPTY_STRING) ~= 0 then
                result = result .. tostring(self.STARTOPTION)
                result = result .. tostring(self.END)
                result = result .. tostring(value)
                result = result .. tostring(self.ENDOPTION)
            end
        end
        return result
end


function HtmlSelect:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        local attributeSize = (attributeKeys.n or #attributeKeys)
        result = self.before
        result = result .. tostring(self.STARTSELECT)
        result = result .. tostring(self.NAME)
        result = result .. tostring(self.name)
        result = result .. tostring("\" ")
        result = result .. tostring(self.SIZE)
        result = result .. tostring(self.size)
        result = result .. tostring("\" ")
        for i = 0, attributeSize - 1 do
            local key = attributeKeys[i + 1]
            local value = self.otherAttributes:get(key)
            if value ~= nil and value:compareTo(stringUtil.EMPTY_STRING) ~= 0 then
                result = result .. tostring(key)
                result = result .. tostring("=\"")
                result = result .. tostring(value)
                result = result .. tostring("\" ")
            end
        end
        if self:isMultiple() then
            result = result .. tostring(" " .. self.multiple .. " ")
        end
        result = result .. tostring(self.END)
        result = result .. tostring(self:getOptions())
        result = result .. tostring(self.ENDSELECT)
        result = result .. tostring(self.after)
        return result
end
HtmlSelect.__tostring = function(self) return self:toString() end

return HtmlSelect

