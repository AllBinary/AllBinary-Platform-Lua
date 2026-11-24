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
-- package org.allbinary.util

local CircularIndexUtil = {}
package.loaded["org.allbinary.util.CircularIndexUtil"] = CircularIndexUtil

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")

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

-- class table CircularIndexUtil is declared before the requires
CircularIndexUtil.__index = CircularIndexUtil
CircularIndexUtil.className = "CircularIndexUtil"
CircularIndexUtil.javaClassName = "org.allbinary.util.CircularIndexUtil"

function CircularIndexUtil:_init_fields()
    self.index = 0
    self.lastIndex = 0
    self.size_f = 0
end


function CircularIndexUtil._jinit(self, index, size)
    CircularIndexUtil._init_fields(self)
        self:setSize(size)
        self:setIndex(index)
    return self
end

function CircularIndexUtil.new(...)
    local self = setmetatable({}, CircularIndexUtil)
    CircularIndexUtil._jinit(self, ...)
    return self
end


function CircularIndexUtil:next()
        if self.index >= self.lastIndex then
            self.index = 0
        else
            self.index = self.index + 1
        end
        return self.index
end


function CircularIndexUtil:previous()
        if self.index < 1 then
            self.index = self.lastIndex
        else
            self.index = self.index - 1
        end
        return self.index
end


function CircularIndexUtil:setIndex(index)
        if index > self.lastIndex then
            return
        end
        self.index = index
end


function CircularIndexUtil:getIndex()
        return self.index
end


function CircularIndexUtil.createInstance(max)
        return CircularIndexUtil.new(0, max)
end


function CircularIndexUtil.createInstanceAt(index, max)
        return CircularIndexUtil.new(index, max)
end


function CircularIndexUtil:setSize(size)
        self.size_f = size
        self.lastIndex = size - 1
        self.index = 0
end


function CircularIndexUtil:getSize()
        return self.size_f
end


function CircularIndexUtil:toString()
        return tostring(StringMaker.new():append(CommonLabels.getInstance().INDEX_LABEL):appendint(self.index):append("lastIndex: "):appendint(self.lastIndex):append("size: "):appendint(self.size_f))
end
CircularIndexUtil.__tostring = function(self) return self:toString() end

CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL = CircularIndexUtil.new(0, 0)

return CircularIndexUtil

