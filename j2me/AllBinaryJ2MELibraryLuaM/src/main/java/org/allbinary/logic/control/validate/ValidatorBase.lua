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
-- package org.allbinary.logic.control.validate

local StdUtil = require("org.allbinary.logic.StdUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local ValidatorBaseInterface = require("org.allbinary.logic.control.validate.ValidatorBaseInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ValidatorBase = {}
ValidatorBase.__index = ValidatorBase
ValidatorBase.className = "ValidatorBase"


function ValidatorBase.getInstance()
        return ValidatorBase.instance
end


function ValidatorBase.new()
    local self = setmetatable({}, ValidatorBase)
    return self
end


function ValidatorBase:isValid()
        return BooleanFactory.getInstance().TRUE
end


function ValidatorBase:validationInfo()
        return StringUtil.getInstance().EMPTY_STRING
end


function ValidatorBase:toHashtable()
        return StdUtil.getInstance().NULL_TABLE
end


function ValidatorBase:toList()
        return BasicArrayListUtil.getInstance():getImmutableInstance()
end

ValidatorBase.instance = ValidatorBase.new()

return ValidatorBase

