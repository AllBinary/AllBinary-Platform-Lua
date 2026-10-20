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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Life = {}
Life.__index = Life
Life.className = "Life"

function Life:_init_fields()
    self.lives = nil
    self.startLives = nil
    self.maxlives = nil
end


function Life.createLife()
        local try_ok, try_error = pcall(function()
            return Life.new(0, 0)
        end)
        if not try_ok then
            local e = try_error
            error(java_exception("RuntimeException"), 0)
        end
end


function Life.new(lives, maxlives)
    local self = setmetatable({}, Life)
    self:_init_fields()
        self.maxlives = maxlives
        if lives > self.maxlives then
            error(java_exception("Exception", "To Many Lives"), 0)
        end
        self.lives = lives
        self.startLives = lives
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

