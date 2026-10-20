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
local HtmlInput = require("org.allbinary.logic.visual.dhtml.html.input.HtmlInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlValueInput = {}
HtmlValueInput.__index = HtmlValueInput
HtmlValueInput.className = "HtmlValueInput"
setmetatable(HtmlValueInput, {__index = HtmlInput})

function HtmlValueInput:_init_fields()
    self.value = nil
    self.VALUE = "VALUE"
end


function HtmlValueInput.new(before, type, name, value, after)
    local self = setmetatable(HtmlInput.new(before, type, name, after), HtmlValueInput)
    self:_init_fields()
        -- super(...) made self above
        local stringUtil = StringUtil.getInstance()
        self.value = stringUtil.EMPTY_STRING
        self:addAttribute(self.VALUE, value)
    return self
end

return HtmlValueInput

