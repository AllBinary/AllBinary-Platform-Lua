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
-- package tags.generic

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local TransformTag = require("tags.TransformTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericViewTag = {}
GenericViewTag.__index = GenericViewTag
GenericViewTag.className = "GenericViewTag"
setmetatable(GenericViewTag, {__index = TransformTag})

function GenericViewTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.output = nil
    self.file = nil
end


function GenericViewTag.new()
    local self = setmetatable(TransformTag.new(), GenericViewTag)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function GenericViewTag:setOutput(value)
        self.output = value
        self:getPropertiesHashMap():put(InputOutputTypeData.getInstance().NAME, self.output)
end


function GenericViewTag:setFile(value)
        self.file = value
        self:getPropertiesHashMap():put(InputOutputTypeData.getInstance().FILE, self.file)
end

return GenericViewTag

