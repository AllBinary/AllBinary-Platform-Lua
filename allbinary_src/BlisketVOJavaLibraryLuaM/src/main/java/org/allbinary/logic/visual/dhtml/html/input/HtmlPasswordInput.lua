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

local HtmlLengthInput = require("org.allbinary.logic.visual.dhtml.html.input.HtmlLengthInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlPasswordInput = {}
HtmlPasswordInput.__index = HtmlPasswordInput
HtmlPasswordInput.className = "HtmlPasswordInput"
setmetatable(HtmlPasswordInput, {__index = HtmlLengthInput})


function HtmlPasswordInput.new(before, name, value, after)
    local self = setmetatable(HtmlLengthInput.new(before, HtmlInputData.getInstance().PASSWORD, name, value, after), HtmlPasswordInput)
        -- super(...) made self above
        self:setSize(32)
        self:setMaxLength(128)
    return self
end

return HtmlPasswordInput

