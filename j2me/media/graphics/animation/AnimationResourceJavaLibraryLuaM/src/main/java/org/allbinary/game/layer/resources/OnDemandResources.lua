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
-- package org.allbinary.game.layer.resources

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OnDemandResources = {}
OnDemandResources.__index = OnDemandResources
OnDemandResources.className = "OnDemandResources"

function OnDemandResources:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OnDemandResources.new()
    local self = setmetatable({}, OnDemandResources)
    self:_init_fields()
    return self
end


-- throws Exception
function OnDemandResources:waitFor()
end


-- throws Exception
function OnDemandResources:init()
end


-- throws Exception
function OnDemandResources:initAt(imageCache, resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index)
        return 0
end

OnDemandResources.NULL_ON_DEMAND_RESOURCES = OnDemandResources.new()

return OnDemandResources

