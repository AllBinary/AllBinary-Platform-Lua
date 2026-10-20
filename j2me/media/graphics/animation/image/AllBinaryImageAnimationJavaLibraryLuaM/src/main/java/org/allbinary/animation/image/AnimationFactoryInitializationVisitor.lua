-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.image

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local AnimationFactoryInitializationVisitor = {}
AnimationFactoryInitializationVisitor.__index = AnimationFactoryInitializationVisitor
AnimationFactoryInitializationVisitor.className = "AnimationFactoryInitializationVisitor"

function AnimationFactoryInitializationVisitor:_init_fields()
    self.width = 0
    self.height = 0
    self.dx = 0
    self.dy = 0
    self.originalDx = 0
    self.originalDy = 0
end

function AnimationFactoryInitializationVisitor.new()
    local self = setmetatable({}, AnimationFactoryInitializationVisitor)
    self:_init_fields()
    return self
end


function AnimationFactoryInitializationVisitor:visit()
end


function AnimationFactoryInitializationVisitor:toString()
        local commonSeps = CommonSeps.getInstance()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PositionStrings.getInstance().DX_LABEL):appendfloat((self.dx + 0.0))
        stringBuffer:append(PositionStrings.getInstance().DY_LABEL):appendfloat((self.dy + 0.0))
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self.width)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self.height)
        return tostring(stringBuffer)
end
AnimationFactoryInitializationVisitor.__tostring = function(self) return self:toString() end

return AnimationFactoryInitializationVisitor

