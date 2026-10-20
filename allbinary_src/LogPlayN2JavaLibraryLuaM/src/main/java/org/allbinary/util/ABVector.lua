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

-- local Vector = require("java.util.Vector")
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

local ABVector = {}
ABVector.__index = ABVector
ABVector.className = "ABVector"
setmetatable(ABVector, {__index = Vector})

function ABVector.new()
    local self = setmetatable(Vector.new(), ABVector)
    return self
end


function ABVector:ensureCapacity(minCapacity)
        Vector.ensureCapacity(self, minCapacity)
end


function ABVector:capacity()
        return Vector.capacity(self)
end


function ABVector:size()
        return Vector.size(self)
end


function ABVector:isEmpty()
        return Vector.isEmpty(self)
end


function ABVector:contains(obj)
        return Vector.contains(self, obj)
end


function ABVector:indexOf(obj)
        return Vector.indexOf(self, obj)
end


function ABVector:lastIndexOf(obj)
        return Vector.lastIndexOf(self, obj)
end


function ABVector:elementAt(index)
        return Vector.elementAt(self, index)
end


function ABVector:firstElement()
        return Vector.firstElement(self)
end


function ABVector:lastElement()
        return Vector.lastElement(self)
end


function ABVector:setElementAt(obj, index)
        Vector.setElementAt(self, obj, index)
end


function ABVector:removeElementAt(index)
        Vector.removeElementAt(self, index)
end


function ABVector:addElement(obj)
        Vector.addElement(self, obj)
end


function ABVector:insertElementAt(obj, index)
        Vector.insertElementAt(self, obj, index)
end


function ABVector:removeElement(obj)
        return Vector.removeElement(self, obj)
end


function ABVector:removeAllElements()
        Vector.removeAllElements(self)
end


function ABVector:clone()
        return Vector.clone(self)
end


function ABVector:toArray()
        return Vector.toArray(self)
end


function ABVector:set(index, element)
        return Vector.set(self, index, element)
end


function ABVector:add(element)
        return Vector.add(self, element)
end


function ABVector:remove(obj)
        return Vector.remove(self, obj)
end


-- Java overloaded method: Lua keeps the last definition
function ABVector:add(index, element)
        Vector.add(self, index, element)
end


-- Java overloaded method: Lua keeps the last definition
function ABVector:remove(index)
        return Vector.remove(self, index)
end


function ABVector:clear()
        Vector.clear(self)
end


function ABVector:equals(obj)
        return Vector.equals(self, obj)
end
ABVector.__eq = function(self, other) return self:equals(other) end


function ABVector:hashCode()
        return Vector.hashCode(self)
end


function ABVector:toString()
        return tostring(Vector)
end
ABVector.__tostring = function(self) return self:toString() end


function ABVector:removeRange(fromIndex, toIndex)
        Vector.removeRange(self, fromIndex, toIndex)
end

return ABVector

