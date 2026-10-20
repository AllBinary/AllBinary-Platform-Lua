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

local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PropertiesTag = require("tags.PropertiesTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HelperTag = {}
HelperTag.__index = HelperTag
HelperTag.className = "HelperTag"
setmetatable(HelperTag, {__index = PropertiesTag})

function HelperTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tagHelperFactoryInterface = nil
    self.anyType = nil
end


function HelperTag.new(tagHelperFactoryInterface)
    local self = setmetatable(PropertiesTag.new(), HelperTag)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
        self.tagHelperFactoryInterface = tagHelperFactoryInterface
    return self
end


-- throws Exception
function HelperTag:setHelper()
        if self.anyType == nil then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("Creating TagHelper with: \n" .. tostring(self:getPropertiesHashMap()), self, "doStartTag")
            end
            self.anyType = self.tagHelperFactoryInterface:getInstance(self:getPropertiesHashMap(), self.pageContext)
        end
end


function HelperTag:getHelper()
        return self.anyType
end


function HelperTag:doEndTag()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF("Tag Ended", self, "doEndTag")
        end
        self.anyType = nil
        return PropertiesTag.doEndTag(self)
end

return HelperTag

