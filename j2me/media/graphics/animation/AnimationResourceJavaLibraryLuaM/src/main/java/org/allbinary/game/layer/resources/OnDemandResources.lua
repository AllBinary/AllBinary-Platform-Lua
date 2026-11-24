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

local OnDemandResources = {}
package.loaded["org.allbinary.game.layer.resources.OnDemandResources"] = OnDemandResources

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table OnDemandResources is declared before the requires
OnDemandResources.__index = OnDemandResources
OnDemandResources.className = "OnDemandResources"
OnDemandResources.javaClassName = "org.allbinary.game.layer.resources.OnDemandResources"

function OnDemandResources:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OnDemandResources._jinit(self)
    OnDemandResources._init_fields(self)
    return self
end

function OnDemandResources.new(...)
    local self = setmetatable({}, OnDemandResources)
    OnDemandResources._jinit(self, ...)
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

