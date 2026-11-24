-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.layer

local SpriteFactory = {}
package.loaded["org.allbinary.game.layer.SpriteFactory"] = SpriteFactory

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

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SpriteFactoryInterface = require("org.allbinary.game.layer.SpriteFactoryInterface")

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

-- class table SpriteFactory is declared before the requires
SpriteFactory.__index = SpriteFactory
SpriteFactory.className = "SpriteFactory"
SpriteFactory.javaClassName = "org.allbinary.game.layer.SpriteFactory"
SpriteFactory.java_implements = " SpriteFactoryInterface "
SpriteFactory.java_interfaces = function() return {SpriteFactoryInterface} end

function SpriteFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function SpriteFactory._jinit(self)
    SpriteFactory._init_fields(self)
    return self
end

function SpriteFactory.new()
    return SpriteFactory._jinit(setmetatable({}, SpriteFactory))
end


function SpriteFactory.getInstance()
        return SpriteFactory.instance_f
end


function SpriteFactory:createSprite(image, frameWidth, frameHeight)
        return Sprite.new(image, frameWidth, frameHeight)
end

SpriteFactory.instance_f = SpriteFactory.new()

return SpriteFactory

