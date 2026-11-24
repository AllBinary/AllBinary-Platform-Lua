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
-- package org.allbinary.input.automation.module

local DefaultListModelHelper = {}
package.loaded["org.allbinary.input.automation.module.DefaultListModelHelper"] = DefaultListModelHelper

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
-- local DefaultListModel = require("javax.swing.DefaultListModel")
-- local ListModel = require("javax.swing.ListModel")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")

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

-- class table DefaultListModelHelper is declared before the requires
DefaultListModelHelper.__index = DefaultListModelHelper
DefaultListModelHelper.className = "DefaultListModelHelper"
DefaultListModelHelper.javaClassName = "org.allbinary.input.automation.module.DefaultListModelHelper"

function DefaultListModelHelper:_init_fields()
    if self.defaultListModel == nil then self.defaultListModel = nil end
    if self.vector == nil then self.vector = nil end
end


function DefaultListModelHelper._jinit(self)
    DefaultListModelHelper._init_fields(self)
        self.vector = BasicArrayListD.new()
        self.defaultListModel = DefaultListModel.new()
    return self
end

function DefaultListModelHelper.new(...)
    local self = setmetatable({}, DefaultListModelHelper)
    DefaultListModelHelper._jinit(self, ...)
    return self
end


function DefaultListModelHelper:initDefaultModelList()
        self.defaultListModel = DefaultListModel.new()
        local size = self.vector:size()
        for index = 0, size - 1 do
            local moduleName = self.vector:get(index)
            self.defaultListModel:addElement(moduleName)
        end
end


function DefaultListModelHelper:getListModel()
        return self.defaultListModel
end


function DefaultListModelHelper:add(string_)
        self.vector:add(string_)
end


function DefaultListModelHelper:remove(string_)
        self.vector:remove(string_)
end

return DefaultListModelHelper

