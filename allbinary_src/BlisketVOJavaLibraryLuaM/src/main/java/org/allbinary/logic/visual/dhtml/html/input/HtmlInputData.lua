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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlInputData = {}
HtmlInputData.__index = HtmlInputData
HtmlInputData.className = "HtmlInputData"

function HtmlInputData:_init_fields()
    self.TEXT = "text"
    self.RADIO = "radio"
    self.CHECKBOX = "checkbox"
    self.HIDDEN = "hidden"
    self.IMAGE = "image"
    self.PASSWORD = "password"
    self.RESET = "reset"
    self.SUBMIT = "submit"
    self.TYPES = {self.TEXT, self.RADIO, self.CHECKBOX, self.HIDDEN, self.IMAGE, self.PASSWORD, self.RADIO, self.RESET, self.SUBMIT}
end

function HtmlInputData.new()
    local self = setmetatable({}, HtmlInputData)
    self:_init_fields()
    return self
end


function HtmlInputData.getInstance()
        return HtmlInputData.instance
end

HtmlInputData.instance = HtmlInputData.new()

return HtmlInputData

