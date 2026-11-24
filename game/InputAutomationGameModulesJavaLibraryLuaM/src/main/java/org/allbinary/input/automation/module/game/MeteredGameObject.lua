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
-- package org.allbinary.input.automation.module.game

local MeteredGameObject = {}
package.loaded["org.allbinary.input.automation.module.game.MeteredGameObject"] = MeteredGameObject

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local MeteredGameObjectInterface = require("org.allbinary.input.automation.module.game.MeteredGameObjectInterface")
local GraphicsAnalysisUtil = java_lazy("org.allbinary.input.automation.module.game.GraphicsAnalysisUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table MeteredGameObject is declared before the requires
MeteredGameObject.__index = MeteredGameObject
MeteredGameObject.className = "MeteredGameObject"
MeteredGameObject.javaClassName = "org.allbinary.input.automation.module.game.MeteredGameObject"
MeteredGameObject.java_implements = " MeteredGameObjectInterface "
MeteredGameObject.java_interfaces = function() return {MeteredGameObjectInterface} end

function MeteredGameObject:_init_fields()
    if self.ratios == nil then self.ratios = nil end
    self.good = false
    self.dropping = false
    if self.minX == nil then self.minX = nil end
    if self.maxX == nil then self.maxX = nil end
    if self.y == nil then self.y = nil end
    if self.size_f == nil then self.size_f = nil end
    self.RATIOS_LABEL = "Ratios: "
    self.IS_GOOD_LABEL = "isGood: "
    self.IS_DROPPPING_LABEL = "isDropping: "
end


function MeteredGameObject._jinit(self, bufferedImage, minX, maxX, y)
    MeteredGameObject._init_fields(self)
        self:setRatios(java_new_array(nil, (bufferedImage.n or #bufferedImage)))
        self:setMinX(minX)
        self:setMaxX(maxX)
        self:setY(y)
        self:setSize(maxX - minX)
        for index = 0, (bufferedImage.n or #bufferedImage) - 1 do
            local nominator = GraphicsAnalysisUtil.getNominator(bufferedImage[index + 1], self:getMinX(), self:getMaxX(), self:getY())
            self:getRatios()[index + 1] = nominator / self:getSize()
        end
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) > 0.93 then
            self:setGood(true)
        else
            self:setGood(false)
        end
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) < (self:getRatios()[1] + 0.0) then
            self:setDropping(true)
        else
            self:setDropping(false)
        end
    return self
end

function MeteredGameObject.new(...)
    local self = setmetatable({}, MeteredGameObject)
    MeteredGameObject._jinit(self, ...)
    return self
end


function MeteredGameObject:isGood()
        return self.good
end


function MeteredGameObject:setGood(good)
        self.good = good
end


function MeteredGameObject:isDropping()
        return self.dropping
end


function MeteredGameObject:setDropping(dropping)
        self.dropping = dropping
end


function MeteredGameObject:getRatios()
        return self.ratios
end


function MeteredGameObject:toString()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.RATIOS_LABEL)
        for index = 0, (self:getRatios().n or #self:getRatios()) - 1 do
            stringBuffer:append(tostring(self:getRatios()[index + 1]))
            if index < (self:getRatios().n or #self:getRatios()) - 1 then
                stringBuffer:append(commonSeps.COMMA_SEP)
            end
        end
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_GOOD_LABEL)
        stringBuffer:appendboolean(self:isGood())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_DROPPPING_LABEL)
        stringBuffer:appendboolean(self:isDropping())
        return tostring(stringBuffer)
end
MeteredGameObject.__tostring = function(self) return self:toString() end


function MeteredGameObject:setRatios(ratios)
        self.ratios = ratios
end


function MeteredGameObject:getMinX()
        return self.minX
end


function MeteredGameObject:setMinX(minX)
        self.minX = minX
end


function MeteredGameObject:getMaxX()
        return self.maxX
end


function MeteredGameObject:setMaxX(maxX)
        self.maxX = maxX
end


function MeteredGameObject:getY()
        return self.y
end


function MeteredGameObject:setY(y)
        self.y = y
end


function MeteredGameObject:getSize()
        return self.size_f
end


function MeteredGameObject:setSize(size)
        self.size_f = size
end

return MeteredGameObject

