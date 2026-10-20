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
-- package org.allbinary.data.tables.transform.info

local TransformInfoHttpStoreFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreFactory")
local TransformInfoObjectConfigAndManipulatorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory")
local TransformInfoObjectConfigGeneratorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoEntityBuilder = {}
TransformInfoEntityBuilder.__index = TransformInfoEntityBuilder
TransformInfoEntityBuilder.className = "TransformInfoEntityBuilder"

function TransformInfoEntityBuilder.new()
    local self = setmetatable({}, TransformInfoEntityBuilder)
    return self
end


function TransformInfoEntityBuilder.getInstance()
        return TransformInfoEntityFactory.getInstance(TransformInfoObjectConfigGeneratorFactory.getInstance(), TransformInfoObjectConfigAndManipulatorFactory.getInstance(), TransformInfoHttpStoreFactory.getInstance())
end

return TransformInfoEntityBuilder

