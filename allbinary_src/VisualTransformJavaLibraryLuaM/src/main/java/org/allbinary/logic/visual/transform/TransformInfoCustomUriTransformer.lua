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
-- package org.allbinary.logic.visual.transform

-- local URIResolver = require("javax.xml.transform.URIResolver")
local BasicUriResolver = require("org.allbinary.data.tree.dom.BasicUriResolver")
local CustomUriResolver = require("org.allbinary.data.tree.dom.CustomUriResolver")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigAndManipulatorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local BasicTransformer = require("org.allbinary.logic.visual.transform.BasicTransformer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoCustomUriTransformer = {}
TransformInfoCustomUriTransformer.__index = TransformInfoCustomUriTransformer
TransformInfoCustomUriTransformer.className = "TransformInfoCustomUriTransformer"
setmetatable(TransformInfoCustomUriTransformer, {__index = BasicTransformer})


function TransformInfoCustomUriTransformer.new(abeClientInformation, transformInfoInterface)
    local self = setmetatable(BasicTransformer.new(abeClientInformation, transformInfoInterface), TransformInfoCustomUriTransformer)
        -- super(...) made self above
        local transformInfoObjectConfigInterface = TransformInfoObjectConfigAndManipulatorFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
        self:setURIResolver(CustomUriResolver.new(transformInfoObjectConfigInterface:getImportUriPath(), self:getURIResolver()))
    return self
end

return TransformInfoCustomUriTransformer

