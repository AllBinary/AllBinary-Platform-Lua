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

local HtmlValueInput = require("org.allbinary.logic.visual.dhtml.html.input.HtmlValueInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlLengthInput = {}
HtmlLengthInput.__index = HtmlLengthInput
HtmlLengthInput.className = "HtmlLengthInput"
setmetatable(HtmlLengthInput, {__index = HtmlValueInput})

function HtmlLengthInput:_init_fields()
    self.MAXLENGTH = "MAXLENGTH"
    self.SIZE = "SIZE"
    self.length = nil
    self.size = nil
end


function HtmlLengthInput.new(before, type, name, value, after)
    local self = setmetatable(HtmlValueInput.new(before, type, name, value, after), HtmlLengthInput)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function HtmlLengthInput:setMaxLength(length)
        (self.n or #self) = tostring(length)
        self:addAttribute(self.MAXLENGTH, (self.n or #self))
end


function HtmlLengthInput:setSize(size)
        self.size = tostring(size)
        self:addAttribute(self.MAXLENGTH, self.size)
end

return HtmlLengthInput

