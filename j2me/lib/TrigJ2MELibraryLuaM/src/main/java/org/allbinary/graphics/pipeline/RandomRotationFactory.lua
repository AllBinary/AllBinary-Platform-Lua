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
-- package org.allbinary.graphics.pipeline

local RandomRotationFactory = {}
package.loaded["org.allbinary.graphics.pipeline.RandomRotationFactory"] = RandomRotationFactory

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

local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicGraphicsPipeline = java_lazy("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")

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

-- class table RandomRotationFactory is declared before the requires
RandomRotationFactory.__index = RandomRotationFactory
RandomRotationFactory.className = "RandomRotationFactory"
RandomRotationFactory.javaClassName = "org.allbinary.graphics.pipeline.RandomRotationFactory"

function RandomRotationFactory:_init_fields()
    self.myRandomFactory = MyRandomFactory.getInstance()
    self.angleFactory = AngleFactory.getInstance()
end

function RandomRotationFactory._jinit(self)
    RandomRotationFactory._init_fields(self)
    return self
end

function RandomRotationFactory.new()
    return RandomRotationFactory._jinit(setmetatable({}, RandomRotationFactory))
end


function RandomRotationFactory.getInstance()
        return RandomRotationFactory.instance_f
end


-- throws Exception
function RandomRotationFactory:getInstanceList(vector, howMuch)
        local graphicsPipe = BasicGraphicsPipeline.new(vector)
        graphicsPipe:createMatrix()
        graphicsPipe:rotateToAngle(self.angleFactory:getAt(self:getNextRandomAngle(howMuch)))
        return graphicsPipe:getMatrix()
end


function RandomRotationFactory:getNextRandomAngle(howMuch)
        return self.myRandomFactory:getNextInt(howMuch * 10)
end

RandomRotationFactory.instance_f = RandomRotationFactory.new()

return RandomRotationFactory

