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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local GenericStoreTransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OverrideStoreTransformInfoObjectConfig = {}
OverrideStoreTransformInfoObjectConfig.__index = OverrideStoreTransformInfoObjectConfig
OverrideStoreTransformInfoObjectConfig.className = "OverrideStoreTransformInfoObjectConfig"
setmetatable(OverrideStoreTransformInfoObjectConfig, {__index = GenericStoreTransformInfoObjectConfig})

function OverrideStoreTransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 2 then return OverrideStoreTransformInfoObjectConfig._new2(...)
    elseif count == 3 then return OverrideStoreTransformInfoObjectConfig._new3(...)
    elseif count == 4 then return OverrideStoreTransformInfoObjectConfig._new4(...)
    end
end


function OverrideStoreTransformInfoObjectConfig._new2(abeClientInformation, transformInfoInterface)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface), OverrideStoreTransformInfoObjectConfig)
        -- super(...) made self above
    return self
end


function OverrideStoreTransformInfoObjectConfig._new3(abeClientInformation, transformInfoInterface, document)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, document), OverrideStoreTransformInfoObjectConfig)
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function OverrideStoreTransformInfoObjectConfig._new4(abeClientInformation, transformInfoInterface, name, type)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, name, type), OverrideStoreTransformInfoObjectConfig)
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function OverrideStoreTransformInfoObjectConfig:generate(objectConfigDocument)
        local newObjectConfigDocument = GenericStoreTransformInfoObjectConfig.generate(self, objectConfigDocument)
        return newObjectConfigDocument
end

return OverrideStoreTransformInfoObjectConfig

