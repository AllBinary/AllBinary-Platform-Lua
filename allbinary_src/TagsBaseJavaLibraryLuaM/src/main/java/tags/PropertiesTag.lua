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
-- package tags

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommandTag = require("tags.CommandTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PropertiesTag = {}
PropertiesTag.__index = PropertiesTag
PropertiesTag.className = "PropertiesTag"
setmetatable(PropertiesTag, {__index = CommandTag})

function PropertiesTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.propertiesHashMap = nil
end


function PropertiesTag.new()
    local self = setmetatable(CommandTag.new(), PropertiesTag)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
        self.propertiesHashMap = StdUtil.getInstance():createHashMap()
    return self
end


function PropertiesTag:getPropertiesHashMap()
        return self.propertiesHashMap
end


function PropertiesTag:doEndTag()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF("Tag Ended", self, "doEndTag")
        end
        self.propertiesHashMap = StdUtil.getInstance():createHashMap()
        return self.EVAL_PAGE
end

return PropertiesTag

