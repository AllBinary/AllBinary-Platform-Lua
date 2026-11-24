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
-- package org.allbinary.animation.image

local AnimationFactoryInitializationVisitor = {}
package.loaded["org.allbinary.animation.image.AnimationFactoryInitializationVisitor"] = AnimationFactoryInitializationVisitor

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table AnimationFactoryInitializationVisitor is declared before the requires
AnimationFactoryInitializationVisitor.__index = AnimationFactoryInitializationVisitor
AnimationFactoryInitializationVisitor.className = "AnimationFactoryInitializationVisitor"
AnimationFactoryInitializationVisitor.javaClassName = "org.allbinary.animation.image.AnimationFactoryInitializationVisitor"

function AnimationFactoryInitializationVisitor:_init_fields()
    if self.width == nil then self.width = 0 end
    if self.height == nil then self.height = 0 end
    if self.dx == nil then self.dx = 0 end
    if self.dy == nil then self.dy = 0 end
    if self.originalDx == nil then self.originalDx = 0 end
    if self.originalDy == nil then self.originalDy = 0 end
end

function AnimationFactoryInitializationVisitor._jinit(self)
    AnimationFactoryInitializationVisitor._init_fields(self)
    return self
end

function AnimationFactoryInitializationVisitor.new()
    return AnimationFactoryInitializationVisitor._jinit(setmetatable({}, AnimationFactoryInitializationVisitor))
end


function AnimationFactoryInitializationVisitor:visit()
end


function AnimationFactoryInitializationVisitor:toString()
        local commonSeps = CommonSeps.getInstance()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PositionStrings.getInstance().DX_LABEL):appendfloat((self.dx + 0.0))
        stringBuffer:append(PositionStrings.getInstance().DY_LABEL):appendfloat((self.dy + 0.0))
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self.width)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self.height)
        return tostring(stringBuffer)
end
AnimationFactoryInitializationVisitor.__tostring = function(self) return self:toString() end

return AnimationFactoryInitializationVisitor

