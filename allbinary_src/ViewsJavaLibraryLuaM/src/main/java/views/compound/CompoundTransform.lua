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
-- package views.compound

-- local InputStream = require("java.io.InputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
local BasicUriResolver = require("org.allbinary.data.tree.dom.BasicUriResolver")
local StoreUriResolver = require("org.allbinary.data.tree.dom.StoreUriResolver")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local AbTransformer = require("org.allbinary.logic.visual.transform.AbTransformer")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CompoundContextTransformInfoObjectConfig = require("views.compound.objectConfig.CompoundContextTransformInfoObjectConfig")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompoundTransform = {}
CompoundTransform.__index = CompoundTransform
CompoundTransform.className = "CompoundTransform"
setmetatable(CompoundTransform, {__index = AbTransformer})

function CompoundTransform:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
end


function CompoundTransform.new(transformInfoInterface)
    local self = setmetatable(AbTransformer.new(transformInfoInterface), CompoundTransform)
    self:_init_fields()
        -- super(...) made self above
        self:setURIResolver(StoreUriResolver.new(self:getTransformInfoInterface(), self:getURIResolver()))
        local objectConfig = CompoundContextTransformInfoObjectConfig.new(self.abeClientInformation, self:getTransformInfoInterface(), self:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("\nObjectConfig: \n" .. tostring(objectConfig), self, self.commonStrings.CONSTRUCTOR)
        end
        local templateInputStream = objectConfig:createInputStream()
        self:setInputStream(templateInputStream)
    return self
end

return CompoundTransform

