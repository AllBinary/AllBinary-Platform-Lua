-- Generated Code Do Not Modify
-- package org.allbinary.animation

local FixedPoint = {}
package.loaded["org.allbinary.animation.FixedPoint"] = FixedPoint

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


-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table FixedPoint is declared before the requires
FixedPoint.__index = FixedPoint
FixedPoint.className = "FixedPoint"
FixedPoint.javaClassName = "org.allbinary.animation.FixedPoint"

function FixedPoint:_init_fields()
    self.ONE = (((((1) << ((16) & 31)) + 0x80000000) & 0xffffffff) - 0x80000000)
end

function FixedPoint._jinit(self)
    FixedPoint._init_fields(self)
    return self
end

function FixedPoint.new()
    return FixedPoint._jinit(setmetatable({}, FixedPoint))
end


function FixedPoint.getInstance()
        return FixedPoint.instance_f
end


function FixedPoint:toFixed_j1_1(val)
        return java_int((val * 65536.0))
end


function FixedPoint:toFixed_j1_2(val)
        return java_int((val * 65536.0))
end
function FixedPoint:toFixed(...)
    local count = select("#", ...)
    if count == 1 then return self:toFixed_j1(...) end
    error("No method toFixed takes " .. count .. " arguments")
end
FixedPoint.toFixed__jdispatcher = FixedPoint.toFixed
function FixedPoint:toFixed_j1(...)
    local java_a1 = ...
    if true and type(java_a1) == "number" then return FixedPoint.toFixed_j1_1(self, ...) end
    return FixedPoint.toFixed_j1_2(self, ...)
end


function FixedPoint:mul(a, b)
        return ((((a * b)) // (1 << (16))))
end


function FixedPoint:div(a, b)
        return (java_idiv(((a) << 16), b))
end


function FixedPoint:toInt(fixed)
        return ((fixed) // (1 << (16)))
end

FixedPoint.instance_f = FixedPoint.new()

return FixedPoint

