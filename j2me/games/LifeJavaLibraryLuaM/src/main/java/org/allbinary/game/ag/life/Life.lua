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
-- package org.allbinary.game.ag.life

local Life = {}
package.loaded["org.allbinary.game.ag.life.Life"] = Life

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

local LifeInterface = require("org.allbinary.game.ag.life.LifeInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table Life is declared before the requires
Life.__index = Life
Life.className = "Life"
Life.javaClassName = "org.allbinary.game.ag.life.Life"
Life.java_implements = " LifeInterface "
Life.java_interfaces = function() return {LifeInterface} end

function Life:_init_fields()
    if self.lives == nil then self.lives = nil end
    if self.startLives == nil then self.startLives = nil end
    if self.maxlives == nil then self.maxlives = nil end
end


function Life.createLife()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", Life.new(0, 0) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(require("java.lang.RuntimeException").new(), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function Life._jinit(self, lives, maxlives)
    Life._init_fields(self)
        self.maxlives = maxlives
        if lives > self.maxlives then
            error(require("java.lang.Exception").new("To Many Lives"), 0)
        end
        self.lives = lives
        self.startLives = lives
    return self
end

function Life.new(...)
    local self = setmetatable({}, Life)
    Life._jinit(self, ...)
    return self
end


function Life:get()
        return self.lives
end


function Life:set(lives)
        self.lives = lives
end


function Life:reset()
        self.lives = self.startLives
end


function Life:add(lives)
        if not self:reachedLimit() then
            if self.lives + lives <= self:getMaxlives() then
                self.lives = (self.lives + lives)
            else
                self.lives = self:getMaxlives()
            end
        end
end


function Life:isAlive()
        if self.lives <= 0 then
            return false
        else
            return true
        end
end


function Life:getMaxlives()
        return self.maxlives
end


function Life:reachedLimit()
        if self.lives > self.maxlives or self.lives < 0 then
            return true
        else
            return false
        end
end


function Life:deaths(lives)
        if not self:reachedLimit() then
            if self.lives - lives >= 0 then
                self.lives = (self.lives - lives)
            else
                self.lives = 0
            end
        end
end


function Life:getStartLives()
        return self.startLives
end


function Life:setStartLives(startLives)
        self.startLives = startLives
end

Life.NO_LIFE = Life.createLife()

return Life

