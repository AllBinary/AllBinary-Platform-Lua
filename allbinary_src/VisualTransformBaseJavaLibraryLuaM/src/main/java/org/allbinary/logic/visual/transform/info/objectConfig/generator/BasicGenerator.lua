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
-- package org.allbinary.logic.visual.transform.info.objectConfig.generator

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoObjectConfigGenerator = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGenerator = {}
BasicGenerator.__index = BasicGenerator
BasicGenerator.className = "BasicGenerator"
setmetatable(BasicGenerator, {__index = TransformInfoObjectConfigGenerator})

function BasicGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function BasicGenerator.new()
    local self = setmetatable(TransformInfoObjectConfigGenerator.new(), BasicGenerator)
    self:_init_fields()
    return self
end


function BasicGenerator:process(input)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Processing", self, self.commonStrings.PROCESS)
        end
        return input
end

return BasicGenerator

