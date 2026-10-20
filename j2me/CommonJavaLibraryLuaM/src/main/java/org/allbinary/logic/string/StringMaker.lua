-- Generated Code Do Not Modify
-- package org.allbinary.logic.string

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local StringMaker = {}
StringMaker.__index = StringMaker
StringMaker.className = "StringMaker"

function StringMaker:_init_fields()
    self.charArray = nil
    self.currentLength = 0
end


function StringMaker.new()
    local self = setmetatable({}, StringMaker)
    self:_init_fields()
        self.charArray = java_new_array("\0", 20)
    return self
end


function StringMaker:append(string)
        local stringLength = #string
        self:ensureCapacity(self.currentLength + stringLength)
        string:getChars(0, stringLength, self.charArray, self.currentLength)
        self.currentLength = self.currentLength + (stringLength)
        return self
end


function StringMaker:appendchar(c)
        self:ensureCapacity(self.currentLength + 1)
        self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = c
        return self
end


function StringMaker:appendCharArray(charArray, start, end_)
        self:ensureCapacity(self.currentLength + (end_ - start))
        for index = start, end_ - 1 do
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = charArray[index + 1]
        end
        return self
end


function StringMaker:appendbyte(b)
        self:append(tostring(b))
        return self
end


function StringMaker:appendshort(b)
        self:append(tostring(b))
        return self
end


function StringMaker:appendint(i)
        self:append(tostring(i))
        return self
end


function StringMaker:appendlong(l)
        self:append(tostring(l))
        return self
end


function StringMaker:appendfloat(f)
        self:append(tostring(f))
        return self
end


function StringMaker:appendboolean(bool)
        if bool then
            self:ensureCapacity(self.currentLength + 4)
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "t"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "r"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "u"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "e"
        else
            self:ensureCapacity(self.currentLength + 5)
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "f"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "a"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "l"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "s"
            self.charArray[(function() local value = self.currentLength self.currentLength = value + 1 return value end)() + 1] = "e"
        end
        return self
end


function StringMaker:ensureCapacity(minSize)
        local oldCapacity = (self.charArray.n or #self.charArray)
        if minSize > oldCapacity then
            local newCapacity = oldCapacity * 3
            if newCapacity < minSize then
                newCapacity = minSize
            end
            local copy = java_new_array("\0", newCapacity)
            local min = self:min((self.charArray.n or #self.charArray), newCapacity)
            table.move(self.charArray, (0) + 1, (0) + (min), (0) + 1, copy)
            self.charArray = copy
        end
end


function StringMaker:min(value, value2)
        return (function() if (value <= value2) then return value else return value2 end end)()
end


function StringMaker:delete(start, end_)
        self.currentLength = self.currentLength - ((end_ - start))
        return self
end


function StringMaker:length()
        return self.currentLength
end


function StringMaker:toString()
        return String.new(self.charArray, 0, self.currentLength)
end
StringMaker.__tostring = function(self) return self:toString() end

return StringMaker

