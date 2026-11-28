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

local HtmlSelect = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.select.HtmlSelect"] = HtmlSelect

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
local LineReader = java_lazy("org.allbinary.logic.io.LineReader")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local HtmlTag = require("org.allbinary.logic.visual.dhtml.html.HtmlTag")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

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

-- class table HtmlSelect is declared before the requires
HtmlSelect.__index = HtmlSelect
HtmlSelect.className = "HtmlSelect"
HtmlSelect.javaClassName = "org.allbinary.logic.visual.dhtml.html.select.HtmlSelect"
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
    if self.before == nil then self.before = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.after == nil then self.after = nil end
    if self.size_f == nil then self.size_f = nil end
    if self.selected == nil then self.selected = nil end
    if self.options == nil then self.options = nil end
    self.multiple = "multiple"
    self.isMultipleSelect = false
end


function HtmlSelect._jinit(self, before, size, name, after)
    java_super_init(HtmlTag, self)
    HtmlSelect._init_fields(self)
        self.before = before
        self.size_f = size
        self.name_f = name
        self.after = after
        self.options = BasicArrayListD.new()
    return self
end

function HtmlSelect.new(...)
    local self = setmetatable({}, HtmlSelect)
    HtmlSelect._jinit(self, ...)
    return self
end


function HtmlSelect:addOption(key)
        self.options:add(key)
end
java_overload(HtmlSelect, "addOption", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function HtmlSelect:addOptions(fileName)
        local try_ok, try_error, try_value = pcall(function()
            local lineReader = LineReader.new(fileName)
            while lineReader:hasNext() do
                local option = lineReader:next()
                self:addOption(option)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self:addOption("Error")
        end
end
java_overload(HtmlSelect, "addOptions", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function HtmlSelect:setSelected(selected)
        self.selected = selected
end
java_overload(HtmlSelect, "setSelected", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function HtmlSelect:isMultiple()
        return self.isMultipleSelect
end
java_overload(HtmlSelect, "isMultiple", 0)


function HtmlSelect:setMultiple(value)
        self.isMultipleSelect = value
end
java_overload(HtmlSelect, "setMultiple", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function HtmlSelect:getOptions()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local optionsArray = self.options:toArray()
        local optionsSize = (optionsArray.n or #optionsArray)
        for i = 0, optionsSize - 1 do
            local value = optionsArray[i + 1]
            if not rawequal(value, nil) and not rawequal(value:compareTo(stringUtil.EMPTY_STRING), 0) then
                result = result .. tostring(self.STARTOPTION)
                result = result .. tostring(self.END)
                result = result .. tostring(value)
                result = result .. tostring(self.ENDOPTION)
            end
        end
        return result
end
java_overload(HtmlSelect, "getOptions", 0)


function HtmlSelect:toString()
        local stringUtil = StringUtil.getInstance()
        local result = stringUtil.EMPTY_STRING
        local attributeKeys = self.otherAttributes:keySet():toArray()
        local attributeSize = (attributeKeys.n or #attributeKeys)
        result = self.before
        result = result .. tostring(self.STARTSELECT)
        result = result .. tostring(self.NAME)
        result = result .. tostring(self.name_f)
        result = result .. tostring("\" ")
        result = result .. tostring(self.SIZE)
        result = result .. tostring(self.size_f)
        result = result .. tostring("\" ")
        for i = 0, attributeSize - 1 do
            local key = attributeKeys[i + 1]
            local value = self.otherAttributes:get(key)
            if not rawequal(value, nil) and not rawequal(value:compareTo(stringUtil.EMPTY_STRING), 0) then
                result = result .. tostring(key)
                result = result .. tostring("=\"")
                result = result .. tostring(value)
                result = result .. tostring("\" ")
            end
        end
        if self:isMultiple() then
            result = result .. tostring(require("allbinary_java").to_string(require("allbinary_java").to_string(" ") .. require("allbinary_java").to_string(self.multiple)) .. require("allbinary_java").to_string(" "))
        end
        result = result .. tostring(self.END)
        result = result .. tostring(self:getOptions())
        result = result .. tostring(self.ENDSELECT)
        result = result .. tostring(self.after)
        return result
end
java_overload(HtmlSelect, "toString", 0)
HtmlSelect.__tostring = function(self) return self:toString() end

return HtmlSelect

