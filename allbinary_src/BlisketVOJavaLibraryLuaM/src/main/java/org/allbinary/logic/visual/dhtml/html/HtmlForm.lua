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
-- package org.allbinary.logic.visual.dhtml.html

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HtmlInput = require("org.allbinary.logic.visual.dhtml.html.input.HtmlInput")
local HtmlTable = require("org.allbinary.logic.visual.dhtml.html.table.HtmlTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlForm = {}
HtmlForm.__index = HtmlForm
HtmlForm.className = "HtmlForm"

function HtmlForm:_init_fields()
    self.FORMBEGIN = "<form "
    self.END = ">"
    self.FORMEND = "</form>"
    self.ACTION = "ACTION=\""
    self.GET = "GET\""
    self.POST = "POST\""
    self.METHODS = {self.GET, self.POST}
    self.METHOD = "METHOD=\""
    self.method = nil
    self.action = nil
    self.inputs = nil
end


function HtmlForm.new(action)
    local self = setmetatable({}, HtmlForm)
    self:_init_fields()
        self.action = action
        self.inputs = BasicArrayListD.new()
    return self
end


function HtmlForm:setPost()
        self.method = self.POST
end


function HtmlForm:setGet()
        self.method = self.GET
end


function HtmlForm:addInput(htmlInput)
        self.inputs:add(htmlInput)
end


function HtmlForm:addTable(htmlTable)
        self.inputs:add(htmlTable)
end


function HtmlForm:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local inputArray = self.inputs:toArray()
        local inputSize = (inputArray.n or #inputArray)
        result = self.FORMBEGIN
        result = result .. tostring(self.METHOD)
        result = result .. tostring(self.method)
        result = result .. tostring("\" ")
        result = result .. tostring(self.ACTION)
        result = result .. tostring(self.action)
        result = result .. tostring("\" ")
        result = result .. tostring(self.END)
        for i = 0, inputSize - 1 do
            result = result .. tostring(tostring(inputArray[i + 1]))
            result = result .. tostring(" ")
        end
        result = result .. tostring(self.FORMEND)
        return result
end
HtmlForm.__tostring = function(self) return self:toString() end

return HtmlForm

