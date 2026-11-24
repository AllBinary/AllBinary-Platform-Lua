-- Generated Code Do Not Modify
-- package org.allbinary.logic.string

local StringMaker = {}
package.loaded["org.allbinary.logic.string.StringMaker"] = StringMaker

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")

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

-- class table StringMaker is declared before the requires
StringMaker.__index = StringMaker
StringMaker.className = "StringMaker"
StringMaker.javaClassName = "org.allbinary.logic.string.StringMaker"

function StringMaker:_init_fields()
    if self.charArray == nil then self.charArray = nil end
    if self.currentLength == nil then self.currentLength = 0 end
end


function StringMaker._jinit(self)
    StringMaker._init_fields(self)
        self.charArray = java_new_array("\0", 20)
    return self
end

function StringMaker.new(...)
    local self = setmetatable({}, StringMaker)
    StringMaker._jinit(self, ...)
    return self
end


function StringMaker:append(string_)
        local stringLength = #string_
        self:ensureCapacity(self.currentLength + stringLength)
        ;(function(text, first, last, destination, offset) for index = first, last - 1 do destination[offset + index - first + 1] = string.sub(text, index + 1, index + 1) end end)(string_, 0, stringLength, self.charArray, self.currentLength)
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
        return (function(value, offset, count) local parts = {} for index = offset + 1, offset + count do local item = value[index] if type(item) == "string" then parts[#parts + 1] = item else parts[#parts + 1] = string.char(item & 0xFF) end end return table.concat(parts) end)(self.charArray, 0, self.currentLength)
end
StringMaker.__tostring = function(self) return self:toString() end

return StringMaker

