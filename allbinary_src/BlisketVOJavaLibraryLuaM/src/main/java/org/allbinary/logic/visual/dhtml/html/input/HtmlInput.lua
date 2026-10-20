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
-- package org.allbinary.logic.visual.dhtml.html.input

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

local HtmlInput = {}
HtmlInput.__index = HtmlInput
HtmlInput.className = "HtmlInput"
setmetatable(HtmlInput, {__index = HtmlTag})

function HtmlInput:_init_fields()
    self.END = ">"
    self.STARTINPUT = "<INPUT "
    self.ENDINPUT = "</INPUT>"
    self.TYPE = "TYPE=\""
    self.NAME = "NAME=\""
    self.before = nil
    self.type = nil
    self.name = nil
    self.after = nil
end


function HtmlInput.new(before, type, name, after)
    local self = setmetatable(HtmlTag.new(), HtmlInput)
    self:_init_fields()
        self.before = before
        self.type = type
        self.name = name
        self.after = after
    return self
end


function HtmlInput:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        local attributeSize = (attributeKeys.n or #attributeKeys)
        result = self.before
        result = result .. tostring(self.STARTINPUT)
        result = result .. tostring(self.TYPE)
        result = result .. tostring(self.type)
        result = result .. tostring("\" ")
        result = result .. tostring(self.NAME)
        result = result .. tostring(self.name)
        result = result .. tostring("\" ")
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
        result = result .. tostring(self.ENDINPUT)
        result = result .. tostring(self.after)
        return result
end
HtmlInput.__tostring = function(self) return self:toString() end

return HtmlInput

