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
-- package org.allbinary.logic.communication.http

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TsUtil = require("org.allbinary.TsUtil")
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

local AcceptableResponseUtil = {}
AcceptableResponseUtil.__index = AcceptableResponseUtil
AcceptableResponseUtil.className = "AcceptableResponseUtil"

function AcceptableResponseUtil:_init_fields()
    self.candidateVector = BasicArrayListD.new()
    self.tagNameVector = BasicArrayListD.new()
end

function AcceptableResponseUtil.new()
    local self = setmetatable({}, AcceptableResponseUtil)
    self:_init_fields()
    return self
end


function AcceptableResponseUtil.getInstance()
        return AcceptableResponseUtil.instance
end


function AcceptableResponseUtil:get(index)
        return self.candidateVector:get(index)
end


function AcceptableResponseUtil:getTagName(index)
        return self.tagNameVector:get(index)
end


function AcceptableResponseUtil:size()
        return self.candidateVector:size()
end

AcceptableResponseUtil.instance = AcceptableResponseUtil.new()


do -- Java static initializer
        TsUtil.getInstance():hashCode(AcceptableResponseFactory.getInstance().HTML)
end

return AcceptableResponseUtil

