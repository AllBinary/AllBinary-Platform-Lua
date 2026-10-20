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
local StoreUriResolver = require("org.allbinary.data.tree.dom.StoreUriResolver")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local StoreTransformer = {}
StoreTransformer.__index = StoreTransformer
StoreTransformer.className = "StoreTransformer"
setmetatable(StoreTransformer, {__index = BasicTransformer})


function StoreTransformer.new(abeClientInformation, transformInfoInterface)
    local self = setmetatable(BasicTransformer.new(abeClientInformation, transformInfoInterface), StoreTransformer)
        -- super(...) made self above
        self:setURIResolver(StoreUriResolver.new(self:getTransformInfoInterface(), self:getURIResolver()))
    return self
end

return StoreTransformer

