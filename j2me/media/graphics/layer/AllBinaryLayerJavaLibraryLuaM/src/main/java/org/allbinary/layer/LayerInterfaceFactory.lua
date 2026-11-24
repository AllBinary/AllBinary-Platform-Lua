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
-- package org.allbinary.layer

local LayerInterfaceFactory = {}
package.loaded["org.allbinary.layer.LayerInterfaceFactory"] = LayerInterfaceFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local Layer = java_lazy("org.allbinary.layer.Layer")
local LayerInterfaceFactoryInterface = java_lazy("org.allbinary.layer.LayerInterfaceFactoryInterface")

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

-- class table LayerInterfaceFactory is declared before the requires
LayerInterfaceFactory.__index = LayerInterfaceFactory
LayerInterfaceFactory.className = "LayerInterfaceFactory"
LayerInterfaceFactory.javaClassName = "org.allbinary.layer.LayerInterfaceFactory"

function LayerInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.HASHTABLE_LABEL = "Hashtable: "
end

function LayerInterfaceFactory._jinit(self)
    LayerInterfaceFactory._init_fields(self)
    return self
end

function LayerInterfaceFactory.new()
    return LayerInterfaceFactory._jinit(setmetatable({}, LayerInterfaceFactory))
end


function LayerInterfaceFactory.getInstance()
        return LayerInterfaceFactory.SINGLETON
end


function LayerInterfaceFactory:init()
        self.list = BasicArrayListD.new()
end


-- throws Exception
function LayerInterfaceFactory:getNexInstance(hashtable, x, y, z)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(self.HASHTABLE_LABEL):append(StringUtil.getInstance():toString(hashtable))), self, commonStrings.GET_INSTANCE)
        local typeInteger = hashtable:get(Layer.ID)
        local layerInterfaceFactoryInterface = self.list.objectArray[math.tointeger(typeInteger // 1) - 1 + 1]
        return layerInterfaceFactoryInterface:getNextInstance(hashtable, x, y, z)
end


function LayerInterfaceFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

LayerInterfaceFactory.SINGLETON = LayerInterfaceFactory.new()

return LayerInterfaceFactory

