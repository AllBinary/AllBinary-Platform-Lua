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
-- package org.allbinary.logic.math

local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MathData = {}
MathData.__index = MathData
MathData.className = "MathData"

function MathData:_init_fields()
    self.EQUALS = nil
    self.PLUS = "+"
    self.GREATER_THAN = ">"
    self.MINUS = nil
    self.DIVIDE = nil
    self.MULTIPLY = nil
end


function MathData.getInstance()
        return MathData.instance
end


function MathData.new()
    local self = setmetatable({}, MathData)
    self:_init_fields()
        local commonSeps = CommonSeps.getInstance()
        self.EQUALS = commonSeps.EQUALS
        self.MINUS = commonSeps.DASH
        self.DIVIDE = commonSeps.FORWARD_SLASH
        self.MULTIPLY = CommonPhoneStrings.getInstance().STAR
    return self
end

MathData.instance = MathData.new()

return MathData

