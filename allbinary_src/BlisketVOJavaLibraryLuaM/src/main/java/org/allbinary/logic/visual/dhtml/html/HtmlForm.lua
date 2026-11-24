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

local HtmlForm = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.HtmlForm"] = HtmlForm

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local HtmlInput = java_lazy("org.allbinary.logic.visual.dhtml.html.input.HtmlInput")
local HtmlTable = java_lazy("org.allbinary.logic.visual.dhtml.html.table.HtmlTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table HtmlForm is declared before the requires
HtmlForm.__index = HtmlForm
HtmlForm.className = "HtmlForm"
HtmlForm.javaClassName = "org.allbinary.logic.visual.dhtml.html.HtmlForm"

function HtmlForm:_init_fields()
    self.FORMBEGIN = "<form "
    self.END = ">"
    self.FORMEND = "</form>"
    self.ACTION = "ACTION=\""
    self.GET = "GET\""
    self.POST = "POST\""
    self.METHODS = {self.GET, self.POST}
    self.METHOD = "METHOD=\""
    if self.method_f == nil then self.method_f = nil end
    if self.action == nil then self.action = nil end
    if self.inputs == nil then self.inputs = nil end
end


function HtmlForm._jinit(self, action)
    HtmlForm._init_fields(self)
        self.action = action
        self.inputs = BasicArrayListD.new()
    return self
end

function HtmlForm.new(...)
    local self = setmetatable({}, HtmlForm)
    HtmlForm._jinit(self, ...)
    return self
end


function HtmlForm:setPost()
        self.method_f = self.POST
end


function HtmlForm:setGet()
        self.method_f = self.GET
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
        result = result .. tostring(self.method_f)
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

