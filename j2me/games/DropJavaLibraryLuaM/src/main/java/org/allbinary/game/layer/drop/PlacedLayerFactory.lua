-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.drop

local PlacedLayerFactory = {}
package.loaded["org.allbinary.game.layer.drop.PlacedLayerFactory"] = PlacedLayerFactory

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

local AllBinaryLayerFactoryInterface = java_lazy("org.allbinary.layer.AllBinaryLayerFactoryInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")

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

-- class table PlacedLayerFactory is declared before the requires
PlacedLayerFactory.__index = PlacedLayerFactory
PlacedLayerFactory.className = "PlacedLayerFactory"
PlacedLayerFactory.javaClassName = "org.allbinary.game.layer.drop.PlacedLayerFactory"

function PlacedLayerFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function PlacedLayerFactory._jinit(self)
    PlacedLayerFactory._init_fields(self)
    return self
end

function PlacedLayerFactory.new(...)
    local self = setmetatable({}, PlacedLayerFactory)
    PlacedLayerFactory._jinit(self, ...)
    return self
end


function PlacedLayerFactory:clear()
        self.list:clear()
end


function PlacedLayerFactory.getInstance()
        return PlacedLayerFactory.instance_f
end


function PlacedLayerFactory:getSize()
        return self.list:size()
end


function PlacedLayerFactory:getRandomInstance()
        return self.basicArrayListUtil:getRandom(self.list)
end


function PlacedLayerFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

PlacedLayerFactory.instance_f = PlacedLayerFactory.new()

return PlacedLayerFactory

