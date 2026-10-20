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
-- package org.allbinary.input.automation.module.generic.configuration.profile

-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local InputImageType = require("org.allbinary.input.media.image.InputImageType")
local StdUtil = require("org.allbinary.logic.StdUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local GenericProfileDataWorkerTypeInterface = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerTypeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericProfileDataWorkerType = {}
GenericProfileDataWorkerType.__index = GenericProfileDataWorkerType
GenericProfileDataWorkerType.className = "GenericProfileDataWorkerType"

function GenericProfileDataWorkerType:_init_fields()
    self.name = nil
end


function GenericProfileDataWorkerType.new(name)
    local self = setmetatable({}, GenericProfileDataWorkerType)
    self:_init_fields()
        self:setName(name)
        GenericProfileDataWorkerType.hashMap:put(self:getName(), self)
    return self
end


function GenericProfileDataWorkerType:getName()
        return self.name
end


function GenericProfileDataWorkerType:setName(name)
        self.name = name
end


-- throws Exception
function GenericProfileDataWorkerType:toXmlNode(document)
        local node = ModDomHelper.createTextNode(document, GenericProfileDataWorkerData.NAME, self.name)
        return node
end


function GenericProfileDataWorkerType:toString()
        return "GenericProfileDataWorkerType: " .. self:getName()
end
GenericProfileDataWorkerType.__tostring = function(self) return self:toString() end


function GenericProfileDataWorkerType.getInstance(node)
        local name = DomNodeHelper.getTextNodeValue(node)
        return GenericProfileDataWorkerType.hashMap:get(name)
end

GenericProfileDataWorkerType.hashMap = StdUtil.getInstance():createHashMap()
GenericProfileDataWorkerType.SAVED_CAPTURE = SavedCaptureGenericProfileDataWorkerType.SAVED_CAPTURE
GenericProfileDataWorkerType.SCREEN_CAPTURE = GenericProfileDataWorkerType.new("Screen " .. InputImageType.CAPTURE:getName())
GenericProfileDataWorkerType.COMPARISON = GenericProfileDataWorkerType.new(InputImageType.COMPARISON:getName())
GenericProfileDataWorkerType.MOTION = GenericProfileDataWorkerType.new(InputImageType.MOTION:getName())

return GenericProfileDataWorkerType

