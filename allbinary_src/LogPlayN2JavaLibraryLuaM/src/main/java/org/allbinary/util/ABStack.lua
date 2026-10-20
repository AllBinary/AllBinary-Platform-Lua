-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.util

-- local Stack = require("java.util.Stack")
local JsType = require("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABStack = {}
ABStack.__index = ABStack
ABStack.className = "ABStack"
setmetatable(ABStack, {__index = Stack})

function ABStack.new()
    local self = setmetatable(Stack.new(), ABStack)
    return self
end


function ABStack:push(item)
        return Stack.push(self, item)
end


function ABStack:pop()
        return Stack.pop(self)
end


function ABStack:peek()
        return Stack.peek(self)
end


function ABStack:empty()
        return Stack.empty(self)
end


function ABStack:search(obj)
        return Stack.search(self, obj)
end


function ABStack:removeElement(obj)
        return Stack.removeElement(self, obj)
end

return ABStack

