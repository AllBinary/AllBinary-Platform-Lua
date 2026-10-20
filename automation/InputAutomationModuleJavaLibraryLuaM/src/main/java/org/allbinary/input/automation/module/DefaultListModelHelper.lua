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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local swing = require("javax.swing")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DefaultListModelHelper = {}
DefaultListModelHelper.__index = DefaultListModelHelper
DefaultListModelHelper.className = "DefaultListModelHelper"

function DefaultListModelHelper:_init_fields()
    self.defaultListModel = nil
    self.vector = nil
end


function DefaultListModelHelper.new()
    local self = setmetatable({}, DefaultListModelHelper)
    self:_init_fields()
        self.vector = BasicArrayListD.new()
        self.defaultListModel = DefaultListModel.new()
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


function DefaultListModelHelper:add(string)
        self.vector:add(string)
end


function DefaultListModelHelper:remove(string)
        self.vector:remove(string)
end

return DefaultListModelHelper

